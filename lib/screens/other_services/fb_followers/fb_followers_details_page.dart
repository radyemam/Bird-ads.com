//lib/screens/other_services/fb_followers/fb_followers_details_page.dart
import 'package:flutter/material.dart';
import 'fb_followers_portfolio.dart';
import 'fb_followers_request_page.dart';

class FbFollowersDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تزويد متابعين صفحات الفيس بوك عن طريق الاعلانات الممولة', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF800080),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'يتم التزويد من خلال تنزيل بوست ترويجي أو ترفيهي على الأكونت الخاص بك ويتم إنشاء إعلان ممول على هذا البوست لتزويد المتابعين. جميع المتابعين حقيقيين ومن خلال الإعلانات الممولة، من مصر وجزء من الوطن العربي، وتبدأ الخدمة من أول خمسة آلاف متابع.',
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
- 5000 متابع بتكلفة 850ج.
- 10000 متابع بتكلفة 1550ج.
- 15000 متابع بتكلفة 2400ج.
- 20000 متابع بتكلفة 3000ج.
- 50000 متابع بتكلفة 7000ج.
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
- لازم تكون رفع الاكونت بتاعنا ادمن بصلاحيات كاملة او عمل ربط  للفيس بوك للصفحة المطلوبة.
- بيتم التمويل من البوستات التي يتم انشاء اعلان ممول عليها.
- التزويد أشخاص حقيقية كلها من مصر وجزء من الوطن العربي.
- أشخاص متفاعلين بالكامل عاملين متابعة بكامل إرادتهم مما يزيد التفاعل على باقي المنشورات.
- يتم التزويد يوميًا بحد أقصى 1000 شخص، مما يعني أن مدة تزويد 5000 متابع هي حوالي 5 أيام.
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
                        MaterialPageRoute(builder: (context) => FbFollowersRequestPage()),
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
                        MaterialPageRoute(builder: (context) => FbFollowersPortfolioPage()),
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
