import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:url_launcher/url_launcher.dart';
import '../settings/support_page.dart';
import 'package:untitled5/generated/l10n.dart';

class ActiveAdsPage extends StatefulWidget {
  @override
  _ActiveAdsPageState createState() => _ActiveAdsPageState();
}

class _ActiveAdsPageState extends State<ActiveAdsPage> {
  List<DocumentSnapshot> _ads = [];
  String? _userEmail;
  bool _isLoading = true;
  String _errorMessage = '';

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
        } else {
          setState(() {
            _isLoading = false;
            _errorMessage = S.of(context).no_ads_found;
          });
        }
      } else {
        setState(() {
          _isLoading = false;
          _errorMessage = S.of(context).no_ads_found;
        });
      }
    } catch (e) {
      print('خطأ في تحميل البريد الإلكتروني: $e'); // جملة طباعة للتصحيح
      setState(() {
        _isLoading = false;
        _errorMessage = S.of(context).error_loading_ads(e.toString());
      });
    }
  }

  Future<void> _loadAds(String email) async {
    try {
      print('جاري تحميل الإعلانات النشطة للبريد الإلكتروني: $email');
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('created ads')
          .where('status', isEqualTo: 'الاعلان نشط')
          .where('email', isEqualTo: email)
          .orderBy('timestamp', descending: true)
          .get();

      print('تم العثور على إعلانات نشطة: ${querySnapshot.docs.length}');
      setState(() {
        _ads = querySnapshot.docs;
        _isLoading = false;
      });
    } catch (e) {
      print('خطأ في تحميل الإعلانات النشطة: $e'); // جملة طباعة للتصحيح
      setState(() {
        _isLoading = false;
        _errorMessage = S.of(context).error_loading_ads(e.toString());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).active_ads, style: TextStyle(color: Colors.white)),
          backgroundColor: purpleColor,
        ),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (_errorMessage.isNotEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).active_ads, style: TextStyle(color: Colors.white)),
          backgroundColor: purpleColor,
        ),
        body: Center(child: Text(_errorMessage)),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).active_ads, style: TextStyle(color: Colors.white)),
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

    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ExpansionTile(
        tilePadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        title: Text(
          '${S.of(context).ad_details} $adNumber: ${adName.isNotEmpty ? adName : ''}',
          style: TextStyle(fontWeight: FontWeight.bold, color: purpleColor),
        ),
        subtitle: Text('${S.of(context).ad_details}: ${adData['status']}'),
        trailing: PopupMenuButton<String>(
          onSelected: (String value) {
            if (value == 'details') {
              _showAdDetails(ad);
            } else if (value == 'stop') {
              _stopAdRequest(ad);
            } else if (value == 'results') {
              _showAdResults();
            } else if (value == 'increase') {
              _showBudgetDialog(ad);
            } else if (value == 'edit') {
              _showEditDialog(ad);
            }
          },
          itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem<String>(
                value: 'details',
                child: Text(S.of(context).ad_details),
              ),
              PopupMenuItem<String>(
                value: 'stop',
                child: Text(S.of(context).stop_ad_request),
              ),
              PopupMenuItem<String>(
                value: 'results',
                child: Text(S.of(context).ad_results),
              ),
              PopupMenuItem<String>(
                value: 'increase',
                child: Text(S.of(context).increase_ad),
              ),
              PopupMenuItem<String>(
                value: 'edit',
                child: Text(S.of(context).edit_ad),
              ),
            ];
          },
        ),
        children: <Widget>[
          ListTile(
            title: Text(S.of(context).ad_details),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _buildAdDetails(adData),
            ),
          ),
        ],
      ),
    );
  }


  List<Widget> _buildAdDetails(Map<String, dynamic> adData) {
    List<Widget> details = [
      if (adData['Platform'] != null && adData['Platform'].toString().isNotEmpty) Text('${S.of(context).platform}: ${adData['Platform']}'),
      if (adData['ad goal'] != null && adData['ad goal'].toString().isNotEmpty) Text('${S.of(context).ad_goal}: ${adData['ad goal']}'),
      if (adData['gender'] != null && adData['gender'].toString().isNotEmpty) Text('${S.of(context).gender}: ${adData['gender']}'),
      if (adData['age from'] != null && adData['age from'].toString().isNotEmpty && adData['age to'] != null && adData['age to'].toString().isNotEmpty) Text('${S.of(context).age}: من ${adData['age from']} إلى ${adData['age to']}'),
      if (adData['budget'] != null && adData['budget'].toString().isNotEmpty) Text('${S.of(context).budget}: ${adData['budget']}'),
      if (adData['duration'] != null && adData['duration'].toString().isNotEmpty) Text('${S.of(context).duration}: ${adData['duration']} أيام'),
      if (adData['country'] != null && adData['country'].toString().isNotEmpty) Text('${S.of(context).country}: ${adData['country']}'),
      if (adData['location'] != null && adData['location'].toString().isNotEmpty) Text('${S.of(context).location}: ${adData['location']}'),
      if (adData['interests'] != null && adData['interests'].toString().isNotEmpty) Text('${S.of(context).interests}: ${adData['interests']}'),
      if (adData['behavior'] != null && adData['behavior'].toString().isNotEmpty) Text('${S.of(context).behavior}: ${adData['behavior']}'),
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
      if (adData['text post'] != null && adData['text post'].toString().isNotEmpty && adData['Link post'] == null) Text('${S.of(context).text_post}: ${adData['text post']}'),
      if (adData['image post'] != null && adData['image post'].toString().isNotEmpty) Text('${S.of(context).image_post}: ${adData['image post']}'),
    ];
    return details;
  }

  Future<void> _stopAdRequest(DocumentSnapshot ad) async {
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

      // Adding notification
      await FirebaseFirestore.instance.collection('notifications').add({
        'email': email,
        'message': S.of(context).stop_ad_request_sent,
        'timestamp': Timestamp.now(),
        'isRead': false,
      });

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(S.of(context).stop_ad_request_sent),
        backgroundColor: purpleColor,
      ));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('حدث خطأ: $e'),
        backgroundColor: Colors.red,
      ));
    }
  }

  Future<void> _showBudgetDialog(DocumentSnapshot ad) async {
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
              title: Center(child: Text(S.of(context).increase_ad, style: TextStyle(color: purpleColor))),
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
                              title: Center(child: Text(S.of(context).success, style: TextStyle(color: purpleColor))),
                              content: Text(S.of(context).increase_request_sent(budget.toString(), days.toString())),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(S.of(context).ok, style: TextStyle(color: Colors.white)),
                                  style: TextButton.styleFrom(
                                    backgroundColor: purpleColor,
                                    foregroundColor: Colors.white,
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('حدث خطأ: $e'),
                          backgroundColor: Colors.red,
                        ));
                      }
                    }
                  },
                  child: Text(S.of(context).increase_ad),
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

  Future<double> _getCurrentBalance() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('clients')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get();
    var balanceData = snapshot.data() as Map<String, dynamic>?;
    return balanceData != null ? balanceData['total_balance']?.toDouble() ?? 0.0 : 0.0;
  }

  Future<void> _showEditDialog(DocumentSnapshot ad) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: Text(S.of(context).edit_ad, style: TextStyle(color: purpleColor))),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _showTargetingChangeDialog(ad);
                },
                child: Text(S.of(context).request_targeting_change),
                style: ElevatedButton.styleFrom(
                  backgroundColor: purpleColor,
                  foregroundColor: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _showOtherEditDialog(ad);
                },
                child: Text(S.of(context).other_edit),
                style: ElevatedButton.styleFrom(
                  backgroundColor: purpleColor,
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _showTargetingChangeDialog(DocumentSnapshot ad) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: Text(S.of(context).targeting_change, style: TextStyle(color: purpleColor))),
          content: Text(S.of(context).targeting_change_note),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(S.of(context).cancel),
            ),
            ElevatedButton(
              onPressed: () async {
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
                  'action': S.of(context).request_targeting_change,
                  'ad name': adData.containsKey('ad name') ? adData['ad name'] : '',
                  'adID': adID,
                  'createdTime': Timestamp.now(),
                  'customerID': customerID,
                  'email': email,
                  'note': S.of(context).targeting_change_note,
                  'status': 'طلب جديد',
                });

                // Adding notification
                await FirebaseFirestore.instance.collection('notifications').add({
                  'email': email,
                  'message': S.of(context).targeting_change_sent,
                  'timestamp': Timestamp.now(),
                  'isRead': false,
                });

                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(S.of(context).targeting_change_sent),
                  backgroundColor: purpleColor,
                ));
              },
              child: Text(S.of(context).confirm),
              style: ElevatedButton.styleFrom(
                backgroundColor: purpleColor,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _showOtherEditDialog(DocumentSnapshot ad) async {
    TextEditingController editController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: Text(S.of(context).other_edit, style: TextStyle(color: purpleColor))),
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
                    backgroundColor: purpleColor,
                  ));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(S.of(context).enter_edit_details_error),
                    backgroundColor: Colors.red,
                  ));
                }
              },
              child: Text(S.of(context).save),
              style: ElevatedButton.styleFrom(
                backgroundColor: purpleColor,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        );
      },
    );
  }

  void _showAdDetails(DocumentSnapshot ad) {
    Map<String, dynamic> adData = ad.data() as Map<String, dynamic>;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: Text(S.of(context).ad_details, style: TextStyle(color: purpleColor))),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _buildAdDetails(adData),
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

  void _showAdResults() {
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
}
