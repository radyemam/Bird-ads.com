//lib/screens/other_services/tiktok_followers/tiktok_followers_portfolio.dart
import 'package:flutter/material.dart';

class TiktokFollowersPortfolioPage extends StatelessWidget {
  final bool showLink = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'سابقة أعمال تزويد متابعين تيك توك',
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
              Text(
                'جزء من سابقة أعمالنا في تزويد أكونتات التيك توك عن طريق الإعلانات الممولة. التزويد يتضمن متابعين حقيقيين وزيادة تفاعل ملموس، مما يساهم في تحقيق النمو السريع لنشاطك التجاري أو الشخصي وتفعيل شرط فتح اللايف ',
                style: TextStyle(fontSize: 18, color: Color(0xFF4A148C)),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              if (showLink) SizedBox(height: 20),
              SizedBox(height: 20),
              if (showLink) Center(
                child: Text(
                  'تزويد حسابات تيك توك بالإعلانات الممولة',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Color(0xFF4A148C)),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20),
              Column(
                children: [
                  for (int i = 0; i < imageTitles.length; i++)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            imageTitles[i],
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF4A148C)),
                          ),
                          SizedBox(height: 10),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.5, // Increased height for better visibility
                            width: double.infinity,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(images[i]),
                                fit: BoxFit.contain,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ],
                      ),
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

const List<String> imageTitles = [
  'نموذج عدد المتابعين قبل التزويد',
  'نموذج عدد المتابعين بغد التزويد',
  'مدير الإعلانات لزيادة المتابعين',
];

const List<String> images = [
  'assets/images/tiktok_followers1.jpg',
  'assets/images/tiktok_followers2.jpg',
  'assets/images/tiktok_ads_manger.JPG',
];
