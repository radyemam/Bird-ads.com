//lib/screens/other_services/desgin/desgin_portfolio.dart
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DesignPortfolioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'سابقة أعمال التصميمات',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF800080),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Center(
                child: Text(
                  'أنواع التصميمات',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Color(0xFF4A148C)),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20),
              Column(
                children: [
                  for (int i = 0; i < buttonTitles.length; i += 2)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: _buildButton(buttonTitles[i]),
                            ),
                          ),
                          if (i + 1 < buttonTitles.length)
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: _buildButton(buttonTitles[i + 1]),
                              ),
                            ),
                        ],
                      ),
                    ),
                ],
              ),
              SizedBox(height: 40),
              Center(
                child: Text(
                  'سابقة الأعمال متغيرة ومتجددة باستمرار',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF4A148C)),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: InkWell(
                  onTap: () async {
                    const url = 'https://www.behance.net/birdtechnology1';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: Text(
                    'تقدر تشوفها من هنا',
                    style: TextStyle(fontSize: 20, color: Colors.blue, decoration: TextDecoration.underline),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(String title) {
    return SizedBox(
      width: 180, // عرض الزرار
      height: 60, // ارتفاع الزرار
      child: ElevatedButton(
        onPressed: () {}, // جعل الزرار قابل للضغط للتأكد من ظهور التأثير
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF800080), // لون الخلفية موف
          foregroundColor: Colors.white, // لون النص أبيض
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0), // زوايا منحنية للزرار
          ),
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        ),
        child: Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}

const List<String> buttonTitles = [
  'لوجو',
  'كافر فوتو',
  'منيو',
  'مطوية',
  'كارت شخصي',
  'تصميم سوشيال ميديا',
  'غلاف كتاب',
  'يافطة محل',
  'فلاير مطبوع',
  'تصميم مخصص',
];
