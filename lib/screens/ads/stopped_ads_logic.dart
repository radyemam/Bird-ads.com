// lib/screens/ads/stopped_ads_logic.dart
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled5/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';

class StoppedAdsLogic {
  List<DocumentSnapshot> ads = [];
  String? userEmail;
  bool isLoading = true;
  String errorMessage = '';
  double currentBalance = 0.0;

  final Color purpleColor = Color(0xFF800080);

  Future<void> loadUserEmail(BuildContext context, Function setState) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        String email = user.email ?? '';
        setState(() {
          userEmail = email;
        });
        if (email.isNotEmpty) {
          await loadAds(context, email, setState);
          await loadUserBalance(context, setState);
        } else {
          setState(() {
            isLoading = false;
            errorMessage = S.of(context).error_message_no_email;
          });
        }
      } else {
        setState(() {
          isLoading = false;
          errorMessage = S.of(context).error_message_no_email;
        });
      }
    } catch (e) {
      setState(() {
        isLoading = false;
        errorMessage = '${S.of(context).error_loading_email}: $e';
      });
    }
  }

  Future<void> loadAds(BuildContext context, String email, Function setState) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('created ads')
          .where('status', isEqualTo: 'تم الايقاف من العميل')
          .where('email', isEqualTo: email)
          .get();

      setState(() {
        ads = querySnapshot.docs;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
        errorMessage = '${S.of(context).error_loading_ads}: $e';
      });
    }
  }

  Future<void> loadUserBalance(BuildContext context, Function setState) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        QuerySnapshot querySnapshot = await FirebaseFirestore.instance
            .collection('transactions')
            .where('email', isEqualTo: user.email)
            .get();

        if (querySnapshot.docs.isNotEmpty) {
          var transactionData = querySnapshot.docs.first.data() as Map<String, dynamic>?;
          if (transactionData != null) {
            setState(() {
              currentBalance = transactionData['total_balance'] ?? 0.0;
            });
          }
        }
      }
    } catch (e) {
      setState(() {
        errorMessage = '${S.of(context).error_loading_balance}: $e';
      });
    }
  }

  void showAdDetails(BuildContext context, DocumentSnapshot ad) {
    Map<String, dynamic> adData = ad.data() as Map<String, dynamic>;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(S.of(context).ad_details),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (adData['Platform'] != null && adData['Platform'].toString().isNotEmpty)
                  Text('${S.of(context).platform}: ${adData['Platform']}'),
                if (adData['ad goal'] != null && adData['ad goal'].toString().isNotEmpty)
                  Text('${S.of(context).ad_goal}: ${adData['ad goal']}'),
                if (adData['gender'] != null && adData['gender'].toString().isNotEmpty)
                  Text('${S.of(context).gender}: ${adData['gender']}'),
                if (adData['age from'] != null && adData['age from'].toString().isNotEmpty && adData['age to'] != null && adData['age to'].toString().isNotEmpty)
                  Text('${S.of(context).age_range(adData['age from'], adData['age to'])}'),
                if (adData['budget'] != null && adData['budget'].toString().isNotEmpty)
                  Text('${S.of(context).budget}: ${adData['budget']}'),
                if (adData['duration'] != null && adData['duration'].toString().isNotEmpty)
                  Text('${S.of(context).duration_days(adData['duration'])}'),
                if (adData['country'] != null && adData['country'].toString().isNotEmpty)
                  Text('${S.of(context).country}: ${adData['country']}'),
                if (adData['location'] != null && adData['location'].toString().isNotEmpty)
                  Text('${S.of(context).locations}: ${adData['location']}'),
                if (adData['interests'] != null && adData['interests'].toString().isNotEmpty)
                  Text('${S.of(context).interests}: ${adData['interests']}'),
                if (adData['behavior'] != null && adData['behavior'].toString().isNotEmpty)
                  Text('${S.of(context).behaviors}: ${adData['behavior']}'),
                if (adData['Link post'] != null && adData['Link post'].toString().isNotEmpty)
                  GestureDetector(
                    onTap: () async {
                      final url = adData['Link post'];
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: Text(
                      '${S.of(context).post_link}: ${adData['Link post']}',
                      style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
                    ),
                  ),
                if (adData['text post'] != null && adData['text post'].toString().isNotEmpty && adData['Link post'] == null)
                  Text('${S.of(context).post_text}: ${adData['text post']}'),
                if (adData['image post'] != null && adData['image post'].toString().isNotEmpty)
                  Text('${S.of(context).post_images}: ${adData['image post']}'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void showResumeAdDialog(BuildContext context, DocumentSnapshot ad) {
    final TextEditingController budgetController = TextEditingController();
    final TextEditingController durationController = TextEditingController();
    String errorMessage = '';
    double currentBalance = 0.0;

    FirebaseFirestore.instance
        .collection('clients')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get()
        .then((snapshot) {
      if (snapshot.exists) {
        var balanceData = snapshot.data() as Map<String, dynamic>?;
        if (balanceData != null) {
          currentBalance = balanceData['total_balance'] ?? 0.0;
        }
      }
    });

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text(S.of(context).resume_ad),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(S.of(context).provide_budget),
                    TextField(
                      controller: budgetController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: S.of(context).enter_budget,
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 8.0),
                    Text(S.of(context).provide_duration),
                    TextField(
                      controller: durationController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: S.of(context).enter_duration,
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
                    int duration = int.tryParse(durationController.text) ?? 0;

                    if (budget < 100) {
                      setState(() {
                        errorMessage = 'الحد الأدنى للزيادة هو 100 ج.م';
                      });
                    } else if (duration > 0 && (budget / duration) < 100) {
                      setState(() {
                        errorMessage = 'الحد الأدنى لليوم الواحد هو 100 ج.م';
                      });
                    } else if (budget > currentBalance) {
                      setState(() {
                        errorMessage = S.of(context).current_balance(currentBalance);
                      });
                    } else {
                      await resumeAd(ad, budget, duration);
                      await deductBalance(context, budget);
                      await logTransaction(context, budget);
                      await logCustomerRequest(context, ad, budget, duration);
                      Navigator.of(context).pop();
                      showSuccessDialog(context, budget, duration);
                    }
                  },
                  child: Text(S.of(context).resume_ad),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: purpleColor,
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

  Future<void> resumeAd(DocumentSnapshot ad, double budget, int duration) async {
    try {
      await FirebaseFirestore.instance
          .collection('created ads')
          .doc(ad.id)
          .update({
        'budget': FieldValue.increment(budget),
        'duration': FieldValue.increment(duration),
      });
    } catch (e) {
      // Handle error
    }
  }

  Future<void> deductBalance(BuildContext context, double budget) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        DocumentSnapshot clientSnapshot = await FirebaseFirestore.instance
            .collection('clients')
            .doc(user.uid)
            .get();
        var clientData = clientSnapshot.data() as Map<String, dynamic>?;

        if (clientData != null) {
          double currentBalance = clientData['total_balance'] ?? 0.0;

          // التأكد من أن الرصيد المتبقي ليس أقل من الصفر بعد الخصم
          double newBalance = currentBalance - budget;
          if (newBalance >= 0) {
            await FirebaseFirestore.instance.collection('clients').doc(user.uid).update({'total_balance': newBalance});
            this.currentBalance = newBalance;
          } else {
            throw Exception('رصيد غير كافٍ');
          }
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('${S.of(context).error_deducting_balance}: $e'),
        backgroundColor: Colors.red,
      ));
    }
  }


  Future<void> logTransaction(BuildContext context, double budget) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        DocumentSnapshot clientSnapshot = await FirebaseFirestore.instance
            .collection('clients')
            .doc(user.uid)
            .get();
        var clientData = clientSnapshot.data() as Map<String, dynamic>;
        await FirebaseFirestore.instance.collection('statement').add({
          'ID client': user.uid,
          'first name': clientData['firstName'],
          'last name': clientData['lastName'],
          'email': clientData['email'],
          'addition_amount': 0,
          'deduction_amount': budget,
          'timestamp': Timestamp.now(),
          'transaction_name': 'زيادة ميزانية الإعلان',
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('${S.of(context).error_logging_transaction}: $e'),
        backgroundColor: Colors.red,
      ));
    }
  }

  Future<void> logCustomerRequest(BuildContext context, DocumentSnapshot ad, double budget, int duration) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        DocumentSnapshot clientSnapshot = await FirebaseFirestore.instance
            .collection('clients')
            .doc(user.uid)
            .get();
        var clientData = clientSnapshot.data() as Map<String, dynamic>;
        await FirebaseFirestore.instance.collection('customer requests').add({
          'action': S.of(context).resume_ad,
          'ad name': (ad.data() as Map<String, dynamic>).containsKey('ad name') ? (ad.data() as Map<String, dynamic>)['ad name'] : '',
          'adID': ad.id,
          'createdTime': Timestamp.now(),
          'customerID': clientData['uid'],
          'email': clientData['email'],
          'note': S.of(context).increase_request_sent(budget.toString(), duration.toString()),
          'status': 'طلب جديد',
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('${S.of(context).error_logging_customer_request}: $e'),
        backgroundColor: Colors.red,
      ));
    }
  }

  void showSuccessDialog(BuildContext context, double budget, int duration) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(S.of(context).resume_request_success),
          content: Text(
            '${S.of(context).resume_request_success}\n\n'
                '${S.of(context).budget}: $budget ${S.of(context).currency}\n'
                '${S.of(context).duration}: $duration ${S.of(context).days}',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Future<void> activateAd(BuildContext context, DocumentSnapshot ad) async {
    try {
      await FirebaseFirestore.instance.collection('created ads').doc(ad.id).update({
        'status': 'نشط',
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(S.of(context).ad_activated_successfully),
        backgroundColor: purpleColor,
      ));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('${S.of(context).error_activating_ad}: $e'),
        backgroundColor: Colors.red,
      ));
    }
  }
}
