//lib/screens/other_services/new_creative_content_details_page.dart
import 'package:flutter/material.dart';
import 'content_writing_portfolio.dart';
import 'content_writing_request_page.dart';

class NewCreativeContentDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تفاصيل المحتوى الإبداعي', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF800080),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'تفاصيل الخدمة الخاصة بإنشاء المحتوى الإبداعي',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF4A148C)),
              ),
              SizedBox(height: 20),
              Text(
                'هذه الصفحة تحتوي على جميع التفاصيل الخاصة بخدمة إنشاء المحتوى الإبداعي بالتعاون مع الذكاء الاصطناعي. '
                    'يمكنكم هنا الاطلاع على المميزات، الأسعار، والخدمات المقدمة بشكل مفصل.',
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
- يتم كتابة المحتوى من خبراء كتابة محتويات خبرة 5 سنوات.
- تقدر تختار أي لغة تكتب بيها المحتوى، عربي أو إنجليزي حسب الرغبة.
- أفكار إبداعية وحصرية تناسب جميع أنواع الأعمال.
- دعم تحرير ومراجعة المحتوى لضمان أفضل جودة.
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
                'تكلفة كتابة المحتوى 60ج للمحتوى الواحد.',
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
                        MaterialPageRoute(builder: (context) => ContentWritingRequestPage()),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ContentWritingPortfolioPage()),
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
