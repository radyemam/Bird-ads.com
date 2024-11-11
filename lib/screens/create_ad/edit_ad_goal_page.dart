import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled5/generated/l10n.dart';

class EditAdGoalPage extends StatefulWidget {
  @override
  _EditAdGoalPageState createState() => _EditAdGoalPageState();
}

class _EditAdGoalPageState extends State<EditAdGoalPage> {
  String? _selectedAdGoal;
  String? _adGoalType;
  String? _selectedPlatform;
  TextEditingController _websiteController = TextEditingController();
  TextEditingController _appLinkController = TextEditingController();
  TextEditingController _detailsFormController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _whatsAppController = TextEditingController();

  final List<Map<String, dynamic>> _adGoals = [
    {'name': 'messenger_messages', 'note': 'messenger_note', 'icon': Icons.message},
    {'name': 'whatsapp_messages', 'note': 'whatsapp_note', 'icon': Icons.chat},
    {'name': 'instagram_direct_messages', 'note': 'instagram_note', 'icon': Icons.send},
    {'name': 'post_engagement', 'note': 'post_engagement_note', 'icon': Icons.thumb_up},
    {'name': 'increase_followers', 'note': 'increase_followers_note', 'icon': Icons.group},
    {'name': 'website_visits', 'note': 'website_note', 'icon': Icons.web},
    {'name': 'instant_forms', 'note': 'instant_forms_note', 'icon': Icons.assignment},
    {'name': 'app_downloads', 'note': 'app_downloads_note', 'icon': Icons.cloud_download},
    {'name': 'contact_ad', 'note': 'contact_note', 'icon': Icons.phone},
  ];

  bool _isPriceSelected = false;

  @override
  void initState() {
    super.initState();
    _loadSelectedAdGoal();
    _loadSelectedPlatform();
  }

  void _loadSelectedAdGoal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _selectedAdGoal = prefs.getString('selectedAdGoal');
      _adGoalType = prefs.getString('selectedAdGoalType');
      _websiteController.text = prefs.getString('website') ?? '';
      _appLinkController.text = prefs.getString('appLink') ?? '';
      _detailsFormController.text = prefs.getString('detailsForm') ?? '';
      _phoneController.text = prefs.getString('phone') ?? '';
      _priceController.text = prefs.getString('price') ?? '';
      _whatsAppController.text = prefs.getString('whatsApp') ?? '';
      _isPriceSelected = _adGoalType != null && _adGoalType!.startsWith('إعلان اتصال محدد بسعر');
    });
  }

  void _loadSelectedPlatform() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _selectedPlatform = prefs.getString('selectedPlatform');
    });
  }

  void _selectAdGoal(String adGoal, [String? adGoalType]) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedAdGoal', adGoal);
    if (adGoalType != null) {
      await prefs.setString('selectedAdGoalType', adGoalType);
    } else {
      await prefs.remove('selectedAdGoalType');
    }
    setState(() {
      _selectedAdGoal = adGoal;
      _adGoalType = adGoalType;
      _websiteController.clear();
      _appLinkController.clear();
      _detailsFormController.clear();
      _isPriceSelected = false;
      _priceController.clear();
      _whatsAppController.clear();
    });
  }

  void _saveSelection() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedAdGoal', _selectedAdGoal ?? '');
    await prefs.setString('selectedAdGoalType', _adGoalType ?? '');
    await prefs.setString('website', _websiteController.text);
    await prefs.setString('appLink', _appLinkController.text);
    await prefs.setString('detailsForm', _detailsFormController.text);
    await prefs.setString('phone', _phoneController.text);
    await prefs.setString('price', _priceController.text);
    await prefs.setString('whatsApp', _whatsAppController.text);

    String adGoalDescription = '';
    if (_adGoalType == 'إعلان اتصال سمارت') {
      adGoalDescription = 'سمارت';
    } else if (_isPriceSelected) {
      adGoalDescription = 'محدد بسعر ${_priceController.text} للاتصال';
    }

    await prefs.setString('adGoalDescription', adGoalDescription);
    await prefs.setString('googleType', adGoalDescription);
    await prefs.setString('googlePhone', _phoneController.text);

    print('Saved adGoalDescription: $adGoalDescription');
    print('Saved selectedAdGoal: ${_selectedAdGoal}');
    print('Saved selectedAdGoalType: ${_adGoalType}');
    print('Saved phone: ${_phoneController.text}');
    print('Saved price: ${_priceController.text}');
    print('Saved WhatsApp: ${_whatsAppController.text}');

    Navigator.pop(context, _selectedAdGoal);
  }

  void _clearWebsite() {
    setState(() {
      _websiteController.clear();
    });
  }

  void _clearAppLink() {
    setState(() {
      _appLinkController.clear();
    });
  }

  void _clearDetailsForm() {
    setState(() {
      _detailsFormController.clear();
    });
  }

  void _clearPhone() {
    setState(() {
      _phoneController.clear();
    });
  }

  void _clearWhatsApp() {
    setState(() {
      _whatsAppController.clear();
    });
  }

  List<Map<String, dynamic>> _filterAdGoals() {
    List<Map<String, dynamic>> filteredAdGoals = _adGoals;
    final List<String> facebookValues = ['Facebook', 'فيس بوك'];
    final List<String> googleValues = ['Google', 'جوجل'];
    final List<String> youtubeValues = ['YouTube', 'يوتيوب'];
    final List<String> instagramValues = ['Instagram', 'انستجرام'];
    final List<String> tiktokValues = ['TikTok', 'تيك توك'];

    if (facebookValues.contains(_selectedPlatform)) {
      filteredAdGoals = filteredAdGoals.where((goal) => goal['name'] != 'instagram_direct_messages' && goal['name'] != 'contact_ad').toList();
    } else if (instagramValues.contains(_selectedPlatform)) {
      filteredAdGoals = filteredAdGoals.where((goal) => goal['name'] != 'messenger_messages' && goal['name'] != 'contact_ad').toList();
    } else if (tiktokValues.contains(_selectedPlatform)) {
      filteredAdGoals = filteredAdGoals.where((goal) => goal['name'] != 'messenger_messages' && goal['name'] != 'instagram_direct_messages' && goal['name'] != 'contact_ad').toList();
    } else if (youtubeValues.contains(_selectedPlatform)) {
      filteredAdGoals = filteredAdGoals.where((goal) => goal['name'] != 'messenger_messages' && goal['name'] != 'instagram_direct_messages' && goal['name'] != 'contact_ad' && goal['name'] != 'instant_forms').toList();
    } else if (googleValues.contains(_selectedPlatform)) {
      filteredAdGoals = filteredAdGoals.where((goal) => ![
        'instagram_direct_messages',
        'messenger_messages',
        'post_engagement',
        'increase_followers',
        'instant_forms'
      ].contains(goal['name'])).toList();
    }

    return filteredAdGoals;
  }

  @override
  Widget build(BuildContext context) {
    final Color purpleColor = Color(0xFF800080);
    final localization = S.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(localization.choose_ad_goal_title, style: TextStyle(color: Colors.white)),
        backgroundColor: purpleColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                localization.choose_ad_goal,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: purpleColor),
              ),
              SizedBox(height: 16),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _filterAdGoals().length,
                itemBuilder: (context, index) {
                  var adGoal = _filterAdGoals()[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: Icon(adGoal['icon'], color: purpleColor),
                      title: Row(
                        children: [
                          Expanded(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  Text(localization.translate(adGoal['name']), style: TextStyle(fontSize: 18)),
                                  SizedBox(width: 8),
                                  Text(localization.translate(adGoal['note']), style: TextStyle(fontSize: 12, color: Colors.grey)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      trailing: _selectedAdGoal == localization.translate(adGoal['name'])
                          ? Icon(Icons.check_circle, color: Colors.green)
                          : null,
                      onTap: () => _selectAdGoal(localization.translate(adGoal['name'])),
                    ),
                  );
                },
              ),
              if (_selectedAdGoal == localization.translate('contact_ad')) ...[
                ListTile(
                  title: Text(localization.smart, style: TextStyle(fontSize: 18)),
                  subtitle: Text(localization.smart_note, style: TextStyle(fontSize: 12, color: Colors.grey)),
                  trailing: Radio(
                    value: 'إعلان اتصال سمارت',
                    groupValue: _adGoalType,
                    onChanged: (String? value) {
                      setState(() {
                        _adGoalType = value;
                        _isPriceSelected = false;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text(localization.price, style: TextStyle(fontSize: 18)),
                  subtitle: Text(localization.price_note, style: TextStyle(fontSize: 12, color: Colors.grey)),
                  trailing: Radio(
                    value: 'إعلان اتصال محدد بسعر',
                    groupValue: _adGoalType,
                    onChanged: (String? value) {
                      setState(() {
                        _adGoalType = value;
                        _isPriceSelected = true;
                      });
                    },
                  ),
                ),
                if (_isPriceSelected)
                  TextField(
                    controller: _priceController,
                    decoration: InputDecoration(
                      labelText: localization.set_price,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      suffixText: 'ج.م',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: purpleColor),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                SizedBox(height: 16),
                TextField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    labelText: localization.enter_phone,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: purpleColor),
                    ),
                  ),
                  keyboardType: TextInputType.phone,
                ),
                if (_phoneController.text.isNotEmpty) ...[
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          localization.saved_phone,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.clear, color: Colors.red),
                        onPressed: _clearPhone,
                      ),
                    ],
                  ),
                  Text(
                    _phoneController.text,
                    style: TextStyle(fontSize: 16, color: Colors.blue, decoration: TextDecoration.underline),
                  ),
                ],
                SizedBox(height: 16),
              ],
              if (_selectedAdGoal == localization.website_visits) ...[
                TextField(
                  controller: _websiteController,
                  decoration: InputDecoration(
                    labelText: localization.website_link,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: purpleColor),
                    ),
                  ),
                ),
                if (_websiteController.text.isNotEmpty) ...[
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          localization.saved_link,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.clear, color: Colors.red),
                        onPressed: _clearWebsite,
                      ),
                    ],
                  ),
                  Text(
                    _websiteController.text,
                    style: TextStyle(fontSize: 16, color: Colors.blue, decoration: TextDecoration.underline),
                  ),
                ],
              ],
              if (_selectedAdGoal == localization.app_downloads) ...[
                TextField(
                  controller: _appLinkController,
                  decoration: InputDecoration(
                    labelText: localization.app_link,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: purpleColor),
                    ),
                  ),
                ),
                if (_appLinkController.text.isNotEmpty) ...[
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          localization.saved_app_link,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.clear, color: Colors.red),
                        onPressed: _clearAppLink,
                      ),
                    ],
                  ),
                  Text(
                    _appLinkController.text,
                    style: TextStyle(fontSize: 16, color: Colors.blue, decoration: TextDecoration.underline),
                  ),
                ],
              ],
              if (_selectedAdGoal == localization.instant_forms) ...[
                TextField(
                  controller: _detailsFormController,
                  decoration: InputDecoration(
                    labelText: localization.instant_form_details,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: purpleColor),
                    ),
                  ),
                ),
                if (_detailsFormController.text.isNotEmpty) ...[
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          localization.saved_instant_form_details,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.clear, color: Colors.red),
                        onPressed: _clearDetailsForm,
                      ),
                    ],
                  ),
                  Text(
                    _detailsFormController.text,
                    style: TextStyle(fontSize: 16, color: Colors.blue, decoration: TextDecoration.underline),
                  ),
                ],
              ],
              if (_selectedAdGoal == localization.whatsapp_messages) ...[
                TextField(
                  controller: _whatsAppController,
                  decoration: InputDecoration(
                    labelText: localization.whatsapp_number,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: purpleColor),
                    ),
                  ),
                  keyboardType: TextInputType.phone,
                ),
                if (_whatsAppController.text.isNotEmpty) ...[
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          localization.saved_whatsapp_number,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.clear, color: Colors.red),
                        onPressed: _clearWhatsApp,
                      ),
                    ],
                  ),
                  Text(
                    _whatsAppController.text,
                    style: TextStyle(fontSize: 16, color: Colors.blue, decoration: TextDecoration.underline),
                  ),
                ],
                SizedBox(height: 16),
              ],
              Center(
                child: ElevatedButton(
                  onPressed: _saveSelection,
                  child: Text(localization.save, style: TextStyle(fontSize: 20, color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: purpleColor,
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

extension LocalizationExtension on S {
  String translate(String key) {
    switch (key) {
      case 'messenger_messages':
        return messenger_messages;
      case 'whatsapp_messages':
        return whatsapp_messages;
      case 'instagram_direct_messages':
        return instagram_direct_messages;
      case 'post_engagement':
        return post_engagement;
      case 'increase_followers':
        return increase_followers;
      case 'website_visits':
        return website_visits;
      case 'instant_forms':
        return instant_forms;
      case 'app_downloads':
        return app_downloads;
      case 'contact_ad':
        return contact_ad;
      case 'messenger_note':
        return messenger_note;
      case 'whatsapp_note':
        return whatsapp_note;
      case 'instagram_note':
        return instagram_note;
      case 'post_engagement_note':
        return post_engagement_note;
      case 'increase_followers_note':
        return increase_followers_note;
      case 'website_note':
        return website_note;
      case 'instant_forms_note':
        return instant_forms_note;
      case 'app_downloads_note':
        return app_downloads_note;
      case 'contact_note':
        return contact_note;
      case 'smart':
        return smart;
      case 'price':
        return price;
      case 'smart_note':
        return smart_note;
      case 'price_note':
        return price_note;
      case 'set_price':
        return set_price;
      case 'website_link':
        return website_link;
      case 'app_link':
        return app_link;
      case 'instant_form_details':
        return instant_form_details;
      case 'saved_link':
        return saved_link;
      case 'saved_app_link':
        return saved_app_link;
      case 'saved_instant_form_details':
        return saved_instant_form_details;
      case 'enter_phone':
        return "برجاء تحديد رقم الهاتف بكود الدولة";
      case 'saved_phone':
        return "الهاتف المحفوظ";
      case 'whatsapp_number':
        return "رقم الواتس آب";
      case 'saved_whatsapp_number':
        return "رقم الواتس آب المحفوظ";
      case 'save':
        return "حفظ";
      case 'choose_ad_goal':
        return "برجاء اختيار هدف الإعلان";
      case 'choose_ad_goal_title':
        return "اختر هدف الإعلان";
      default:
        return key;
    }
  }
}
