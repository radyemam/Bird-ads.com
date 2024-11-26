import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled5/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';
import '../settings/support_page.dart';

class ActiveAdsLogic {
  static Future<String?> loadUserEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        return user.email;
      } else {
        return null;
      }
    } catch (e) {
      print('Error loading user email: $e');
      return null;
    }
  }

  static Future<List<DocumentSnapshot>> loadAds(String email) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('created ads')
          .where('status', isEqualTo: 'الاعلان نشط')
          .where('email', isEqualTo: email)
          .orderBy('timestamp', descending: true)
          .get();
      return querySnapshot.docs;
    } catch (e) {
      print('Error loading ads: $e');
      return [];
    }
  }

  static void showAdDetails(BuildContext context, DocumentSnapshot ad) {
    Map<String, dynamic> adData = ad.data() as Map<String, dynamic>;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: Text(S.of(context).ad_details, style: TextStyle(color: Color(0xFF800080)))),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: buildAdDetails(context, adData),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(S.of(context).cancel),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static Future<void> stopAdRequest(BuildContext context, DocumentSnapshot ad) async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      DocumentSnapshot clientSnapshot = await FirebaseFirestore.instance
          .collection('clients')
          .doc(user?.uid)
          .get();
      var clientData = clientSnapshot.data() as Map<String, dynamic>;
      String email = clientData['email'];
      String customerID = clientData['uid'];

      String adID = ad.id;
      var adData = ad.data() as Map<String, dynamic>;

      await FirebaseFirestore.instance.collection('customer requests').add({
        'action': S.of(context).stop_ad_request,
        'ad name': adData.containsKey('ad name') ? adData['ad name'] : '',
        'adID': adID,
        'createdTime': Timestamp.now(),
        'customerID': customerID,
        'email': email,
        'note': S.of(context).stop_ad_request_sent,
        'status': 'طلب جديد',
      });

      await FirebaseFirestore.instance.collection('notifications').add({
        'email': email,
        'message': S.of(context).stop_ad_request_sent,
        'timestamp': Timestamp.now(),
        'isRead': false,
      });

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(S.of(context).stop_ad_request_sent),
        backgroundColor: Color(0xFF800080),
      ));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error: $e'),
        backgroundColor: Colors.red,
      ));
    }
  }

  static void showAdResults(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: Text(S.of(context).ad_results)),
          content: Text(S.of(context).ad_results_text),
          actions: <Widget>[
            TextButton(
              child: Text(S.of(context).cancel),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(S.of(context).support),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => SupportPage()));
              },
            ),
          ],
        );
      },
    );
  }

  static Future<void> showBudgetDialog(BuildContext context, DocumentSnapshot ad) async {
    double currentBalance = await _getCurrentBalance();
    TextEditingController budgetController = TextEditingController();
    TextEditingController daysController = TextEditingController();
    String errorMessage = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Center(child: Text(S.of(context).increase_ad, style: TextStyle(color: Color(0xFF800080)))),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(S.of(context).increase_budget),
                  TextField(
                    controller: budgetController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: S.of(context).enter_budget,
                      suffixText: 'ج.م',
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 8.0),
                  Text(S.of(context).enter_days),
                  TextField(
                    controller: daysController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: S.of(context).enter_days,
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  if (errorMessage.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        errorMessage,
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(S.of(context).cancel),
                ),
                ElevatedButton(
                  onPressed: () async {
                    double budget = double.tryParse(budgetController.text) ?? 0.0;
                    int days = int.tryParse(daysController.text) ?? 0;

                    if (budget <= 0 || days <= 0) {
                      setState(() {
                        errorMessage = S.of(context).budget_error_message(currentBalance.toString());
                      });
                    } else if (budget > currentBalance) {
                      setState(() {
                        errorMessage = S.of(context).budget_error_message(currentBalance.toString());
                      });
                    } else {
                      try {
                        var user = FirebaseAuth.instance.currentUser;
                        DocumentSnapshot clientSnapshot = await FirebaseFirestore.instance
                            .collection('clients')
                            .doc(user?.uid)
                            .get();
                        var clientData = clientSnapshot.data() as Map<String, dynamic>;
                        String email = clientData['email'];
                        String customerID = clientData['uid'];

                        String adID = ad.id;
                        var adData = ad.data() as Map<String, dynamic>;

                        await FirebaseFirestore.instance.collection('customer requests').add({
                          'action': S.of(context).increase_ad,
                          'ad name': adData.containsKey('ad name') ? adData['ad name'] : '',
                          'adID': adID,
                          'createdTime': Timestamp.now(),
                          'customerID': customerID,
                          'email': email,
                          'note': S.of(context).increase_request_sent(budget.toString(), days.toString()),
                          'status': 'طلب جديد',
                        });

                        // Adding notification
                        await FirebaseFirestore.instance.collection('notifications').add({
                          'email': email,
                          'message': S.of(context).increase_request_sent(budget.toString(), days.toString()),
                          'timestamp': Timestamp.now(),
                          'isRead': false,
                        });

                        Navigator.of(context).pop();
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Center(child: Text(S.of(context).success, style: TextStyle(color: Color(0xFF800080)))),
                              content: Text(S.of(context).increase_request_sent(budget.toString(), days.toString())),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(S.of(context).ok, style: TextStyle(color: Colors.white)),
                                  style: TextButton.styleFrom(
                                    backgroundColor: Color(0xFF800080),
                                    foregroundColor: Colors.white,
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Error: $e'),
                          backgroundColor: Colors.red,
                        ));
                      }
                    }
                  },
                  child: Text(S.of(context).increase_ad),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF800080),
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  static Future<void> showEditDialog(BuildContext context, DocumentSnapshot ad) async {
    TextEditingController editController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: Text(S.of(context).edit_ad, style: TextStyle(color: Color(0xFF800080)))),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(S.of(context).other_edit_prompt),
              SizedBox(height: 8),
              TextField(
                controller: editController,
                maxLines: 3,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: S.of(context).enter_edit_details,
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(S.of(context).cancel),
            ),
            ElevatedButton(
              onPressed: () async {
                String editRequest = editController.text;
                if (editRequest.isNotEmpty) {
                  try {
                    var user = FirebaseAuth.instance.currentUser;
                    DocumentSnapshot clientSnapshot = await FirebaseFirestore.instance
                        .collection('clients')
                        .doc(user?.uid)
                        .get();
                    var clientData = clientSnapshot.data() as Map<String, dynamic>;
                    String email = clientData['email'];
                    String customerID = clientData['uid'];

                    String adID = ad.id;
                    var adData = ad.data() as Map<String, dynamic>;

                    await FirebaseFirestore.instance.collection('customer requests').add({
                      'action': S.of(context).other_edit,
                      'ad name': adData.containsKey('ad name') ? adData['ad name'] : '',
                      'adID': adID,
                      'createdTime': Timestamp.now(),
                      'customerID': customerID,
                      'email': email,
                      'note': '${S.of(context).other_edit_note}: $editRequest',
                      'status': 'طلب جديد',
                    });

                    // Adding notification
                    await FirebaseFirestore.instance.collection('notifications').add({
                      'email': email,
                      'message': S.of(context).edit_request_sent,
                      'timestamp': Timestamp.now(),
                      'isRead': false,
                    });

                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(S.of(context).edit_request_sent),
                      backgroundColor: Color(0xFF800080),
                    ));
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(S.of(context).enter_edit_details_error),
                      backgroundColor: Colors.red,
                    ));
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(S.of(context).enter_edit_details_error),
                    backgroundColor: Colors.red,
                  ));
                }
              },
              child: Text(S.of(context).save),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF800080),
                foregroundColor: Colors.white,
              ),
            ),
          ],
        );
      },
    );
  }

  static List<Widget> buildAdDetails(BuildContext context, Map<String, dynamic> adData) {
    List<Widget> details = [
      if (adData['Platform'] != null && adData['Platform'].toString().isNotEmpty)
        Text('${S.of(context).platform}: ${adData['Platform']}'),
      if (adData['ad goal'] != null && adData['ad goal'].toString().isNotEmpty)
        Text('${S.of(context).ad_goal}: ${adData['ad goal']}'),
      if (adData['gender'] != null && adData['gender'].toString().isNotEmpty)
        Text('${S.of(context).gender}: ${adData['gender']}'),
      if (adData['age from'] != null && adData['age from'].toString().isNotEmpty && adData['age to'] != null && adData['age to'].toString().isNotEmpty)
        Text('${S.of(context).age}: من ${adData['age from']} إلى ${adData['age to']}'),
      if (adData['budget'] != null && adData['budget'].toString().isNotEmpty)
        Text('${S.of(context).budget}: ${adData['budget']}'),
      if (adData['duration'] != null && adData['duration'].toString().isNotEmpty)
        Text('${S.of(context).duration}: ${adData['duration']} أيام'),
      if (adData['country'] != null && adData['country'].toString().isNotEmpty)
        Text('${S.of(context).country}: ${adData['country']}'),
      if (adData['location'] != null && adData['location'].toString().isNotEmpty)
        Text('${S.of(context).location}: ${adData['location']}'),
      if (adData['interests'] != null && adData['interests'].toString().isNotEmpty)
        Text('${S.of(context).interests}: ${adData['interests']}'),
      if (adData['behavior'] != null && adData['behavior'].toString().isNotEmpty)
        Text('${S.of(context).behavior}: ${adData['behavior']}'),
      if (adData['Link post'] != null && adData['Link post'].toString().isNotEmpty)
        GestureDetector(
          onTap: () async {
            if (await canLaunch(adData['Link post'])) {
              await launch(adData['Link post']);
            }
          },
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '${S.of(context).link_post}: ',
                  style: TextStyle(color: Colors.black),
                ),
                TextSpan(
                  text: adData['Link post'],
                  style: TextStyle(color: Colors.blue),
                ),
              ],
            ),
          ),
        ),
      if (adData['text post'] != null && adData['text post'].toString().isNotEmpty && adData['Link post'] == null)
        Text('${S.of(context).text_post}: ${adData['text post']}'),
      if (adData['image post'] != null && adData['image post'].toString().isNotEmpty)
        Text('${S.of(context).image_post}: ${adData['image post']}'),
    ];
    return details;
  }

  static Future<double> _getCurrentBalance() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('clients')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get();
    var balanceData = snapshot.data() as Map<String, dynamic>?;
    return balanceData != null ? balanceData['total_balance']?.toDouble() ?? 0.0 : 0.0;
  }
}
