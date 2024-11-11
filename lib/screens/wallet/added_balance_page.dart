// lib/screens/wallet/added_balance_page.dart
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddedBalancePage extends StatefulWidget {
  @override
  _AddedBalancePageState createState() => _AddedBalancePageState();
}

class _AddedBalancePageState extends State<AddedBalancePage> {
  User? user;
  double previousBalance = 0.0;

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
    _initializeBalance();
  }

  void _initializeBalance() async {
    var transaction = await FirebaseFirestore.instance
        .collection('transactions')
        .where('email', isEqualTo: user?.email)
        .orderBy('timestamp', descending: true)
        .limit(1)
        .get();

    if (transaction.docs.isNotEmpty) {
      setState(() {
        previousBalance = (transaction.docs.first['total_balance'] ?? 0.0).toDouble();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الرصيد المضاف'),
        backgroundColor: Colors.blue[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('transactions')
                  .where('email', isEqualTo: user?.email)
                  .orderBy('timestamp', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Text(
                    '0.0 ج.م',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }
                var transactionData = snapshot.data!.docs.first.data() as Map<String, dynamic>;
                double totalBalance = (transactionData['total_balance'] ?? 0.0).toDouble();

                // Check for balance change and record transaction if necessary
                if (totalBalance != previousBalance) {
                  double addedAmount = totalBalance - previousBalance;
                  if (addedAmount > 0) {
                    FirebaseFirestore.instance.collection('transactions').add({
                      'email': user!.email,
                      'amount': addedAmount,
                      'timestamp': FieldValue.serverTimestamp(),
                      'type': 'added',
                    });
                  }
                  previousBalance = totalBalance;
                }

                return Flexible(
                  fit: FlexFit.loose,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '$totalBalance ج.م',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Flexible(
                        fit: FlexFit.loose,
                        child: StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('transactions')
                              .where('email', isEqualTo: user?.email)
                              .where('type', isEqualTo: 'added')
                              .orderBy('timestamp', descending: true)
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return CircularProgressIndicator();
                            }
                            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                              return Text('لا توجد معاملات');
                            }
                            return ListView(
                              shrinkWrap: true,
                              children: snapshot.data!.docs.map((doc) {
                                var transaction = doc.data() as Map<String, dynamic>;
                                DateTime dateTime;
                                if (transaction['timestamp'] != null) {
                                  dateTime = (transaction['timestamp'] as Timestamp).toDate();
                                } else {
                                  dateTime = DateTime.now();
                                }
                                return ListTile(
                                  title: Text('تم اضافة +${transaction['amount']} ج.م'),
                                  subtitle: Text(
                                      '${dateTime.day}/${dateTime.month}/${dateTime.year} ${dateTime.hour}:${dateTime.minute}'),
                                );
                              }).toList(),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
