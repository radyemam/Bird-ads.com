import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:untitled5/screens/other_services/other_services_page.dart';
import 'package:untitled5/widgets/loading_screen.dart';
import 'package:untitled5/widgets/bottom_nav_bar.dart';
import 'package:untitled5/screens/home_page.dart';
import 'package:untitled5/screens/wallet/wallet_screen.dart';
import 'package:untitled5/screens/settings/settings_page.dart';

class ClientRequestsHistoryPage extends StatefulWidget {
  @override
  _ClientRequestsHistoryPageState createState() => _ClientRequestsHistoryPageState();
}

class _ClientRequestsHistoryPageState extends State<ClientRequestsHistoryPage> {
  final int itemsPerPage = 5;
  int currentPage = 1;
  int _selectedIndex = 0;
  List<DocumentSnapshot> allRequests = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadClientRequests();
  }

  Future<void> _loadClientRequests() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      print('البريد الإلكتروني للمستخدم: \${user.email}');
      try {
        // استدعاء بيانات content_requests
        QuerySnapshot contentRequestsSnapshot = await FirebaseFirestore.instance
            .collection('content_requests')
            .where('email', isEqualTo: user.email)
            .get();

        // استدعاء بيانات design_requests
        QuerySnapshot designRequestsSnapshot = await FirebaseFirestore.instance
            .collection('design_requests')
            .where('email', isEqualTo: user.email)
            .get();

        // استدعاء بيانات video_requests
        QuerySnapshot videoRequestsSnapshot = await FirebaseFirestore.instance
            .collection('video_requests')
            .where('email', isEqualTo: user.email)
            .get();

        // استدعاء بيانات pages_ready_requests
        QuerySnapshot pagesReadyRequestsSnapshot = await FirebaseFirestore.instance
            .collection('pages_ready_requests')
            .where('email', isEqualTo: user.email)
            .get();

        // دمج المستندات من content_requests و design_requests و video_requests و pages_ready_requests
        List<DocumentSnapshot> combinedRequests = [
          ...contentRequestsSnapshot.docs,
          ...designRequestsSnapshot.docs,
          ...videoRequestsSnapshot.docs,
          ...pagesReadyRequestsSnapshot.docs
        ];

        // ترتيب المستندات بناءً على timestamp بشكل تنازلي
        combinedRequests.sort((a, b) {
          var dataA = a.data() as Map<String, dynamic>?;
          var dataB = b.data() as Map<String, dynamic>?;

          Timestamp timestampA = dataA != null && (dataA.containsKey('timestamp') || dataA.containsKey('Timestamp'))
              ? (dataA['timestamp'] ?? dataA['Timestamp'])
              : Timestamp(0, 0);
          Timestamp timestampB = dataB != null && (dataB.containsKey('timestamp') || dataB.containsKey('Timestamp'))
              ? (dataB['timestamp'] ?? dataB['Timestamp'])
              : Timestamp(0, 0);
          return timestampB.compareTo(timestampA);
        });

        setState(() {
          allRequests = combinedRequests;
          isLoading = false;
        });
      } catch (e) {
        print('خطأ في استدعاء الطلبات: $e');
        setState(() {
          isLoading = false;
        });
      }
    } else {
      print('User not logged in');
      setState(() {
        isLoading = false;
      });
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => _getSelectedPage()),
    );
  }

  Widget _getSelectedPage() {
    switch (_selectedIndex) {
      case 0:
        return HomePage();
      case 1:
        return WalletScreen();
      case 2:
        return SettingsPage();
      default:
        return HomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return LoadingScreen();
    }

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
                final contentDetails = request.containsKey('contentDetails') ? request['contentDetails'] : request['description'] ?? 'تفاصيل غير متوفرة';
                final status = request['status'] ?? 'الحالة غير معروفة';
                final timestamp = request.containsKey('timestamp') ? (request['timestamp'] as Timestamp).toDate() : request.containsKey('Timestamp') ? (request['Timestamp'] as Timestamp).toDate() : null;
                final formattedDate = timestamp != null ? '${timestamp.day}-${timestamp.month}-${timestamp.year} ${timestamp.hour}:${timestamp.minute}' : 'تاريخ غير متوفر';
                final requestId = currentRequests[index].id;
                final facebookLink = request['facebookLink'] ?? 'رابط غير متوفر';
                final responseDetails = request['responseDetails'] ?? null;
                final statusEditing = request.containsKey('status_editing') ? request['status_editing'] : 'unused';
                final notes = request['notes'] ?? null;
                final contentDetailsEdit = request['contentDetails_edit'] ?? null;
                final responseDetails2 = request['responseDetails2'] ?? null;
                final selectedFollowers = request['selectedFollowers'] ?? 'غير متوفر';
                final pageName = request['pageName'] ?? 'غير متوفر';

                if (!request.containsKey('status_editing')) {
                  FirebaseFirestore.instance.collection(currentRequests[index].reference.parent.id).doc(requestId).update({'status_editing': 'unused'});
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
                            SizedBox(height: 4),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'اسم الصفحة:',
                                  style: TextStyle(fontSize: 16, color: Color(0xFF800080), fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    pageName,
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
                                  'المتابعين المختارين:',
                                  style: TextStyle(fontSize: 16, color: Color(0xFF800080), fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    selectedFollowers,
                                    style: TextStyle(fontSize: 16, color: Colors.black87),
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
                                  _showEditRequestDialog(requestId, currentRequests[index].reference.parent.id);
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
      bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  void _showEditRequestDialog(String requestId, String collectionId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: Text('طلب تعديل', style: TextStyle(color: Color(0xFF800080)))),
          content: Text('طلب التعديل متاح مرة واحدة فقط. هل انت متأكد من انك تريد تعديل هذا الطلب؟'),
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
                _showEditContentDialog(requestId, collectionId);
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

  void _showEditContentDialog(String requestId, String collectionId) {
    TextEditingController editController = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: Text('طلب التعديل', style: TextStyle(color: Color(0xFF800080)))),
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
                      .collection(collectionId)
                      .doc(requestId)
                      .update({'contentDetails_edit': editDetails, 'status_editing': 'used'});
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('تم إرسال طلب التعديل بنجاح')),
                  );

                  // تحويل المستخدم لصفحة الخدمات الأخرى
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => OtherServicesPage()),
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
