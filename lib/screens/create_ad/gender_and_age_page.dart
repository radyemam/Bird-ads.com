import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:untitled5/generated/l10n.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: GenderAndAgePage(),
    );
  }
}

class GenderAndAgePage extends StatefulWidget {
  @override
  _GenderAndAgePageState createState() => _GenderAndAgePageState();
}

class _GenderAndAgePageState extends State<GenderAndAgePage> {
  String? _selectedGender;
  int? _ageFrom;
  int? _ageTo;

  @override
  void initState() {
    super.initState();
    _loadSelectedAudience();
  }

  void _loadSelectedAudience() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _selectedGender = prefs.getString('selectedGender');
      _ageFrom = prefs.getInt('ageFrom');
      _ageTo = prefs.getInt('ageTo');
    });
  }

  void _selectGender(String gender) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedGender', gender);
    setState(() {
      _selectedGender = gender;
    });
  }

  void _selectAgeFrom(int age) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('ageFrom', age);
    setState(() {
      _ageFrom = age;
    });
  }

  void _selectAgeTo(int age) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('ageTo', age);
    setState(() {
      _ageTo = age;
    });
  }

  void _saveSelection() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (_ageFrom != null) {
      await prefs.setInt('ageFrom', _ageFrom!);
    } else {
      await prefs.remove('ageFrom');
    }
    if (_ageTo != null) {
      await prefs.setInt('ageTo', _ageTo!);
    } else {
      await prefs.remove('ageTo');
    }
    Navigator.pop(context);
  }

  Widget _buildGenderButton(String gender, String value) {
    final Color purpleColor = Color(0xFF800080);

    return Expanded(
      child: GestureDetector(
        onTap: () => _selectGender(value),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: _selectedGender == value ? purpleColor : Colors.white,
            border: Border.all(color: purpleColor),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              gender,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: _selectedGender == value ? Colors.white : purpleColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Color purpleColor = Color(0xFF800080);
    final Color dropdownColor = Color(0xFFE0E0E0);

    final List<Map<String, String>> _genders = [
      {'name': S.of(context).men, 'value': 'men'},
      {'name': S.of(context).women, 'value': 'women'},
      {'name': S.of(context).men_and_women, 'value': 'men_and_women'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).gender_and_age, style: TextStyle(color: Colors.white)),
        backgroundColor: purpleColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              S.of(context).gender_and_age,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: purpleColor),
            ),
            SizedBox(height: 16),
            Text(
              S.of(context).choose_gender,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: purpleColor),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _genders.map((gender) {
                return _buildGenderButton(gender['name']!, gender['value']!);
              }).toList(),
            ),
            SizedBox(height: 16),
            Text(
              S.of(context).choose_age,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: purpleColor),
            ),
            SizedBox(height: 8),
            Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(S.of(context).from, style: TextStyle(color: purpleColor)),
                      DropdownButton<int>(
                        value: _ageFrom,
                        items: List.generate(33, (index) => index + 18).map((int value) {
                          return DropdownMenuItem<int>(
                            value: value,
                            child: Text(value.toString(), style: TextStyle(color: purpleColor)),
                          );
                        }).toList(),
                        onChanged: (int? newValue) {
                          _selectAgeFrom(newValue!);
                        },
                        dropdownColor: dropdownColor,
                        iconEnabledColor: purpleColor,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(S.of(context).to, style: TextStyle(color: purpleColor)),
                      DropdownButton<int>(
                        value: _ageTo,
                        items: List.generate(45, (index) => index + 21).map((int value) {
                          return DropdownMenuItem<int>(
                            value: value,
                            child: Text(value.toString(), style: TextStyle(color: purpleColor)),
                          );
                        }).toList(),
                        onChanged: (int? newValue) {
                          _selectAgeTo(newValue!);
                        },
                        dropdownColor: dropdownColor,
                        iconEnabledColor: purpleColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: _saveSelection,
                child: Text(S.of(context).save, style: TextStyle(fontSize: 20, color: Colors.white)),
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
