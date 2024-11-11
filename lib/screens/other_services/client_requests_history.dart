import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class ClientRequestsHistoryPage extends StatefulWidget {
  @override
  _ClientRequestsHistoryPageState createState() => _ClientRequestsHistoryPageState();
}

class _ClientRequestsHistoryPageState extends State<ClientRequestsHistoryPage> {
  final int itemsPerPage = 5;
  int currentPage = 1;
  List<DocumentSnapshot> allRequests = [];

  @override
  void initState() {
    super.initState();
    _loadClientRequests();
  }

  Future<void> _loadClientRequests() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      print('البريد الإلكتروني للمستخدم: ${user.email}');
      try {
        QuerySnapshot snapshot = await FirebaseFirestore.instance
            .collection('content_requests')
            .where('email', isEqualTo: user.email)
            .orderBy('Timestamp', descending: true)
            .get();
        print('عدد الطلبات المسترجعة: ${snapshot.docs.length}');
        setState(() {
          allRequests = snapshot.docs;
        });
      } catch (e) {
        print('خطأ في استدعاء الطلبات: $e');
      }
    } else {
      print('User not logged in');
    }
  }

  @override
  Widget build(BuildContext context) {
    final int totalItems = allRequests.length;
    final int startIndex = (currentPage - 1) * itemsPerPage;
    final int endIndex = startIndex + itemsPerPage;
    final List<DocumentSnapshot> currentRequests = allRequests.sublist(
      startIndex,
      endIndex > totalItems ? totalItems : endIndex,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('الطلبات السابقة', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF800080),
      ),
      body: totalItems == 0
          ? Center(
        child: Text(
          'لا توجد طلبات سابقة في الوقت الحالي.',
          style: TextStyle(fontSize: 18),
        ),
      )
          : Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: currentRequests.length,
              itemBuilder: (context, index) {
                final request = currentRequests[index].data() as Map<String, dynamic>;
                final contentDetails = request['contentDetails'] ?? 'تفاصيل غير متوفرة';
                final status = request['status'] ?? 'الحالة غير معروفة';
                final timestamp = request['Timestamp'] != null ? (request['Timestamp'] as Timestamp).toDate() : null;
                final formattedDate = timestamp != null ? '${timestamp.day}-${timestamp.month}-${timestamp.year} ${timestamp.hour}:${timestamp.minute}' : 'تاريخ غير متوفر';
                final requestId = currentRequests[index].id;
                final facebookLink = request['facebookLink'] ?? 'رابط غير متوفر';
                final responseDetails = request['responseDetails'] ?? null;
                final statusEditing = request.containsKey('status_editing') ? request['status_editing'] : 'unused';
                final notes = request['notes'] ?? null;
                final contentDetailsEdit = request['contentDetails_edit'] ?? null;
                final responseDetails2 = request['responseDetails2'] ?? null;

                if (!request.containsKey('status_editing')) {
                  FirebaseFirestore.instance.collection('content_requests').doc(requestId).update({'status_editing': 'unused'});
                }

                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: ExpansionTile(
                    title: Text(
                      'طلب العميل رقم ${startIndex + index + 1}',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF800080)),
                    ),
                    subtitle: Text(
                      'حالة الطلب: $status',
                      style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 4),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'رقم الطلب (ID):',
                                  style: TextStyle(fontSize: 16, color: Color(0xFF800080), fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    requestId,
                                    style: TextStyle(fontSize: 16, color: Colors.black87),
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(Icons.copy, color: Color(0xFF800080)),
                                  onPressed: () {
                                    Clipboard.setData(ClipboardData(text: requestId));
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('تم نسخ رقم الطلب')),
                                    );
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: 4),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'تفاصيل الطلب:',
                                  style: TextStyle(fontSize: 16, color: Color(0xFF800080), fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    contentDetails,
                                    style: TextStyle(fontSize: 16, color: Colors.black87),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 4),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'رابط الفيسبوك:',
                                  style: TextStyle(fontSize: 16, color: Color(0xFF800080), fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    facebookLink,
                                    style: TextStyle(fontSize: 16, color: Colors.blue),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 4),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'التاريخ:',
                                  style: TextStyle(fontSize: 16, color: Color(0xFF800080), fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    formattedDate,
                                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                                  ),
                                ),
                              ],
                            ),
                            if (responseDetails != null && responseDetails.isNotEmpty) ...[
                              SizedBox(height: 4),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'الرد من الإدارة:',
                                    style: TextStyle(fontSize: 16, color: Colors.green[800], fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      responseDetails,
                                      style: TextStyle(fontSize: 16, color: Colors.black87),
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.copy, color: Color(0xFF800080)),
                                    onPressed: () {
                                      Clipboard.setData(ClipboardData(text: responseDetails));
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text('تم نسخ الرد من الإدارة')),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ],
                            if (notes != null && notes.isNotEmpty) ...[
                              SizedBox(height: 4),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'ملاحظات:',
                                    style: TextStyle(fontSize: 16, color: Colors.green[800], fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      notes,
                                      style: TextStyle(fontSize: 16, color: Colors.black87),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                            if (contentDetailsEdit != null && contentDetailsEdit.isNotEmpty) ...[
                              SizedBox(height: 4),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'طلب تعديل:',
                                    style: TextStyle(fontSize: 16, color: Color(0xFF800080), fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      contentDetailsEdit,
                                      style: TextStyle(fontSize: 16, color: Colors.black87),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                            if (responseDetails2 != null && responseDetails2.isNotEmpty) ...[
                              SizedBox(height: 4),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'الرد على التعديل:',
                                    style: TextStyle(fontSize: 16, color: Colors.green[800], fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      responseDetails2,
                                      style: TextStyle(fontSize: 16, color: Colors.black87),
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.copy, color: Color(0xFF800080)),
                                    onPressed: () {
                                      Clipboard.setData(ClipboardData(text: responseDetails2));
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text('تم نسخ الرد على التعديل')),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ],
                            SizedBox(height: 16),
                            if (statusEditing == 'unused')
                              ElevatedButton(
                                onPressed: () {
                                  _showEditRequestDialog(requestId);
                                },
                                child: Text('طلب تعديل', style: TextStyle(color: Colors.white)),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF800080),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          PaginationControl(
            currentPage: currentPage,
            itemsPerPage: itemsPerPage,
            totalItems: totalItems,
            onPageChanged: (page) {
              setState(() {
                currentPage = page;
              });
            },
          ),
        ],
      ),
    );
  }

  void _showEditRequestDialog(String requestId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: Text('طلب تعديل المحتوى', style: TextStyle(color: Color(0xFF800080)))),
          content: Text('طلب تعديل المحتوي الواحد متاح مرة واحدة فقط. هل انت متأكد من انك تريد تعديل المحتوي؟'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('لا'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                _showEditContentDialog(requestId);
              },
              child: Text('نعم', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF800080),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showEditContentDialog(String requestId) {
    TextEditingController editController = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: Text('تعديل المحتوى', style: TextStyle(color: Color(0xFF800080)))),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: editController,
                maxLines: 3,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'اكتب تفاصيل التعديل هنا',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('إلغاء'),
            ),
            ElevatedButton(
              onPressed: () async {
                String editDetails = editController.text;
                if (editDetails.isNotEmpty) {
                  await FirebaseFirestore.instance
                      .collection('content_requests')
                      .doc(requestId)
                      .update({'contentDetails_edit': editDetails, 'status_editing': 'used'});
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('تم إرسال طلب التعديل بنجاح')),
                  );
                }
              },
              child: Text('إرسال طلب التعديل', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF800080),
              ),
            ),
          ],
        );
      },
    );
  }
}

class PaginationControl extends StatelessWidget {
  final int currentPage;
  final int itemsPerPage;
  final int totalItems;
  final Function(int) onPageChanged;

  PaginationControl({
    required this.currentPage,
    required this.itemsPerPage,
    required this.totalItems,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    int totalPages = (totalItems / itemsPerPage).ceil();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(totalPages, (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: ElevatedButton(
              onPressed: () {
                onPageChanged(index + 1);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: index + 1 == currentPage ? Color(0xFF800080) : Colors.grey,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              child: Text(
                '${index + 1}',
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        }),
      ),
    );
  }
}
