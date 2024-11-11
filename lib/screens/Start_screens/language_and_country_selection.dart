// lib/screens/language_and_country_selection.dart

import 'package:flutter/material.dart';

class LanguageAndCountrySelection extends StatefulWidget {
  @override
  _LanguageAndCountrySelectionState createState() => _LanguageAndCountrySelectionState();
}

class _LanguageAndCountrySelectionState extends State<LanguageAndCountrySelection> {
  String _selectedCountry = 'مصر';
  String _selectedLanguage = 'العربية';

  final Map<String, String> countryCodes = {
    'مصر': '+20',
    'المملكة العربية السعودية': '+966',
    'الامارات العربية المتحدة': '+971',
    'الكويت': '+965',
    'البحرين': '+973',
    'قطر': '+974',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select language and country'),
        actions: [
          TextButton(
            onPressed: () {
              print("Navigating to Login Screen");
              Navigator.pushReplacementNamed(context, '/login');
            },
            child: Text(
              'تخطي',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Select language and country',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue.shade900),
            ),
            SizedBox(height: 8),
            Text(
              'You can select the country and language that you would like to use with us in Bird app.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 24),
            Text(
              'Country',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: _selectedCountry,
              items: countryCodes.keys.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _selectedCountry = newValue!;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.grey.shade200,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Language',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: _selectedLanguage,
              items: <String>['العربية', 'English'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _selectedLanguage = newValue!;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.grey.shade200,
              ),
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  print("Navigating to Second Page");
                  Navigator.pushReplacementNamed(context, '/second');
                },
                child: Text(
                  'CONTINUE',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade900,
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}