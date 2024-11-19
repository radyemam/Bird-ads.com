//lib/screens/other_services/pages_ready/pages_ready_details_page.dart
import 'package:flutter/material.dart';
import 'pages_ready_request_page.dart';

class PagesReadyDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تفاصيل صفحات الفيس بوك الجاهزة', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF800080),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'الصفحات الفيس بوك الجاهزة هي صفحة عليها عدد متابعين حقيقيين تم تزويدهم عن طريق الشير والإعلانات الممولة. الصفحات تضمن زيادة التفاعل الحقيقي من مستخدمين فعليين، مما يجعلها مثالية لبدء نشاطك التجاري أو توسيع نطاق الوصول. ',
                style: TextStyle(fontSize: 18, color: Colors.black87),
              ),
              SizedBox(height: 20),
              Text(
                'المميزات:',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF4A148C)),
              ),
              SizedBox(height: 10),
              Text(
                '''
- الألف متابع ب 100ج.
- ناس مصرية وجزء عرب حقيقيين ومتفاعلين.
- الاستلام بالاسم اللي تختاره.
- التسليم خلال 24 ساعة عمل.
- حقوق الملكية كاملة يعني أنت هتبقى الأدمن الوحيد.
                '''
                ,
                style: TextStyle(fontSize: 18, color: Colors.black87),
              ),
              SizedBox(height: 20),
              Text(
                'الأسعار:',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF4A148C)),
              ),
              SizedBox(height: 10),
              Text(
                '''
- سعر الـ 5 آلاف متابع بـ 500ج.
- سعر الـ 10 آلاف متابع بـ 1000ج.
- سعر الـ 15 ألف متابع بـ 1500ج.
- سعر الـ 20 ألف متابع بـ 2000ج.
- سعر الـ 30 ألف متابع بـ 3000ج.
                '''
                ,
                style: TextStyle(fontSize: 18, color: Colors.black87),
              ),
              SizedBox(height: 24),
              Text(
                'طريقة طلب الصفحة:',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF4A148C)),
              ),
              SizedBox(height: 10),
              Text(
                '''
1. اضغط على "اطلب الخدمة".
2. حدد عدد المتابعين المطلوب.
3. ادخل اسم الصفحة المطلوب.
4. ادخل لينك الأكونت الخاص بك لإرسال الأدمن.
5. أضف ملاحظاتك.
6. متابعة قسم الطلبات السابقة لاستلام الصفحة.
                '''
                ,
                style: TextStyle(fontSize: 18, color: Colors.black87),
              ),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF800080),
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PagesReadyRequestPage()),
                      );
                    },
                    child: Text('اطلب الخدمة', style: TextStyle(fontSize: 16)),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF800080),
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    ),
                    onPressed: () {
                      // Navigate to previous works page
                    },
                    child: Text('سابقة أعمالنا', style: TextStyle(fontSize: 16)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
