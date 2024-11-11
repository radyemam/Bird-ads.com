import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled5/generated/l10n.dart'; // استيراد الترجمة

class EditAdDataPage extends StatefulWidget {
  @override
  _EditAdDataPageState createState() => _EditAdDataPageState();
}

class _EditAdDataPageState extends State<EditAdDataPage> {
  String? _selectedPlatform;

  final List<Map<String, dynamic>> _platforms = [
    {'name': 'facebook', 'imagePath': 'assets/images/facebook.png'},
    {'name': 'instagram', 'imagePath': 'assets/images/instagram.png'},
    {'name': 'facebook_instagram', 'imagePath': 'assets/images/facebook_instagram.png'},
    {'name': 'tiktok', 'imagePath': 'assets/images/tiktok.png'},
    {'name': 'google', 'imagePath': 'assets/images/google.png'},
    {'name': 'youtube', 'imagePath': 'assets/images/youtube.png'},
  ];

  @override
  void initState() {
    super.initState();
    _loadSelectedPlatform();
  }

  void _loadSelectedPlatform() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _selectedPlatform = prefs.getString('selectedPlatform');
    });
  }

  void _selectPlatform(String platform) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedPlatform', platform);
    setState(() {
      _selectedPlatform = platform;
    });
    Navigator.pop(context, _selectedPlatform);
  }

  @override
  Widget build(BuildContext context) {
    final Color purpleColor = Color(0xFF800080);
    final localization = S.of(context); // استخدام الترجمة

    return Scaffold(
      appBar: AppBar(
        title: Text(localization.choose_ad_platform_title, style: TextStyle(color: Colors.white)),
        backgroundColor: purpleColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              localization.choose_ad_platform,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: purpleColor),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _platforms.length,
                itemBuilder: (context, index) {
                  return AdPlatformCard(
                    imagePath: _platforms[index]['imagePath'],
                    label: localization.translate(_platforms[index]['name']),
                    isSelected: _selectedPlatform == localization.translate(_platforms[index]['name']),
                    onPressed: () => _selectPlatform(localization.translate(_platforms[index]['name'])),
                  );
                },
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, _selectedPlatform);
                },
                child: Text(localization.save, style: TextStyle(fontSize: 20, color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: purpleColor,
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AdPlatformCard extends StatelessWidget {
  final String imagePath;
  final String label;
  final bool isSelected;
  final VoidCallback onPressed;

  AdPlatformCard({required this.imagePath, required this.label, required this.isSelected, required this.onPressed});

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
              if (isSelected)
                Icon(Icons.check_circle, color: Colors.green, size: 24),
            ],
          ),
        ),
      ),
    );
  }
}

extension LocalizationExtension on S {
  String translate(String key) {
    switch (key) {
      case 'facebook':
        return facebook;
      case 'instagram':
        return instagram;
      case 'facebook_instagram':
        return facebook_instagram;
      case 'tiktok':
        return tiktok;
      case 'google':
        return google;
      case 'youtube':
        return youtube;
      default:
        return key;
    }
  }
}
