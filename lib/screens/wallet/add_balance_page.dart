import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled5/generated/l10n.dart';
import 'vodafone_cash_transfer_page.dart';

class AddBalancePage extends StatefulWidget {
  @override
  _AddBalancePageState createState() => _AddBalancePageState();
}

class _AddBalancePageState extends State<AddBalancePage> {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController chargingValueController = TextEditingController();
  int vat = 0;
  int administrationFee = 0;
  double administrationPercentage = 0.15;
  int total = 0;
  final Color purpleColor = Color(0xFF800080);
  String administrationNote = "";

  @override
  void initState() {
    super.initState();
    _fetchAdministrationNote();
  }

  void _fetchAdministrationNote() async {
    try {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('notes_administration')
          .doc('1kAQP59YSHqBNn7Q9WCA')
          .get();
      setState(() {
        administrationNote = snapshot['notes_administration'] ?? "";
        administrationPercentage = (snapshot['percentage_all_clients'] ?? 15) / 100.0;
      });
    } catch (e) {
      print("Error fetching note: \$e");
    }
  }

  void _calculateValues() {
    setState(() {
      int amount = int.tryParse(amountController.text) ?? 0;
      vat = (amount * 0.14).round();
      administrationFee = (amount * administrationPercentage).round();
      total = amount + vat + administrationFee;
      chargingValueController.text = total.toString();
    });
  }

  void _calculateAmountFromChargingValue() {
    setState(() {
      int chargingValue = int.tryParse(chargingValueController.text) ?? 0;
      int originalAmount = (chargingValue / (1 + 0.14 + administrationPercentage)).round();
      amountController.text = originalAmount.toString();
      vat = (originalAmount * 0.14).round();
      administrationFee = (originalAmount * administrationPercentage).round();
      total = originalAmount + vat + administrationFee;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).add_balance, style: TextStyle(color: Colors.white)),
        backgroundColor: purpleColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).balance_amount,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue.shade900),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: amountController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: S.of(context).enter_amount,
                      labelStyle: TextStyle(color: Colors.grey),
                    ),
                    onChanged: (value) {
                      _calculateValues();
                    },
                  ),
                ),
                SizedBox(width: 16),
                Icon(Icons.swap_horiz, color: Colors.grey),
                SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    controller: chargingValueController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: S.of(context).charging_value,
                      labelStyle: TextStyle(color: Colors.grey),
                    ),
                    onChanged: (value) {
                      _calculateAmountFromChargingValue();
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              S.of(context).note,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue.shade900),
            ),
            SizedBox(height: 4),
            Text(
              S.of(context).minimum_ad_amount,
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 16),
            Text(
              S.of(context).payment_details,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue.shade900),
            ),
            SizedBox(height: 8),
            _buildPaymentDetailRow(S.of(context).charging_amount, '${S.of(context).currency} ${amountController.text}'),
            _buildPaymentDetailRow(S.of(context).vat_14, '${S.of(context).currency} ${vat}'),
            _buildPaymentDetailRow(S.of(context).administration_15_percent, '${S.of(context).currency} ${administrationFee}'),
            _buildPaymentDetailRow(S.of(context).charging_value, '${S.of(context).currency} ${total}'),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VodafoneCashTransferPage(
                        amount: total.toString(),
                        originalAmount: amountController.text,
                      ),
                    ),
                  );
                },
                child: Text(S.of(context).continue_text, style: TextStyle(fontSize: 20, color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: purpleColor,
                  minimumSize: Size(double.infinity, 50),
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'ملاحظات',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue.shade900),
            ),
            SizedBox(height: 8),
            Text(
              administrationNote,
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: 16, color: Colors.black)),
          Text(value, style: TextStyle(fontSize: 16, color: Colors.black)),
        ],
      ),
    );
  }
}
