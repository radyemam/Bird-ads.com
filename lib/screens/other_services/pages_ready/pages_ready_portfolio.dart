//lib/screens/other_services/pages_ready/pages_ready_portfolio.dart
import 'package:flutter/material.dart';

class PagesReadyPortfolioPage extends StatelessWidget {
  final bool showLink = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'سابقة أعمال الصفحات الجاهزة',
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
                'دي جزء من سابقة أعمالنا في الصفحات الجاهزة والتفاعلات ونسبة التفاعل حسب عدد الأعضاء يتم تزويد هذه الصفحات عن طريق الشيرات علي الصفحات المليونية والمتابعين جميعهم حققيين ومتفاعلين مع ضمان حقوق الملكية الكاملة إلك',
                style: TextStyle(fontSize: 18, color: Color(0xFF4A148C)),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              if (showLink) SizedBox(height: 20),
              SizedBox(height: 20),
              if (showLink) Center(
                child: Text(
                  'صفحات جاهزة لمختلف الخدمات',
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
  'نموذج من معدل الوصول والتفاعل',
  'نموذج من عدد الرجال والنساء ويخلف حسب الطلب',
  'نسبة عدد المتابعين من مصر وجزء من الوطن العربي',
  'نموذج من جودة الصفحة خضرا ولا يوجد اي انتهاكات',
  'نبذة عن التفاعل علي الحالي للصفحات الجاهزة',
];

const List<String> images = [
  'assets/images/social_page.jpg',
  'assets/images/ads_page.jpg',
  'assets/images/marketing_page.jpg',
  'assets/images/company_info_page.jpg',
  'assets/images/customer_service_page.jpg',
];
