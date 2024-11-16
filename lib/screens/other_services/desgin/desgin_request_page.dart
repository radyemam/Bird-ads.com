//lib/screens/other_services/desgin/desgin_request_page.dart
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:typed_data';
import 'package:untitled5/screens/wallet/add_balance_page.dart';
import 'package:untitled5/screens/other_services/client_requests_history.dart';

class DesignRequestPage extends StatefulWidget {
  @override
  _DesignRequestPageState createState() => _DesignRequestPageState();
}

class _DesignRequestPageState extends State<DesignRequestPage> {
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController linkController = TextEditingController();
  List<XFile> selectedImages = [];
  List<String> imageUrls = [];
  List<String> imageNames = [];
  List<Uint8List> selectedImageData = [];
  bool isUploading = false;
  bool uploadComplete = false;
  double currentBalance = 0.0;
  String balanceWarningMessage = '';
  String firstName = '';
  String lastName = '';
  String email = '';
  String phone = '';

  @override
  void initState() {
    super.initState();
    _loadUserBalance();
    _loadUserDetails();
  }

  Future<void> _loadUserBalance() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final userId = user.uid;
      final userDoc = await FirebaseFirestore.instance.collection('clients').doc(userId).get();
      if (userDoc.exists) {
        setState(() {
          currentBalance = userDoc['total_balance']?.toDouble() ?? 0.0;
          firstName = userDoc['firstName'] ?? '';
          lastName = userDoc['lastName'] ?? '';
          email = userDoc['email'] ?? '';
          phone = userDoc['phone'] ?? '';
        });
      }
    }
  }

  Future<void> _loadUserDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      descriptionController.text = prefs.getString('designDescription') ?? '';
      linkController.text = prefs.getString('designLink') ?? '';
    });
  }

  Future<void> _saveDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('designDescription', descriptionController.text);
    await prefs.setString('designLink', linkController.text);
  }

  Future<void> _pickImages() async {
    final ImagePicker picker = ImagePicker();
    final pickedFiles = await picker.pickMultiImage();
    if (pickedFiles != null) {
      setState(() {
        selectedImages = pickedFiles;
        isUploading = true;
        uploadComplete = false;
      });
      for (var pickedFile in pickedFiles) {
        var imageData = await pickedFile.readAsBytes();
        selectedImageData.add(imageData);
      }
      await _uploadImages();
    }
  }

  Future<void> _uploadImages() async {
    List<String> uploadedUrls = [];
    List<String> uploadedNames = [];
    FirebaseStorage storage = FirebaseStorage.instance;
    for (var i = 0; i < selectedImages.length; i++) {
      var image = selectedImages[i];
      var imageData = selectedImageData[i];
      String fileName = image.name;
      Reference storageRef = storage.ref().child('design_requests/$fileName');
      await storageRef.putData(imageData);
      String downloadURL = await storageRef.getDownloadURL();
      uploadedUrls.add(downloadURL);
      uploadedNames.add(fileName);
    }
    setState(() {
      imageUrls.addAll(uploadedUrls);
      imageNames.addAll(uploadedNames);
      isUploading = false;
      uploadComplete = true;
    });
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
          'first name': firstName,
          'last name': lastName,
          'email': email,
          'addition_amount': 0,
          'deduction_amount': amount,
          'timestamp': Timestamp.now(),
          'transaction_name': 'تكلفة طلب تصميم',
        });
      }
    }
  }

  void _removeImage(int index) {
    setState(() {
      if (index < imageUrls.length) {
        imageUrls.removeAt(index);
        imageNames.removeAt(index);
      }
      if (index < selectedImages.length) {
        selectedImages.removeAt(index);
        selectedImageData.removeAt(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext scaffoldContext) {
        return Scaffold(
          appBar: AppBar(
            title: Text('طلب خدمة التصميم', style: TextStyle(color: Colors.white)),
            backgroundColor: Color(0xFF800080),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.brush, size: 100, color: Color(0xFF800080)),
                  SizedBox(height: 20),
                  Text(
                    'هذه صفحة طلب خدمة التصميم.',
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
                    'وصف التصميم المطلوب:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: descriptionController,
                    maxLines: 5,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'يرجى كتابة وصف كامل للتصميم المطلوب',
                    ),
                    onChanged: (value) => _saveDetails(),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'رابط الصفحة أو البوست:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: linkController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'يرجى إدخال رابط الصفحة أو البوست المتعلق بالتصميم',
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'برجاء ارفاق صورة اللوجو او اي ديزين سابق مميز',
                        style: TextStyle(fontSize: 16, color: Colors.black87),
                      ),
                      IconButton(
                        icon: Icon(Icons.attach_file, color: Color(0xFF800080), size: 30),
                        onPressed: () async {
                          await _pickImages();
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  if (isUploading) ...[
                    Text(
                      'جاري رفع الملفات...',
                      style: TextStyle(fontSize: 16, color: Colors.orange),
                    ),
                  ],
                  if (uploadComplete) ...[
                    Text(
                      'تم الرفع بنجاح',
                      style: TextStyle(fontSize: 16, color: Colors.green),
                    ),
                  ],
                  Wrap(
                    spacing: 8.0,
                    children: imageNames.asMap().entries.map((entry) {
                      int index = entry.key;
                      String name = entry.value;
                      return Row(
                        children: [
                          Expanded(
                            child: Text(name, style: TextStyle(fontSize: 14)),
                          ),
                          IconButton(
                            icon: Icon(Icons.close, color: Colors.red),
                            onPressed: () => _removeImage(index),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 20),
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
                          double requiredBudget = 150.0; // تكلفة الخدمة

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

                                        // إضافة طلب التصميم إلى Firestore
                                        final userId = user.uid;
                                        final requestId = FirebaseFirestore.instance.collection('design_requests').doc().id;
                                        await FirebaseFirestore.instance.collection('design_requests').add({
                                          'requestId': requestId,
                                          'userId': userId,
                                          'firstName': firstName,
                                          'lastName': lastName,
                                          'email': email,
                                          'phone': phone,
                                          'description': descriptionController.text,
                                          'facebookLink': linkController.text,
                                          'images': imageUrls,
                                          'status': 'قيد التنفيذ',
                                          'timestamp': Timestamp.now(),
                                          'contentDetails_edit': '',
                                          'responseDetails': '',
                                          'responseDetails2': '',
                                          'notes': '',
                                          'status_editing': 'unused',
                                        });

                                        // عرض رسالة نجاح بعد تقديم الطلب وتحويل المستخدم لصفحة الطلبات السابقة
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
          ),
        );
      },
    );
  }
}
