import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:untitled5/generated/l10n.dart';

class DetailedAccountStatement extends StatelessWidget {
  final Color purpleColor = Color(0xFF800080);

  String formatTimestamp(Timestamp timestamp) {
    var date = timestamp.toDate();
    var formatter = DateFormat('     dd-MM-yyyy , hh:mm a');
    return formatter.format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).detailed_account_statement, style: TextStyle(color: Colors.white)),
        backgroundColor: purpleColor,
      ),
      body: Column(
        children: [
          StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection('clients')
                .doc(FirebaseAuth.instance.currentUser?.uid)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }
              if (!snapshot.hasData || !snapshot.data!.exists) {
                return Text(
                  S.of(context).balance_0,
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: purpleColor,
                  ),
                );
              }
              var balanceData = snapshot.data!.data() as Map<String, dynamic>?;
              if (balanceData == null) {
                return Text(
                  S.of(context).balance_0,
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: purpleColor,
                  ),
                );
              }
              var totalBalance = balanceData['total_balance'] ?? 0.0;
              int roundedBalance = (totalBalance is int) ? totalBalance : (totalBalance as double).ceil();
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  '$roundedBalance ${S.of(context).currency}',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: purpleColor,
                  ),
                ),
              );
            },
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('statement')
                  .where('email', isEqualTo: FirebaseAuth.instance.currentUser?.email)
                  .orderBy('timestamp', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }

                var transactions = snapshot.data!.docs;

                if (transactions.isEmpty) {
                  return Center(
                    child: Text(
                      S.of(context).no_transactions,
                      style: TextStyle(fontSize: 18, color: purpleColor),
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: transactions.length,
                  itemBuilder: (context, index) {
                    var transaction = transactions[index].data() as Map<String, dynamic>;
                    var additionAmount = transaction['addition_amount'] ?? 0.0;
                    var deductionAmount = transaction['deduction_amount'] ?? 0.0;
                    var description = transaction['transaction_name'] as String;
                    var timestamp = transaction['timestamp'] as Timestamp;
                    var date = formatTimestamp(timestamp);
                    var isPositive = additionAmount > 0;
                    int roundedAmount = (isPositive ? additionAmount : deductionAmount).ceil();

                    return Card(
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        isPositive ? Icons.add_circle : Icons.remove_circle,
                                        color: isPositive ? Colors.green : Colors.red,
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        '${isPositive ? '+' : '-'}$roundedAmount ${S.of(context).currency}',
                                        style: TextStyle(
                                          color: isPositive ? Colors.green : Colors.red,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        description,
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    date,
                                    style: TextStyle(fontSize: 14, color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );



                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
