import 'package:flutter/material.dart';
import 'create_ad_with_experts_page.dart';
import '../../widgets/bottom_nav_bar.dart';
import '../advertisements/advertisements_page.dart';
import '../wallet/wallet_screen.dart';
import '../settings/settings_page.dart';
import '../home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'package:untitled5/generated/l10n.dart'; // استيراد الترجمة

class CreateAdPage extends StatefulWidget {
  @override
  _CreateAdPageState createState() => _CreateAdPageState();
}

class _CreateAdPageState extends State<CreateAdPage> {
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
          break;
        case 1:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => AdvertisementsPage()),
          );
          break;
        case 3:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => WalletScreen()),
          );
          break;
        case 4:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => SettingsPage()),
          );
          break;
        default:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => CreateAdPage()),
          );
      }
    });
  }

  Future<void> _navigateToExpertsPage(BuildContext context, String platform) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    await prefs.setString('selectedPlatform', platform);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CreateAdWithExpertsPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Color purpleColor = Color(0xFF800080);
    final localization = S.of(context); // استخدام الترجمة

    return Scaffold(
      appBar: AppBar(
        title: Text(localization.choose_ad_platform, style: TextStyle(color: Colors.white)),
        automaticallyImplyLeading: false,
        backgroundColor: purpleColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  localization.choose_ad_platform,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: purpleColor),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: [
                    AdPlatformCard(
                      imagePath: 'assets/images/facebook.png',
                      label: localization.facebook,
                      onPressed: () => _navigateToExpertsPage(context, localization.facebook),
                    ),
                    AdPlatformCard(
                      imagePath: 'assets/images/instagram.png',
                      label: localization.instagram,
                      onPressed: () => _navigateToExpertsPage(context, localization.instagram),
                    ),
                    AdPlatformCard(
                      imagePath: 'assets/images/facebook_instagram.png',
                      label: localization.facebook_instagram,
                      onPressed: () => _navigateToExpertsPage(context, localization.facebook_instagram),
                    ),
                    AdPlatformCard(
                      imagePath: 'assets/images/tiktok.png',
                      label: localization.tiktok,
                      onPressed: () => _navigateToExpertsPage(context, localization.tiktok),
                    ),
                    AdPlatformCard(
                      imagePath: 'assets/images/google.png',
                      label: localization.google,
                      onPressed: () => _navigateToExpertsPage(context, localization.google),
                    ),
                    AdPlatformCard(
                      imagePath: 'assets/images/youtube.png',
                      label: localization.youtube,
                      onPressed: () => _navigateToExpertsPage(context, localization.youtube),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      _showCreateAdDialog(context);
                    },
                    child: Text(
                      localization.create_ad_with_company_experts,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: purpleColor,
                      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  void _showCreateAdDialog(BuildContext context) {
    final localization = S.of(context); // استخدام الترجمة
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: Text(localization.please_choose)),
          content: SingleChildScrollView(
            child: Center(
              child: ListBody(
                children: <Widget>[
                  Text(localization.choose_one_of_the_following, textAlign: TextAlign.center),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            Center(
              child: Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF800080),
                      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                    ),
                    child: Text(
                      localization.continue_previous_ad,
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CreateAdWithExpertsPage()),
                      );
                    },
                  ),
                  SizedBox(height: 8),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF800080),
                      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                    ),
                    child: Text(
                      localization.start_new_ad,
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    onPressed: () async {
                      Navigator.of(context).pop();
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      await prefs.clear();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CreateAdWithExpertsPage()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class AdPlatformCard extends StatelessWidget {
  final String imagePath;
  final String label;
  final VoidCallback onPressed;

  AdPlatformCard({required this.imagePath, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final Color purpleColor = Color(0xFF800080);

    return GestureDetector(
      onTap: onPressed,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Container(
          width: 140,
          height: 140,
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(imagePath, width: 50, height: 50),
              SizedBox(height: 8),
              Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: purpleColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
