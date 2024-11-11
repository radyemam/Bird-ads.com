//lib/screens/wallet/refund_request_page.dart
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled5/generated/l10n.dart';

class RefundRequestPage extends StatefulWidget {
  @override
  _RefundRequestPageState createState() => _RefundRequestPageState();
}

class _RefundRequestPageState extends State<RefundRequestPage> {
  final TextEditingController refundAmountController = TextEditingController();
  final TextEditingController otherReasonController = TextEditingController();
  final TextEditingController accountNumberController = TextEditingController();

  String? selectedRefundMethod;
  String? selectedRefundReason;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
  }

  Future<void> _submitRefundRequest() async {
    double refundAmount = double.tryParse(refundAmountController.text) ?? 0.0;
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      DocumentSnapshot clientSnapshot = await FirebaseFirestore.instance
          .collection('clients')
          .doc(user.uid)
          .get();

      double availableBalance = (clientSnapshot['total_balance'] is int)
          ? (clientSnapshot['total_balance'] as int).toDouble()
          : clientSnapshot['total_balance'] ?? 0.0;

      if (refundAmount > availableBalance) {
        setState(() {
          errorMessage = '${S.of(context).available_balance} ${availableBalance.toStringAsFixed(0)} ${S.of(context).currency}';
        });
        return;
      }

      String note = 'طلب استرجاع بقيمة ${refundAmount.toStringAsFixed(0)}ج على ${selectedRefundMethod ?? ""} رقم ${accountNumberController.text} وسبب الاسترداد هو ${selectedRefundReason ?? ""} ${otherReasonController.text}';

      await FirebaseFirestore.instance.collection('customer requests').add({
        'action': 'طلب جديد',
        'ad name': 'طلب استرجاع اموال',
        'adID': '',
        'createdTime': FieldValue.serverTimestamp(),
        'customerID': clientSnapshot['uid'], // Ensure this is correct
        'email': user.email,
        'note': note,
        'status': 'طلب جديد',
      });

      // Send notification
      await _sendNotification(user.email!, S.of(context).refund_request_submitted);

      setState(() {
        errorMessage = '';
      });

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(S.of(context).success_message),
            content: Text(S.of(context).refund_request_submitted), // يظهر النص مرة واحدة فقط
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                  Navigator.of(context).pop(); // Go back to the previous screen
                },
                child: Text(S.of(context).ok),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white, // لون النص أبيض
                  backgroundColor: Color(0xFF800080), // خلفية موف
                ),
              ),
            ],
          );
        },
      );
    }
  }

  Future<void> _sendNotification(String email, String message) async {
    await FirebaseFirestore.instance.collection('notifications').add({
      'email': email,
      'message': message,
      'timestamp': FieldValue.serverTimestamp(),
      'isRead': false,
    });
  }

  @override
  Widget build(BuildContext context) {
    final Color purpleColor = Color(0xFF800080);
    User? user = FirebaseAuth.instance.currentUser;

    final List<String> refundMethods = [
      S.of(context).cash_wallet,
      S.of(context).insta_pay
    ];

    final List<String> refundReasons = [
      S.of(context).service_not_liked,
      S.of(context).charged_by_mistake,
      S.of(context).want_to_stop_for_a_while,
      S.of(context).not_suitable_for_my_work,
      S.of(context).results_not_liked,
      S.of(context).other_reason
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).refund_request, style: TextStyle(color: Colors.white)),
        backgroundColor: purpleColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(S.of(context).available_balance),
              StreamBuilder<DocumentSnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('clients')
                    .doc(user?.uid)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }
                  if (!snapshot.hasData || !snapshot.data!.exists) {
                    return Text(
                      '0 ج.م',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  }
                  var balanceData = snapshot.data!.data() as Map<String, dynamic>?;
                  if (balanceData == null) {
                    return Text(
                      '0 ج.م',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  }
                  var totalBalance = (balanceData['total_balance'] is int)
                      ? (balanceData['total_balance'] as int).toDouble()
                      : balanceData['total_balance'] ?? 0.0;
                  return Text(
                    '${totalBalance.toStringAsFixed(0)} ${S.of(context).currency}',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
              SizedBox(height: 8),
              Text(
                S.of(context).refund_policy,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.red,
                ),
              ),
              SizedBox(height: 16),
              Text(S.of(context).refund_amount),
              TextField(
                controller: refundAmountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: S.of(context).refund_amount,
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                ),
              ),
              if (errorMessage.isNotEmpty) ...[
                SizedBox(height: 8),
                Text(
                  errorMessage,
                  style: TextStyle(color: Colors.red),
                ),
              ],
              SizedBox(height: 16),
              Text(S.of(context).refund_method),
              DropdownButtonFormField<String>(
                value: selectedRefundMethod,
                items: refundMethods
                    .map((method) => DropdownMenuItem(value: method, child: Text(method)))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedRefundMethod = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: S.of(context).refund_method,
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              if (selectedRefundMethod != null) ...[
                Text(S.of(context).account_number),
                TextField(
                  controller: accountNumberController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: S.of(context).account_number,
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  ),
                ),
                SizedBox(height: 16),
              ],
              Text(S.of(context).refund_reason),
              DropdownButtonFormField<String>(
                value: selectedRefundReason,
                items: refundReasons
                    .map((reason) => DropdownMenuItem(value: reason, child: Text(reason)))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedRefundReason = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: S.of(context).refund_reason,
                  border: OutlineInputBorder(),
                ),
              ),
              if (selectedRefundReason == S.of(context).other_reason) ...[
                SizedBox(height: 16),
                TextField(
                  controller: otherReasonController,
                  decoration: InputDecoration(
                    labelText: S.of(context).other_reason,
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 3,
                ),
              ],
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _submitRefundRequest,
                child: Center(
                  child: Text(
                    S.of(context).submit_request,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: purpleColor,
                  minimumSize: Size(double.infinity, 50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
