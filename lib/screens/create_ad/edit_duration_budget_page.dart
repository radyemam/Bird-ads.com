import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled5/generated/l10n.dart';
import 'dart:math'; // استيراد مكتبة dart:math
import '../wallet/add_balance_page.dart';

class EditDurationBudgetPage extends StatefulWidget {
  @override
  _EditDurationBudgetPageState createState() => _EditDurationBudgetPageState();
}

class _EditDurationBudgetPageState extends State<EditDurationBudgetPage> {
  final TextEditingController _durationController = TextEditingController();
  final TextEditingController _budgetController = TextEditingController();
  User? user;
  int currentBalance = 0; // تغيير نوع البيانات إلى int للتعامل مع الأرقام الصحيحة فقط
  bool showBalanceWarning = false;
  bool showMinBudgetWarning = false;
  String? _selectedPlatform;
  double additionalFeePercentage = 0.1; // نسبة العمولة الإضافية
  int totalBudget = 0; // الميزانية الكلية بعد إضافة العمولة

  @override
  void initState() {
    super.initState();
    _loadDurationBudget();
    user = FirebaseAuth.instance.currentUser;
    _loadCurrentBalance();
    _loadSelectedPlatform();
  }

  Future<void> _loadDurationBudget() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? duration = prefs.getInt('duration');
    double? budget = prefs.getDouble('budget');
    setState(() {
      _durationController.text = duration?.toString() ?? '';
      _budgetController.text = budget?.toString() ?? '';
    });
  }

  Future<void> _loadCurrentBalance() async {
    if (user != null) {
      FirebaseFirestore.instance
          .collection('clients')
          .doc(user!.uid)
          .snapshots()
          .listen((snapshot) {
        if (snapshot.exists) {
          var balanceData = snapshot.data() as Map<String, dynamic>?;
          if (balanceData != null) {
            setState(() {
              currentBalance = (balanceData['total_balance'] ?? 0.0).round(); // تقريب الرقم إلى أقرب عدد صحيح
            });
          }
        }
      });
    }
  }

  Future<void> _loadSelectedPlatform() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _selectedPlatform = prefs.getString('selectedPlatform');
    });
  }

  void _saveDurationBudget() async {
    double budget = double.tryParse(_budgetController.text) ?? 0.0;
    if (_selectedPlatform == 'يوتيوب' || _selectedPlatform == 'جوجل') {
      budget += budget * additionalFeePercentage;
      budget = budget.ceilToDouble(); // تقريب الميزانية إلى أقرب عدد صحيح
    }
    if (budget < 200) {
      setState(() {
        showMinBudgetWarning = true;
        showBalanceWarning = false;
      });
    } else if (budget > currentBalance) {
      setState(() {
        showBalanceWarning = true;
        showMinBudgetWarning = false;
      });
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setInt('duration', int.tryParse(_durationController.text) ?? 0);
      await prefs.setDouble('budget', budget);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color purpleColor = Color(0xFF800080);

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).edit_duration_budget, style: TextStyle(color: Colors.white)),
        backgroundColor: purpleColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              S.of(context).set_duration_budget,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: purpleColor),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _durationController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: S.of(context).ad_duration_days,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _budgetController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: S.of(context).ad_budget_egp,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  double budget = double.tryParse(value) ?? 0.0;
                  if (_selectedPlatform == 'يوتيوب' || _selectedPlatform == 'جوجل') {
                    totalBudget = (budget + (budget * additionalFeePercentage)).ceil(); // تقريب الميزانية إلى أقرب عدد صحيح
                  } else {
                    totalBudget = budget.ceil();
                  }
                });
              },
            ),
            SizedBox(height: 16),
            if (_selectedPlatform == 'يوتيوب' || _selectedPlatform == 'جوجل') ...[
              Text(
                S.of(context).google_youtube_fee(totalBudget.toString()),
                style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
            ],
            if (showMinBudgetWarning)
              Column(
                children: [
                  Text(
                    S.of(context).min_budget_warning,
                    style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            if (showBalanceWarning)
              Column(
                children: [
                  Text(
                    S.of(context).balance_warning(currentBalance.toString()), // عرض الرصيد بدون القروش
                    style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddBalancePage()),
                      );
                    },
                    child: Text(S.of(context).add_balance, style: TextStyle(fontSize: 20, color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                    ),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            Center(
              child: ElevatedButton(
                onPressed: _saveDurationBudget,
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
