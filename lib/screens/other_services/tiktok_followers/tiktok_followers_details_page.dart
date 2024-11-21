//lib/screens/other_services/tiktok_followers/tiktok_followers_details_page.dart
import 'package:flutter/material.dart';
import 'tiktok_followers_portfolio.dart';
import 'tiktok_followers_request_page.dart';

class TiktokFollowersDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تزويد متابعين تيك توك عن طريق الاعلانات الممولة', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF800080),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'يتم التزويد من خلال تنزيل بوست ديني أو ترفيهي على الأكونت الخاص بك ويتم إنشاء إعلان ممول على هذا البوست لتزويد المتابعين. جميع المتابعين حقيقيين ومن خلال الإعلانات الممولة، من مصر وجزء من الوطن العربي، وتبدأ الخدمة من أول ألف متابع.',
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
- 1000 متابع بتكلفة 500ج.
- 3000 متابع بتكلفة 1300ج.
- 5000 متابع بتكلفة 2000ج.
- 10000 متابع بتكلفة 3500ج.
                '''
                ,
                style: TextStyle(fontSize: 18, color: Colors.black87),
              ),
              SizedBox(height: 24),
              Text(
                'ملاحظات:',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF4A148C)),
              ),
              SizedBox(height: 10),
              Text(
                '''
- مش بنحتاج اليوزر ولا الباص.
- بيتم التمويل من فيديوهات حضرتك بتنزلها عندك حسب الطلب وبناخد منها الكود للتمويل المباشر.
- التزويد أشخاص حقيقية كلها من مصر وجزء من الوطن العربي.
- أشخاص متفاعلين بالكامل عاملين متابعة بكامل إرادتهم مما يزيد التفاعل على باقي المنشورات.
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
                        MaterialPageRoute(builder: (context) => TiktokFollowersRequestPage()),
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
                        MaterialPageRoute(builder: (context) => TiktokFollowersPortfolioPage()),
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
