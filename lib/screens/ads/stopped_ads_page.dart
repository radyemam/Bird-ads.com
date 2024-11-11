// lib/screens/ads/stopped_ads_page.dart
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:untitled5/generated/l10n.dart';

class StoppedAdsPage extends StatefulWidget {
  @override
  _StoppedAdsPageState createState() => _StoppedAdsPageState();
}

class _StoppedAdsPageState extends State<StoppedAdsPage> {
  List<DocumentSnapshot> _ads = [];
  String? _userEmail;
  bool _isLoading = true;
  String _errorMessage = '';
  double _currentBalance = 0.0;

  final Color purpleColor = Color(0xFF800080);

  @override
  void initState() {
    super.initState();
    _loadUserEmail();
  }

  Future<void> _loadUserEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        String email = user.email ?? '';
        print('تم تحميل البريد الإلكتروني من FirebaseAuth: $email'); // جملة طباعة للتصحيح
        setState(() {
          _userEmail = email;
        });
        if (email.isNotEmpty) {
          await _loadAds(email);
          await _loadUserBalance();
        } else {
          setState(() {
            _isLoading = false;
            _errorMessage = S.of(context).error_message_no_email;
          });
        }
      } else {
        setState(() {
          _isLoading = false;
          _errorMessage = S.of(context).error_message_no_email;
        });
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = '${S.of(context).error_loading_email}: $e';
      });
    }
  }

  Future<void> _loadAds(String email) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('created ads')
          .where('status', isEqualTo: 'تم الايقاف من العميل')
          .where('email', isEqualTo: email)
          .get();

      setState(() {
        _ads = querySnapshot.docs;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = '${S.of(context).error_loading_ads}: $e';
      });
    }
  }

  Future<void> _loadUserBalance() async {
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
              _currentBalance = transactionData['total_balance'] ?? 0.0;
            });
          }
        }
      }
    } catch (e) {
      setState(() {
        _errorMessage = '${S.of(context).error_loading_balance}: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).stopped_ads, style: TextStyle(color: Colors.white)),
          backgroundColor: purpleColor,
        ),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (_errorMessage.isNotEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).stopped_ads, style: TextStyle(color: Colors.white)),
          backgroundColor: purpleColor,
        ),
        body: Center(child: Text(_errorMessage)),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).stopped_ads, style: TextStyle(color: Colors.white)),
        backgroundColor: purpleColor,
      ),
      body: _ads.isEmpty
          ? Center(child: Text(S.of(context).no_ads_found))
          : ListView.builder(
        itemCount: _ads.length,
        itemBuilder: (context, index) {
          DocumentSnapshot ad = _ads[index];
          return _buildAdItem(ad, _ads.length - index);
        },
      ),
    );
  }

  Widget _buildAdItem(DocumentSnapshot ad, int adNumber) {
    Map<String, dynamic> adData = ad.data() as Map<String, dynamic>;
    String adName = adData['ad name'] ?? '';
    String platform = adData['Platform'] ?? '';
    String adGoal = adData['ad goal'] ?? '';
    String gender = adData['gender'] ?? '';
    String ageFrom = adData['age from']?.toString() ?? '';
    String ageTo = adData['age to']?.toString() ?? '';
    String budget = adData['budget']?.toString() ?? '';
    String duration = adData['duration']?.toString() ?? '';
    String country = adData['country'] ?? '';
    String location = adData['location'] ?? '';
    String interests = adData['interests'] ?? '';
    String behavior = adData['behavior'] ?? '';
    String postLink = adData['Link post'] ?? '';
    String postText = adData['text post'] ?? '';
    String imagePost = adData['image post'] ?? '';

    print('Location type: ${location.runtimeType}');
    print('Location value: $location');

    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ExpansionTile(
        tilePadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        title: Text(
          '${S.of(context).ad_number(adNumber, adName.isNotEmpty ? adName : '')}',
          style: TextStyle(fontWeight: FontWeight.bold, color: purpleColor),
        ),
        subtitle: Text('${S.of(context).ad_status(adData['status'])}'),
        trailing: PopupMenuButton<String>(
          onSelected: (String value) {
            if (value == 'resume') {
              _showResumeAdDialog(ad);
            } else if (value == 'details') {
              _showAdDetails(ad);
            } else if (value == 'activate') {
              _activateAd(ad);
            }
          },
          itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem<String>(
                value: 'resume',
                child: Text(S.of(context).resume_ad),
              ),
              PopupMenuItem<String>(
                value: 'details',
                child: Text(S.of(context).ad_details),
              ),
              PopupMenuItem<String>(
                value: 'activate',
                child: Text(S.of(context).activate_ad),
              ),
            ];
          },
        ),
        children: <Widget>[
          ListTile(
            title: Text(S.of(context).ad_details),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (platform.isNotEmpty) Text('${S.of(context).platform}: $platform'),
                if (adGoal.isNotEmpty) Text('${S.of(context).ad_goal}: $adGoal'),
                if (gender.isNotEmpty) Text('${S.of(context).gender}: $gender'),
                if (ageFrom.isNotEmpty && ageTo.isNotEmpty) Text('${S.of(context).age_range(ageFrom, ageTo)}'),
                if (budget.isNotEmpty) Text('${S.of(context).budget}: $budget'),
                if (duration.isNotEmpty) Text('${S.of(context).duration_days(duration)}'),
                if (country.isNotEmpty) Text('${S.of(context).country}: $country'),
                if (location.isNotEmpty) Text('${S.of(context).location}: ${location.toString()}'),
                if (interests.isNotEmpty) Text('${S.of(context).interests}: $interests'),
                if (behavior.isNotEmpty) Text('${S.of(context).behaviors}: $behavior'),
                if (postLink.isNotEmpty) GestureDetector(
                  onTap: () async {
                    if (await canLaunch(postLink)) {
                      await launch(postLink);
                    }
                  },
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Link post: ',
                          style: TextStyle(color: Colors.black),
                        ),
                        TextSpan(
                          text: postLink,
                          style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
                        ),
                      ],
                    ),
                  ),
                ),
                if (postText.isNotEmpty && postLink.isEmpty) Text('${S.of(context).post_text}: $postText'),
                if (imagePost.isNotEmpty) Text('${S.of(context).post_images}: $imagePost'),
              ],
            ),
          ),
        ],
      ),
    );
  }


  void _showAdDetails(DocumentSnapshot ad) {
    Map<String, dynamic> adData = ad.data() as Map<String, dynamic>;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(S.of(context).ad_details),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (adData['Platform'] != null && adData['Platform'].toString().isNotEmpty) Text('${S.of(context).platform}: ${adData['Platform']}'),
              if (adData['ad goal'] != null && adData['ad goal'].toString().isNotEmpty) Text('${S.of(context).ad_goal}: ${adData['ad goal']}'),
              if (adData['gender'] != null && adData['gender'].toString().isNotEmpty) Text('${S.of(context).gender}: ${adData['gender']}'),
              if (adData['age from'] != null && adData['age from'].toString().isNotEmpty && adData['age to'] != null && adData['age to'].toString().isNotEmpty) Text('${S.of(context).age_range(adData['age from'], adData['age to'])}'),
              if (adData['budget'] != null && adData['budget'].toString().isNotEmpty) Text('${S.of(context).budget}: ${adData['budget']}'),
              if (adData['duration'] != null && adData['duration'].toString().isNotEmpty) Text('${S.of(context).duration_days(adData['duration'])}'),
              if (adData['country'] != null && adData['country'].toString().isNotEmpty) Text('${S.of(context).country}: ${adData['country']}'),
              if (adData['location'] != null && adData['location'].toString().isNotEmpty) Text('${S.of(context).locations}: ${adData['location']}'),
              if (adData['interests'] != null && adData['interests'].toString().isNotEmpty) Text('${S.of(context).interests}: ${adData['interests']}'),
              if (adData['behavior'] != null && adData['behavior'].toString().isNotEmpty) Text('${S.of(context).behaviors}: ${adData['behavior']}'),
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
              if (adData['text post'] != null && adData['text post'].toString().isNotEmpty && adData['Link post'] == null) Text('${S.of(context).post_text}: ${adData['text post']}'),
              if (adData['image post'] != null && adData['image post'].toString().isNotEmpty) Text('${S.of(context).post_images}: ${adData['image post']}'),
            ],
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

  void _showResumeAdDialog(DocumentSnapshot ad) {
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
          currentBalance = currentBalance.floorToDouble();
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
              content: Column(
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

                    if (budget <= 0 || duration <= 0) {
                      setState(() {
                        errorMessage = S.of(context).error_specify_amount_days;
                      });
                    } else if (budget > currentBalance) {
                      setState(() {
                        errorMessage = '${S.of(context).current_balance(currentBalance)}';
                      });
                    } else {
                      await _resumeAd(ad, budgetController.text, durationController.text);
                      Navigator.of(context).pop();
                      _showSuccessDialog(budget, duration);
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

  Future<void> _resumeAd(DocumentSnapshot ad, String budget, String duration) async {
    try {
      await FirebaseFirestore.instance
          .collection('created ads')
          .doc(ad.id)
          .update({
        'budget': FieldValue.increment(double.parse(budget)),
        'duration': FieldValue.increment(int.parse(duration)),
      });

      String message = '${S.of(context).resume_request_success}\n'
          '${S.of(context).budget}: $budget ${S.of(context).currency}\n'
          '${S.of(context).duration}: $duration ${S.of(context).days}';

      await _sendNotification(
        _userEmail!,
        message,
        ad.id,
      );

      await _saveCustomerRequest(ad.id, budget, duration, message);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(S.of(context).complete_ad_success)));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(S.of(context).complete_ad_error)));
    }
  }

  Future<void> _saveCustomerRequest(String adID, String budget, String duration, String message) async {
    try {
      DocumentSnapshot clientSnapshot = await FirebaseFirestore.instance
          .collection('clients')
          .where('email', isEqualTo: _userEmail)
          .get()
          .then((snapshot) => snapshot.docs.first);

      Map<String, dynamic> clientData = clientSnapshot.data() as Map<String, dynamic>;

      await FirebaseFirestore.instance.collection('customer requests').add({
        'action': S.of(context).resume_ad,
        'ad name': S.of(context).stopped_ads,
        'adID': adID,
        'createdTime': FieldValue.serverTimestamp(),
        'customerID': clientData['uid'],
        'email': _userEmail,
        'note': message,
        'status': S.of(context).request_status,
      });

      await _sendNotification(
        _userEmail!,
        message,
        adID,
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(S.of(context).customer_request_error)));
    }
  }

  Future<void> _sendNotification(String email, String message, String adID) async {
    // Check if a notification with the same message and adID already exists
    QuerySnapshot existingNotifications = await FirebaseFirestore.instance
        .collection('notifications')
        .where('email', isEqualTo: email)
        .where('message', isEqualTo: message)
        .where('ID ad', isEqualTo: adID)
        .get();

    if (existingNotifications.docs.isEmpty) {
      await FirebaseFirestore.instance.collection('notifications').add({
        'email': email,
        'message': message,
        'ID ad': adID,
        'timestamp': FieldValue.serverTimestamp(),
        'isRead': false,
      });
    }
  }

  void _showSuccessDialog(double budget, int duration) {
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

  void _activateAd(DocumentSnapshot ad) async {
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

      String message = S.of(context).activate_ad_request_sent;

      await FirebaseFirestore.instance.collection('customer requests').add({
        'action': S.of(context).activate_ad,
        'ad name': adData.containsKey('ad name') ? adData['ad name'] : '',
        'adID': adID,
        'createdTime': Timestamp.now(),
        'customerID': customerID,
        'email': email,
        'note': message,
        'status': 'طلب جديد',
      });

      await _sendNotification(
        email,
        message,
        adID,
      );

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message),
        backgroundColor: purpleColor,
      ));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('حدث خطأ: $e'),
        backgroundColor: Colors.red,
      ));
    }
  }
}
