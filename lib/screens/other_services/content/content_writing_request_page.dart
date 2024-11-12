  //lib/screens/other_services/content_writing_request_page.dart
  import 'package:flutter/material.dart';
  import 'package:cloud_firestore/cloud_firestore.dart';
  import 'package:firebase_auth/firebase_auth.dart';
  import 'package:shared_preferences/shared_preferences.dart';
  import 'package:untitled5/screens/wallet/add_balance_page.dart';
  import 'package:untitled5/screens/other_services/client_requests_history.dart';
  import '../other_services_page.dart';
  
  class ContentWritingRequestPage extends StatefulWidget {
    @override
    _ContentWritingRequestPageState createState() => _ContentWritingRequestPageState();
  }
  
  class _ContentWritingRequestPageState extends State<ContentWritingRequestPage> {
    final TextEditingController contentDetailsController = TextEditingController();
    final TextEditingController facebookLinkController = TextEditingController();
    double currentBalance = 0.0;
    String balanceWarningMessage = '';
  
    @override
    void initState() {
      super.initState();
      _loadUserBalance();
      _loadSavedDetails();
    }
  
    Future<void> _loadUserBalance() async {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final userId = user.uid;
        final userDoc = await FirebaseFirestore.instance.collection('clients').doc(userId).get();
        if (userDoc.exists) {
          setState(() {
            currentBalance = userDoc['total_balance']?.toDouble() ?? 0.0;
          });
        }
      }
    }
  
    Future<void> _loadSavedDetails() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      setState(() {
        contentDetailsController.text = prefs.getString('contentDetails') ?? '';
        facebookLinkController.text = prefs.getString('facebookLink') ?? '';
      });
    }
  
    Future<void> _saveDetails() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('contentDetails', contentDetailsController.text);
      await prefs.setString('facebookLink', facebookLinkController.text);
    }
  
    Future<void> _deductBalance(double amount) async {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final userId = user.uid;
        final userDoc = await FirebaseFirestore.instance.collection('clients').doc(userId).get();
        if (userDoc.exists) {
          double newBalance = currentBalance - amount;
          await FirebaseFirestore.instance.collection('clients').doc(userId).update({'total_balance': newBalance});
          setState(() {
            currentBalance = newBalance;
          });
          // تسجيل عملية الخصم في الفاير بيز
          await FirebaseFirestore.instance.collection('statement').add({
            'ID client': userId,
            'first name': userDoc['firstName'] ?? '',
            'last name': userDoc['lastName'] ?? '',
            'email': user.email,
            'addition_amount': 0,
            'deduction_amount': amount,
            'timestamp': Timestamp.now(),
            'transaction_name': 'تكلفة كتابة محتوي',
          });
        }
      }
    }
  
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('طلب خدمة كتابة المحتوى', style: TextStyle(color: Colors.white)),
          backgroundColor: Color(0xFF800080),
        ),
        body: Builder(
          builder: (BuildContext scaffoldContext) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.edit, size: 100, color: Color(0xFF800080)),
                    SizedBox(height: 20),
                    Text(
                      'هذه صفحة طلب خدمة كتابة المحتوى.',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'برجاء ملء البيانات المطلوبة لبدء الخدمة.',
                      style: TextStyle(fontSize: 18, color: Colors.black54),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 30),
                    Text(
                      'تفاصيل المحتوى المطلوب:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: contentDetailsController,
                      maxLines: 5,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'يرجى كتابة تفاصيل المحتوى أو وصف كامل أو محتوى سابق',
                      ),
                      onChanged: (value) => _saveDetails(),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'رابط الفيسبوك أو البوست السابق:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: facebookLinkController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'يرجى إدخال رابط صفحة الفيسبوك أو رابط بوست سابق لاستخراج المعلومات',
                      ),
                      onChanged: (value) => _saveDetails(),
                    ),
                    SizedBox(height: 30),
                    if (balanceWarningMessage.isNotEmpty)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              balanceWarningMessage,
                              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(width: 10),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => AddBalancePage()),
                              );
                            },
                            child: Text('إضافة رصيد', style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      ),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF800080),
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                        ),
                        onPressed: () async {
                          final user = FirebaseAuth.instance.currentUser;
                          if (user != null) {
                            double requiredBudget = 60.0; // تكلفة الخدمة
  
                            if (currentBalance < requiredBudget) {
                              // عرض تحذير بخصوص الرصيد غير الكافي
                              setState(() {
                                balanceWarningMessage = 'رصيدك الحالي هو $currentBalance جنيه. برجاء شحن الرصيد للاستمرار.';
                              });
                            } else {
                              // عرض رسالة التأكيد
                              showDialog(
                                context: scaffoldContext,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('تأكيد الخصم'),
                                    content: Text('سيتم خصم $requiredBudget جنيه من رصيدك تكلفة الخدمة. هل ترغب في المتابعة؟'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('إلغاء', style: TextStyle(color: Colors.red)),
                                      ),
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          backgroundColor: Color(0xFF800080),
                                          foregroundColor: Colors.white,
                                        ),
                                        onPressed: () async {
                                          Navigator.of(context).pop();
                                          // خصم الرصيد
                                          await _deductBalance(requiredBudget);
  
                                          // إضافة طلب الكتابة إلى Firestore
                                          final userId = user.uid;
                                          final userDoc = await FirebaseFirestore.instance.collection('clients').doc(userId).get();
                                          if (userDoc.exists) {
                                            final userData = userDoc.data();
                                            final requestId = FirebaseFirestore.instance.collection('content_requests').doc().id;
                                            await FirebaseFirestore.instance.collection('content_requests').add({
                                              'requestId': requestId,
                                              'firstName': userData?['firstName'] ?? '',
                                              'lastName': userData?['lastName'] ?? '',
                                              'email': userData?['email'] ?? '',
                                              'phone': userData?['phone'] ?? '',
                                              'contentDetails': contentDetailsController.text,
                                              'facebookLink': facebookLinkController.text,
                                              'status': 'قيد التنفيذ',
                                              'Timestamp': Timestamp.now(),
                                              'responseDetails': '',
                                              'responseDetails2': '',
                                              'contentDetails_edit': '',
                                              'status_editing': 'unused',
                                              'notes': '',
                                            });
  
                                            // Adding notification to Firestore
                                            await FirebaseFirestore.instance.collection('notifications').add({
                                              'email': userData?['email'] ?? '',
                                              'message': 'تم إرسال طلب كتابة محتوى جديد',
                                              'timestamp': Timestamp.now(),
                                              'isRead': false,
                                            });
  
                                            // عرض رسالة نجاح بعد تقديم الطلب وتحويل المستخدم
                                            showDialog(
                                              context: scaffoldContext,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: Text('تم إرسال الطلب'),
                                                  content: Text('تم إرسال طلبك للإدارة بنجاح. برجاء متابعة قسم الطلبات السابقة.'),
                                                  actions: [
                                                    TextButton(
                                                      style: TextButton.styleFrom(
                                                        backgroundColor: Color(0xFF800080),
                                                      ),
                                                      onPressed: () {
                                                        Navigator.of(context).pop();
                                                        Navigator.push(
                                                          scaffoldContext,
                                                          MaterialPageRoute(builder: (context) => ClientRequestsHistoryPage()),
                                                        );
                                                      },
                                                      child: Text('أوكيه', style: TextStyle(color: Colors.white)),
                                                    )
                                                  ],
                                                );
                                              },
                                            );
                                          }
                                        },
                                        child: Text('موافق', style: TextStyle(color: Colors.white)),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          }
                        },
                        child: Text('اطلب الخدمة', style: TextStyle(fontSize: 18)),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    }
  }
