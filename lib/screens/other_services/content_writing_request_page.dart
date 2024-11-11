//lib/screens/other_services/content_writing_request_page.dart
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'other_services_page.dart';

class ContentWritingRequestPage extends StatelessWidget {
  final TextEditingController contentDetailsController = TextEditingController();
  final TextEditingController facebookLinkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('طلب خدمة كتابة المحتوى', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF800080),
      ),
      body: Padding(
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
              ),
              SizedBox(height: 30),
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
                      final userId = user.uid;
                      final userDoc = await FirebaseFirestore.instance.collection('clients').doc(userId).get();
                      if (userDoc.exists) {
                        final userData = userDoc.data();

                        // Adding the content request to Firestore
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

                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('تم إرسال الطلب بنجاح'),
                              content: Text('تم إرسال طلبك بنجاح. سيتم التواصل معك قريبًا.'),
                              actions: [
                                TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: Color(0xFF800080),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => OtherServicesPage()),
                                    );
                                  },
                                  child: Text('Ok', style: TextStyle(color: Colors.white)),
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
      ),
    );
  }
}
