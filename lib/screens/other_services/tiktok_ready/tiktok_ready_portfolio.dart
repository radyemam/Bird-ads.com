//lib/screens/other_services/tiktok_ready/tiktok_ready_portfolio.dart
import 'package:flutter/material.dart';

class TiktokReadyPortfolioPage extends StatelessWidget {
  final bool showLink = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'سابقة أعمال حسابات تيك توك الجاهزة',
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
                'دي جزء من سابقة أعمالنا في حسابات تيك توك الجاهزة. الحسابات تضمن متابعين حقيقيين وزيادة تفاعل ملموس، مع ضمان إمكانية البث المباشر وتحقيق النمو السريع لنشاطك التجاري أو الشخصي.',
                style: TextStyle(fontSize: 18, color: Color(0xFF4A148C)),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              if (showLink) SizedBox(height: 20),
              SizedBox(height: 20),
              if (showLink) Center(
                child: Text(
                  'حسابات تيك توك جاهزة لمختلف الأنشطة',
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
  'نموذج من التفاعل وعدد المشاهدات',
  'عدد المتابعين من مناطق مختلفة',
  'نسبة التفاعل وتحقيق شروط البث المباشر',
];

const List<String> images = [
  'assets/images/tiktok1.jpg',
  'assets/images/tiktok2.jpg',
  'assets/images/tiktok3.jpg',
];
