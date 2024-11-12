//lib/screens/other_services/desgin/new_desgin_details_page.dart
import 'package:flutter/material.dart';
import 'desgin_portfolio.dart'; // استيراد صفحة سابقة الأعمال

class NewDesginDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تفاصيل التصميم الاحترافي', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF800080),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'تفاصيل الخدمة الخاصة بالتصميمات الاحترافية',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF4A148C)),
              ),
              SizedBox(height: 20),
              Text(
                'هذه الصفحة تحتوي على جميع التفاصيل الخاصة بخدمة التصميمات الاحترافية التي تشمل تصميمات سوشيال ميديا، لوجو احترافي، كافر غلاف للصفحة، منيو، مطوية، كارت شخصي، وغيرها من أنواع التصميمات.',
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
- تصميمات احترافية بجودة عالية تناسب جميع المجالات.
- اختيار ألوان وشعارات تعبر عن الهوية البصرية لشركتك.
- تصميمات فريدة تلائم رؤية وأهداف المشروع.
- خدمة سريعة وتسليم في الوقت المحدد.
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
                'سعر الخدمة 150ج فقط ولفترة محدودة.',
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
                    onPressed: () {}, // الزرار غير فعال حالياً
                    child: Text('اطلب الخدمة', style: TextStyle(fontSize: 16)),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF800080),
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DesignPortfolioPage()),
                      );
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
