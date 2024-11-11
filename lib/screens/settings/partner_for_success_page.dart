// partner_for_success_page.dart

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'dart:html' as html;
import 'package:share_plus/share_plus.dart';

class PartnerForSuccessPage extends StatefulWidget {
  @override
  _PartnerForSuccessPageState createState() => _PartnerForSuccessPageState();
}

class _PartnerForSuccessPageState extends State<PartnerForSuccessPage> {
  final Color purpleColor = Color(0xFF800080);
  String? referralLink;

  @override
  void initState() {
    super.initState();
    _generateReferralLink();
  }

  Future<void> _generateReferralLink() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final userId = user.uid;

      try {
        // تحقق من إذا كان النظام الأساسي هو الويب
        if (html.window != null) {
          // للويب: استخدم رابط ثابت يحتوي على UID المستخدم
          print('Generating referral link for web...');
          setState(() {
            referralLink = 'https://bird-ads.com/#/register?referralId=$userId';
          });
          print('Referral link generated for web: $referralLink');
        } else {
          // للأنظمة الأخرى: استخدم Firebase Dynamic Links
          print('Generating dynamic link for other platforms...');
          final DynamicLinkParameters parameters = DynamicLinkParameters(
            uriPrefix: 'https://newbirdy.page.link',
            link: Uri.parse('https://bird-ads.com/#/register?referralId=$userId'),
            androidParameters: AndroidParameters(
              packageName: 'com.yourcompany.newbirdy',
              minimumVersion: 1,
            ),
            iosParameters: IOSParameters(
              bundleId: 'com.example.newbirdy',
              fallbackUrl: Uri.parse('https://bird-ads.com/#/register?referralId=$userId'),
            ),
          );

          final ShortDynamicLink dynamicLink = await FirebaseDynamicLinks.instance.buildShortLink(parameters);
          setState(() {
            referralLink = dynamicLink.shortUrl.toString();
          });
          print('Dynamic link generated: $referralLink');
        }
      } catch (e) {
        print('Error generating referral link: $e');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('حدث خطأ أثناء إنشاء الرابط: $e')));
      }
    } else {
      print('No user is currently logged in.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('كن شريك النجاح', style: TextStyle(color: Colors.white)),
        backgroundColor: purpleColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ادعو أصدقائك واكسب مكافآت رائعة!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: purpleColor),
            ),
            SizedBox(height: 16),
            Text(
              'يمكنك الآن مشاركة كود الدعوة الخاص بك مع أصدقائك وعائلتك. عندما يقومون بالتسجيل باستخدام كودك، ستحصل على مكافآت قيمة! كن جزءًا من النجاح وساهم في بناء مجتمعنا.',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            SizedBox(height: 32),
            if (referralLink != null) ...[
              TextField(
                readOnly: true,
                controller: TextEditingController(text: referralLink),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'رابط الدعوة',
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      html.window.navigator.clipboard?.writeText(referralLink!);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('تم نسخ رابط الدعوة إلى الحافظة')));
                    },
                    child: Text('نسخ رابط الدعوة'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: purpleColor,
                      foregroundColor: Colors.white,
                    ),
                  ),
                  SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {
                      Share.share(referralLink!);
                    },
                    child: Text('شارك الدعوة'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: purpleColor,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ] else ...[
              Center(child: CircularProgressIndicator()),
            ],
          ],
        ),
      ),
    );
  }
}
