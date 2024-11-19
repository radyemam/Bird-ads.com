//lib/screens/other_services/pages_ready/pages_ready_request_page.dart
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled5/screens/wallet/add_balance_page.dart';
import 'package:untitled5/screens/other_services/client_requests_history.dart';
import 'package:untitled5/widgets/loading_screen.dart';

class PagesReadyRequestPage extends StatefulWidget {
  @override
  _PagesReadyRequestPageState createState() => _PagesReadyRequestPageState();
}

class _PagesReadyRequestPageState extends State<PagesReadyRequestPage> {
  String selectedFollowers = '';
  final TextEditingController pageNameController = TextEditingController();
  final TextEditingController accountLinkController = TextEditingController();
  final TextEditingController notesController = TextEditingController();
  String errorMessage = '';
  double currentBalance = 0.0;

  @override
  void initState() {
    super.initState();
    _loadUserBalance();
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
        await FirebaseFirestore.instance.collection('statement').add({
          'ID client': userId,
          'first name': userDoc['firstName'] ?? '',
          'last name': userDoc['lastName'] ?? '',
          'email': user.email,
          'addition_amount': 0,
          'deduction_amount': amount,
          'timestamp': Timestamp.now(),
          'transaction_name': 'تكلفة صفحة فيس بوك جاهزة',
        });
      }
    }
  }

  void _submitRequest() async {
    if (selectedFollowers.isEmpty) {
      setState(() {
        errorMessage = 'برجاء اختيار عدد المتابعين';
      });
      return;
    }
    if (pageNameController.text.isEmpty) {
      setState(() {
        errorMessage = 'برجاء إدخال اسم الصفحة';
      });
      return;
    }
    if (accountLinkController.text.isEmpty) {
      setState(() {
        errorMessage = 'برجاء إدخال لينك الأكونت الشخصي';
      });
      return;
    }

    double amountToDeduct = 0.0;
    switch (selectedFollowers) {
      case 'عدد الـ 5 آلاف متابع بـ 500ج':
        amountToDeduct = 500.0;
        break;
      case 'عدد الـ 10 آلاف متابع بـ 1000ج':
        amountToDeduct = 1000.0;
        break;
      case 'عدد الـ 15 ألف متابع بـ 1500ج':
        amountToDeduct = 1500.0;
        break;
      case 'عدد الـ 20 ألف متابع بـ 2000ج':
        amountToDeduct = 2000.0;
        break;
      case 'عدد الـ 30 ألف متابع بـ 3000ج':
        amountToDeduct = 3000.0;
        break;
    }

    if (currentBalance < amountToDeduct) {
      setState(() {
        errorMessage = 'رصيدك الحالي هو $currentBalance جنيه. برجاء شحن الرصيد للاستمرار';
      });
      return;
    }

    final parentContext = context; // Store the current context to use after async call

    showDialog(
      context: context,
      builder: (BuildContext scaffoldContext) {
        return AlertDialog(
          title: Text('تأكيد الخصم'),
          content: Text('سيتم خصم $amountToDeduct جنيه من رصيدك تكلفة الخدمة. هل ترغب في المتابعة؟'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(scaffoldContext).pop();
              },
              child: Text('إلغاء', style: TextStyle(color: Colors.red)),
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Color(0xFF800080),
                foregroundColor: Colors.white,
              ),
              onPressed: () async {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return LoadingScreen();
                  },
                );
                Navigator.of(scaffoldContext).pop();
                await _deductBalance(amountToDeduct);
                Navigator.of(context).pop();

                final user = FirebaseAuth.instance.currentUser;
                if (user != null) {
                  final userDoc = await FirebaseFirestore.instance.collection('clients').doc(user.uid).get();
                  final requestId = FirebaseFirestore.instance.collection('pages_ready_requests').doc().id;
                  await FirebaseFirestore.instance.collection('pages_ready_requests').add({
                    'requestId': requestId,
                    'firstName': userDoc.data()?['firstName'] ?? '',
                    'lastName': userDoc.data()?['lastName'] ?? '',
                    'email': user.email ?? '',
                    'phone': userDoc.data()?['phone'] ?? '',
                    'userId': user.uid,
                    'pageName': pageNameController.text,
                    'facebookLink': accountLinkController.text,
                    'selectedFollowers': selectedFollowers,
                    'description': notesController.text,
                    'timestamp': Timestamp.now(),
                    'status': 'قيد التنفيذ',
                    'status_editing': 'used',
                    'responseDetails': '',
                    'notes': '',
                  });
                  showDialog(
                    context: parentContext,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('تم إرسال الطلب'),
                        content: Text('تم إرسال طلبك للإدارة بنجاح. برجاء متابعة قسم الطلبات السابقة.'),
                        actions: [
                          TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Color(0xFF800080),
                              foregroundColor: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.push(
                                parentContext,
                                MaterialPageRoute(builder: (context) => ClientRequestsHistoryPage()),
                              );
                            },
                            child: Text('أوكيه'),
                          ),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('طلب صفحة فيس بوك جاهزة', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF800080),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.pages, size: 100, color: Color(0xFF800080)),
              SizedBox(height: 20),
              Text(
                'برجاء اختيار عدد المتابعين المطلوب:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
              SizedBox(height: 10),
              DropdownButton<String>(
                value: selectedFollowers.isEmpty ? null : selectedFollowers,
                hint: Text('اختر عدد المتابعين'),
                items: [
                  'عدد الـ 5 آلاف متابع بـ 500ج',
                  'عدد الـ 10 آلاف متابع بـ 1000ج',
                  'عدد الـ 15 ألف متابع بـ 1500ج',
                  'عدد الـ 20 ألف متابع بـ 2000ج',
                  'عدد الـ 30 ألف متابع بـ 3000ج'
                ].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedFollowers = newValue!;
                  });
                },
              ),
              SizedBox(height: 20),
              Text(
                'ادخل اسم الصفحة المطلوب:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
              SizedBox(height: 10),
              TextField(
                controller: pageNameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'ادخل اسم الصفحة',
                  helperText: 'برجاء كتابة الاسم بوضوح لأنه لا يمكن تغييره مرة أخرى قبل 60 يوم',
                ),
              ),
              SizedBox(height: 20),
              Text(
                'ادخل لينك الأكونت الشخصي:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
              SizedBox(height: 10),
              TextField(
                controller: accountLinkController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'ادخل لينك الأكونت الشخصي',
                  helperText: 'لينك الأكونت سيتم إرسال دعوة مسئول عليه لاستلام الصفحة',
                ),
              ),
              SizedBox(height: 20),
              Text(
                'ملاحظات (اختياري):',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
              SizedBox(height: 10),
              TextField(
                controller: notesController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'إذا كانت لديك أي ملاحظات برجاء كتابتها للإدارة',
                ),
              ),
              SizedBox(height: 20),
              if (errorMessage.isNotEmpty)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        errorMessage,
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
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF800080),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  ),
                  onPressed: _submitRequest,
                  child: Text('اطلب الخدمة', style: TextStyle(fontSize: 18)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
