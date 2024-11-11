import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled5/generated/l10n.dart';
import 'package:untitled5/screens/advertisements/advertisements_page.dart';
import 'package:untitled5/screens/create_ad/edit_ad_data_page.dart';
import 'package:untitled5/screens/create_ad/edit_ad_goal_page.dart';
import 'package:untitled5/screens/create_ad/keywords_and_titles_page.dart';
import 'package:untitled5/screens/create_ad/gender_and_age_page.dart';
import 'package:untitled5/screens/create_ad/location_selection_page.dart';
import 'package:untitled5/screens/create_ad/edit_duration_budget_page.dart';
import 'package:untitled5/screens/create_ad/posts_page.dart';
import 'package:untitled5/screens/create_ad/permissions_page.dart';
import 'package:untitled5/screens/create_ad/target/main_target_page.dart';

class CreateAdWithExpertsPage extends StatefulWidget {
  @override
  _CreateAdWithExpertsPageState createState() => _CreateAdWithExpertsPageState();
}

class _CreateAdWithExpertsPageState extends State<CreateAdWithExpertsPage> {
  String? _selectedPlatform;
  String? _adGoal;
  String? _adGoalType;
  String? _selectedGender;
  int? _ageFrom;
  int? _ageTo;
  double? _budget;
  int? _duration;
  String _selectedCountry = '';
  List<String>? _selectedRegions;
  List<String> _selectedInterests = [];
  List<String> _selectedDemographics = [];
  List<String> _selectedBehaviors = [];
  String? _postLink;
  String? _pageLink;
  String _postText = '';
  String _postImages = '';
  String _selectedOption = 'current';
  bool _adminUploaded = false;
  bool _friendRequestSent = false;
  String _permissionsStatus = '';
  bool _budgetError = false;
  bool _postError = false;
  bool _showPostError = false;
  bool _showLocationError = false;
  String _website = '';
  String _appLink = '';
  String _detailsForm = '';
  String _firstName = '';
  String _lastName = '';
  String _email = '';
  String _phone = '';
  String _whatsApp = '';
  List<String> _keywordsGoogle = [];
  String? _tiktokAdCode;
  String? _adGoalDescription;
  String? _googleType;
  String? _googlePhone;
  List<String> _excludedAreas = [];

  @override
  void initState() {
    super.initState();
    _loadUserData();
    _loadAdDetails();
  }

  Future<void> _loadUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      String userId = user.uid;
      DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('clients').doc(userId).get();
      if (userDoc.exists) {
        setState(() {
          _firstName = userDoc['firstName'] ?? '';
          _lastName = userDoc['lastName'] ?? '';
          _email = userDoc['email'] ?? '';
          _phone = userDoc['phone'] ?? '';
        });
      }
    }
  }

  Future<void> _loadAdDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _selectedPlatform = prefs.getString('selectedPlatform') ?? '';
      _adGoal = prefs.getString('selectedAdGoal') ?? '';
      _adGoalType = prefs.getString('selectedAdGoalType') ?? '';
      _selectedGender = prefs.getString('selectedGender') ?? '';
      _ageFrom = prefs.getInt('ageFrom');
      _ageTo = prefs.getInt('ageTo');
      _budget = prefs.getDouble('budget')?.toDouble() ?? 0.0;
      _duration = prefs.getInt('duration') ?? 0;
      _selectedCountry = prefs.getString('selectedCountry') ?? '';
      _selectedRegions = prefs.getStringList('selectedRegions') ?? [];
      _selectedInterests = prefs.getStringList('selectedInterests') ?? [];
      _selectedDemographics = prefs.getStringList('selectedStatuses') ?? [];
      _selectedBehaviors = prefs.getStringList('selectedBehaviors') ?? [];
      _postLink = prefs.getString('postLink') ?? '';
      _pageLink = prefs.getString('pageLink') ?? '';
      _selectedOption = prefs.getString('selectedOption') ?? 'current';
      _postText = prefs.getString('postContent') ?? '';
      _postImages = (prefs.getStringList('imageUrls') ?? []).join(' | ');
      _permissionsStatus = prefs.getString('permissionsStatus') ?? '';
      _website = prefs.getString('website') ?? '';
      _appLink = prefs.getString('appLink') ?? '';
      _detailsForm = prefs.getString('detailsForm') ?? '';
      _keywordsGoogle = prefs.getStringList('keywords') ?? [];
      _tiktokAdCode = prefs.getString('tiktokAdCode') ?? '';
      _adGoalDescription = prefs.getString('adGoalDescription') ?? '';
      _googleType = prefs.getString('googleType') ?? '';
      _googlePhone = prefs.getString('googlePhone') ?? '';
      _excludedAreas = prefs.getStringList('excludedAreas') ?? [];
      _whatsApp = prefs.getString('whatsApp') ?? '';

      print('Loaded adGoalDescription: $_adGoalDescription');
      print('Loaded selectedAdGoal: $_adGoal');
      print('Loaded selectedAdGoalType: $_adGoalType');
      print('Loaded googleType: $_googleType');
      print('Loaded googlePhone: $_googlePhone');
      print('Loaded phone: ${prefs.getString('phone')}');
      print('Loaded price: ${prefs.getString('price')}');
      print('Loaded WhatsApp: ${prefs.getString('whatsApp')}');
    });
  }

  Future<bool> _checkUserBalance(double requiredBudget) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot clientDoc = await FirebaseFirestore.instance.collection('clients').doc(user.uid).get();
      if (clientDoc.exists) {
        var clientData = clientDoc.data() as Map<String, dynamic>?;
        if (clientData != null) {
          double currentBalance = clientData['total_balance']?.toDouble() ?? 0.0;
          return currentBalance >= requiredBudget;
        }
      }
    }
    return false;
  }

  Future<void> _deductBudget(double budget) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot clientDoc = await FirebaseFirestore.instance.collection('clients').doc(user.uid).get();
      if (clientDoc.exists) {
        var clientData = clientDoc.data() as Map<String, dynamic>?;
        if (clientData != null) {
          double currentBalance = clientData['total_balance']?.toDouble() ?? 0.0;
          double newBalance = currentBalance - budget;

          await FirebaseFirestore.instance.collection('clients').doc(user.uid).update({'total_balance': newBalance});

          await FirebaseFirestore.instance.collection('statement').add({
            'ID client': user.uid,
            'first name': clientData['firstName'] ?? '',
            'last name': clientData['lastName'] ?? '',
            'email': user.email,
            'addition_amount': 0,
            'deduction_amount': budget,
            'timestamp': Timestamp.now(),
            'transaction_name': 'Ad cost deduction',
          });
        }
      }
    }
  }

  Future<void> _saveAdDetails() async {
    if (_budget == null || _budget! <= 0 || _duration == null || _duration! <= 0) {
      setState(() {
        _budgetError = true;
      });
      return;
    } else {
      setState(() {
        _budgetError = false;
      });
    }

    if (!_validatePostSelection()) {
      setState(() {
        _postError = true;
        _showPostError = true;
      });
      return;
    } else {
      setState(() {
        _postError = false;
        _showPostError = false;
      });
    }

    if (_selectedCountry.isEmpty || (_selectedRegions?.isEmpty ?? true)) {
      setState(() {
        _showLocationError = true;
      });
      return;
    }

    bool hasEnoughBalance = await _checkUserBalance(_budget!);
    if (!hasEnoughBalance) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('الرصيد غير كافي لتشغيل الإعلان. يُرجى شحن الرصيد.')));
      return;
    }

    await _showAdNameDialog();
  }

  bool _validatePostSelection() {
    if (_selectedOption == 'current' && (_postLink == null || _postLink!.isEmpty)) {
      return false;
    }
    if (_selectedOption == 'new' && (_postText.isEmpty || _postImages.isEmpty)) {
      return false;
    }
    return true;
  }

  Future<void> _showAdNameDialog() async {
    String adName = '';
    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(S.of(context).enter_ad_name),
          content: TextField(
            onChanged: (value) {
              adName = value;
            },
            decoration: InputDecoration(hintText: S.of(context).ad_name_placeholder),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(S.of(context).ok, style: TextStyle(color: Colors.white)),
              style: TextButton.styleFrom(
                backgroundColor: Color(0xFF800080),
              ),
              onPressed: () async {
                Navigator.of(context).pop();
                await _saveAdToFirestore(adName);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _saveAdToFirestore(String adName) async {
    Map<String, dynamic> adData = {
      'Platform': _selectedPlatform,
      'ad goal': _adGoal == 'whatsapp_messages' ? 'رسايل واتس اب' : _adGoal ?? _adGoalType,
      'gender': _selectedGender,
      'budget': _budget,
      'duration': _duration,
      'country': _selectedCountry,
      'location': _selectedRegions?.join(' | '),
      'interests': _selectedInterests.join(' | '),
      'demographics': _selectedDemographics.join(' | '),
      'behavior': _selectedBehaviors.join(' | '),
      'first name': _firstName,
      'last name': _lastName,
      'email': _email,
      'phone': _adGoal == 'whatsapp_messages' ? '' : _phone,
      'whatsApp': _whatsApp,
      'timestamp': FieldValue.serverTimestamp(),
      'Permissions': _permissionsStatus,
      'ad name': adName,
      'status': 'في المراجعة من الادارة',
      'google type': _googleType,
      'google phone': _googlePhone,
      'exclude area': _excludedAreas.join(' | '),
    };

    if (_selectedPlatform == 'جوجل' || _selectedPlatform == 'Google') {
      adData['keywords google'] = _keywordsGoogle;
    }

    if (_selectedPlatform == 'تيك توك' || _selectedPlatform == 'TikTok') {
      adData['tiktok code'] = _tiktokAdCode;
    }

    if (_selectedOption == 'current') {
      adData['Link post'] = _postLink;
      if (_selectedPlatform == 'انستجرام' || _selectedPlatform == 'Instagram') {
        adData['link fb page'] = _pageLink;
      }
      adData['text post'] = null;
      adData['image post'] = null;
    } else if (_selectedOption == 'new') {
      adData['Link post'] = null;
      adData['text post'] = _postText;
      adData['image post'] = _postImages;
    }

    if (_adGoal == 'زيارات علي موقع ويب' || _adGoal == 'Website Visits') {
      adData['website'] = _website;
    } else if (_adGoal == 'تحميل تطبيق' || _adGoal == 'App Install') {
      adData['app link'] = _appLink;
    } else if (_adGoal == 'نماذج فوري' || _adGoal == 'Lead Generation') {
      adData['details form'] = _detailsForm;
    }

    if (_ageFrom != null) {
      adData['age from'] = _ageFrom;
    }
    if (_ageTo != null) {
      adData['age to'] = _ageTo;
    }

    try {
      await FirebaseFirestore.instance.collection('created ads').add(adData);
      await _deductBudget(_budget!);
      await _showConfirmationDialog();
    } catch (e) {
      print('Error saving ad: $e');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('حدث خطأ أثناء تشغيل الإعلان')));
    }
  }

  Future<void> _showConfirmationDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(S.of(context).request_received),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(S.of(context).ad_sent_success),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(S.of(context).ok, style: TextStyle(color: Colors.white)),
              style: TextButton.styleFrom(
                backgroundColor: Color(0xFF800080),
              ),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => AdvertisementsPage()),
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final Color purpleColor = Color(0xFF800080);

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).create_ad_with_experts, style: TextStyle(color: Colors.white)),
        backgroundColor: purpleColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              _selectedPlatform == 'جوجل' || _selectedPlatform == 'Google'
                  ? S.of(context).website_link
                  : _selectedPlatform == 'يوتيوب' || _selectedPlatform == 'YouTube'
                  ? S.of(context).select_video
                  : S.of(context).post_content,
              style: TextStyle(fontSize: 18),
            ),
            Divider(),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: Icon(Icons.public, color: purpleColor),
                    title: Text(S.of(context).select_platform, style: TextStyle(fontSize: 18)),
                    subtitle: Text(_selectedPlatform != null && _selectedPlatform!.isNotEmpty ? _selectedPlatform! : S.of(context).select_platform),
                    trailing: Icon(Icons.edit, color: Colors.grey),
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EditAdDataPage()),
                      );
                      _loadAdDetails();
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.flag, color: purpleColor),
                    title: Text(S.of(context).ad_goal, style: TextStyle(fontSize: 18)),
                    subtitle: Text(_adGoalType != null && _adGoalType!.isNotEmpty ? _adGoalType! : (_adGoal != null && _adGoal!.isNotEmpty ? _adGoal! : S.of(context).select_ad_goal)),
                    trailing: Icon(Icons.edit, color: Colors.grey),
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EditAdGoalPage()),
                      );
                      _loadAdDetails();
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.people, color: purpleColor),
                    title: Text(
                      _selectedPlatform == 'جوجل' || _selectedPlatform == 'Google'
                          ? S.of(context).keywords_and_titles
                          : S.of(context).target_audience,
                      style: TextStyle(fontSize: 18),
                    ),
                    subtitle: Text(
                      _selectedPlatform == 'جوجل' || _selectedPlatform == 'Google'
                          ? S.of(context).click_to_edit_keywords_and_titles
                          : _selectedInterests.isNotEmpty
                          ? _selectedInterests.join(' | ')
                          : S.of(context).empty_page,
                    ),
                    trailing: Icon(Icons.edit, color: Colors.grey),
                    onTap: () async {
                      if (_selectedPlatform == 'جوجل' || _selectedPlatform == 'Google') {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => KeywordsAndTitlesPage()),
                        );
                      } else {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MainTargetPage()),
                        );
                      }
                      _loadAdDetails();
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.group, color: purpleColor),
                    title: Text(S.of(context).gender_and_age, style: TextStyle(fontSize: 18)),
                    subtitle: Text(_selectedGender != null && _selectedGender!.isNotEmpty && _ageFrom != null && _ageTo != null
                        ? '${S.of(context).gender}: ${_selectedGender == 'men' ? S.of(context).men : _selectedGender == 'women' ? S.of(context).women : S.of(context).men_and_women}، ${S.of(context).age}: $_ageFrom - $_ageTo'
                        : S.of(context).gender_and_age),
                    trailing: Icon(Icons.edit, color: Colors.grey),
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GenderAndAgePage()),
                      );
                      _loadAdDetails();
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.location_on, color: purpleColor),
                    title: Text(S.of(context).location_selection, style: TextStyle(fontSize: 18)),
                    subtitle: Text(_selectedCountry.isNotEmpty && _selectedRegions != null
                        ? '${S.of(context).country}: $_selectedCountry، ${S.of(context).regions}: ${_selectedRegions?.join(', ')}'
                        : S.of(context).location_selection),
                    trailing: Icon(Icons.edit, color: Colors.grey),
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LocationSelectionPage()),
                      );
                      _loadAdDetails();
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.schedule, color: purpleColor),
                    title: Text(S.of(context).duration_and_budget, style: TextStyle(fontSize: 18)),
                    subtitle: Text(_duration != null && _budget != null
                        ? '${S.of(context).duration}: $_duration ${S.of(context).days}، ${S.of(context).budget}: $_budget ${S.of(context).currency}'
                        : S.of(context).duration_and_budget),
                    trailing: Icon(Icons.edit, color: Colors.grey),
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EditDurationBudgetPage()),
                      );
                      _loadAdDetails();
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.post_add, color: purpleColor),
                    title: Text(
                      _selectedPlatform == 'جوجل' || _selectedPlatform == 'Google'
                          ? S.of(context).website_link
                          : _selectedPlatform == 'يوتيوب' || _selectedPlatform == 'YouTube'
                          ? S.of(context).select_video
                          : S.of(context).post_content,
                      style: TextStyle(fontSize: 18),
                    ),
                    subtitle: Text(
                      (_selectedOption == 'current' && _postLink != null && _postLink!.isNotEmpty) ||
                          (_selectedOption == 'new' && _postText.isNotEmpty && _postImages.isNotEmpty)
                          ? S.of(context).post_content_selected
                          : S.of(context).select_video_or_add,
                    ),
                    trailing: Icon(Icons.edit, color: Colors.grey),
                    onTap: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PostsPage()),
                      );
                      if (result != null) {
                        setState(() {
                          _selectedOption = result['selectedOption'];
                          if (_selectedOption == 'current') {
                            _postLink = result['postLink'];
                            _pageLink = result['pageLink'];
                          } else if (_selectedOption == 'new') {
                            _postLink = null;
                            _postText = result['postContent'];
                            _postImages = result['imageUrls'];
                          }
                          _tiktokAdCode = result['adCode'];
                          _showPostError = false;
                        });
                      }
                    },
                  ),
                  Divider(),
                  if (!['جوجل', 'Google', 'يوتيوب', 'YouTube', 'تيك توك', 'TikTok'].contains(_selectedPlatform))
                    ListTile(
                      leading: Icon(Icons.security, color: purpleColor),
                      title: Text(S.of(context).permissions, style: TextStyle(fontSize: 18)),
                      subtitle: Text(_permissionsStatus.isNotEmpty ? _permissionsStatus : S.of(context).permissions),
                      trailing: Icon(Icons.edit, color: Colors.grey),
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PermissionsPage(
                            onPermissionSelected: (status) {
                              setState(() {
                                _permissionsStatus = status;
                              });
                            },
                          )),
                        );
                      },
                    ),
                  if (_budgetError)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Center(
                        child: Text(
                          S.of(context).budget_days_error,
                          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  if (_showPostError)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Center(
                        child: Text(
                          S.of(context).post_selection_error,
                          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  if (_showLocationError)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Center(
                        child: Text(
                          S.of(context).please_select_target_locations,
                          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: _saveAdDetails,
                child: Text(S.of(context).submit_ad, style: TextStyle(fontSize: 20, color: Colors.white)),
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
