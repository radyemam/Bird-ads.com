// lib/screens/settings/change_language_page.dart

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../generated/l10n.dart';
import 'settings_page.dart';

class ChangeLanguagePage extends StatefulWidget {
  final Function(Locale) setLocale;

  ChangeLanguagePage({required this.setLocale});

  @override
  _ChangeLanguagePageState createState() => _ChangeLanguagePageState();
}

class _ChangeLanguagePageState extends State<ChangeLanguagePage> {
  String _selectedLanguage = 'ar'; // Default language is Arabic

  @override
  void initState() {
    super.initState();
    _loadSavedLanguage();
  }

  void _loadSavedLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _selectedLanguage = prefs.getString('language') ?? 'ar';
    });
  }

  @override
  Widget build(BuildContext context) {
    final Color purpleColor = Color(0xFF800080);

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).change_language, style: TextStyle(color: Colors.white)),
        backgroundColor: purpleColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).choose_language,
              style: TextStyle(fontSize: 16, color: Colors.blue.shade900),
            ),
            SizedBox(height: 16),
            RadioListTile<String>(
              title: Text(S.of(context).arabic),
              value: 'ar',
              groupValue: _selectedLanguage,
              onChanged: (String? value) {
                setState(() {
                  _selectedLanguage = value!;
                });
              },
              activeColor: purpleColor,
            ),
            RadioListTile<String>(
              title: Text(S.of(context).english),
              value: 'en',
              groupValue: _selectedLanguage,
              onChanged: (String? value) {
                setState(() {
                  _selectedLanguage = value!;
                });
              },
              activeColor: purpleColor,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setString('language', _selectedLanguage);
                Locale newLocale = _selectedLanguage == 'ar' ? Locale('ar', 'EG') : Locale('en', 'US');
                widget.setLocale(newLocale);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(S.of(context).language_saved)),
                );

                // تحديث واجهة المستخدم بعد تغيير اللغة
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                );
              },
              child: Center(
                child: Text(S.of(context).save, style: TextStyle(color: Colors.white)),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: purpleColor,
                minimumSize: Size(double.infinity, 50), // make button full width
              ),
            ),
          ],
        ),
      ),
    );
  }
}
