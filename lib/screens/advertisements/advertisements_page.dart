import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../widgets/bottom_nav_bar.dart';
import '../home_page.dart';
import '../create_ad/create_ad_page.dart';
import '../wallet/wallet_screen.dart';
import '../settings/settings_page.dart';
import '../ads/ads_controller.dart';
import '../notification_page.dart';
import '../settings/support_page.dart';
import '../ads/facebook_ads_page.dart';
import '../ads/active_ads_ui.dart'; // إضافة الملف الجديد للواجهة
import '../ads/stopped_ads_ui.dart';
import 'package:untitled5/generated/l10n.dart';

class AdvertisementsPage extends StatefulWidget {
  @override
  _AdvertisementsPageState createState() => _AdvertisementsPageState();
}

class _AdvertisementsPageState extends State<AdvertisementsPage> {
  final AdsController _controller = AdsController();
  int _selectedIndex = 1;
  String _displayText = '';
  Map<String, dynamic>? _userData;
  int _newNotificationsCount = 0;
  int _facebookAdsCount = 0;
  int _activeAdsCount = 0;
  int _stoppedAdsCount = 0;
  String? _userEmail;
  bool _isFacebookAdsActive = false;
  bool _isActiveAdsActive = false;

  final Color purpleColor = Color(0xFF800080);

  @override
  void initState() {
    super.initState();
    _loadUserEmail();
  }

  Future<void> _loadUserEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _userEmail = prefs.getString('email');
    });
    if (_userEmail != null) {
      await _getFacebookAdsCount();
      await _getNewNotificationsCount();
      await _getActiveAdsCount();
      await _getStoppedAdsCount();
    }
  }

  Future<void> _getNewNotificationsCount() async {
    if (_userEmail == null) return;

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('notifications')
        .where('isRead', isEqualTo: false)
        .where('email', isEqualTo: _userEmail)
        .get();

    if (mounted) {
      setState(() {
        _newNotificationsCount = querySnapshot.docs.length;
      });
    }
  }

  Future<void> _getFacebookAdsCount() async {
    if (_userEmail == null) return;

    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('created ads')
          .where('Platform', isEqualTo: 'فيس بوك')
          .where('email', isEqualTo: _userEmail)
          .get();

      if (mounted) {
        setState(() {
          _facebookAdsCount = querySnapshot.docs.length;
        });
      }
    } catch (e) {
      print("Error fetching Facebook ads count: $e");
    }
  }

  Future<void> _getActiveAdsCount() async {
    if (_userEmail == null) return;

    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('created ads')
          .where('status', isEqualTo: 'الاعلان نشط')
          .where('email', isEqualTo: _userEmail)
          .get();

      if (mounted) {
        setState(() {
          _activeAdsCount = querySnapshot.docs.length;
        });
      }
    } catch (e) {
      print("Error fetching active ads count: $e");
    }
  }

  Future<void> _getStoppedAdsCount() async {
    if (_userEmail == null) return;

    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('created ads')
          .where('status', isEqualTo: 'تم الايقاف من العميل')
          .where('email', isEqualTo: _userEmail)
          .get();

      if (mounted) {
        setState(() {
          _stoppedAdsCount = querySnapshot.docs.length;
        });
      }
    } catch (e) {
      print("Error fetching stopped ads count: $e");
    }
  }

  void _onAdButtonPressed(String text, bool isFacebookAdsButton) {
    setState(() {
      _displayText = text;
      _isFacebookAdsActive = isFacebookAdsButton;
      _isActiveAdsActive = !isFacebookAdsButton;
    });

    if (isFacebookAdsButton) {
      _getFacebookAdsCount();
    } else {
      _getActiveAdsCount();
    }
  }

  void _loginWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login();

    if (result.status == LoginStatus.success) {
      final AccessToken accessToken = result.accessToken!;
      final userData = await FacebookAuth.instance.getUserData(
          fields: "email,name,picture.width(200),posts{message},accounts{name}"
      );
      if (mounted) {
        setState(() {
          _userData = userData;
          _displayText = 'Account successfully linked';
        });
      }
    } else {
      print(result.status);
      print(result.message);
    }
  }

  void _logout() async {
    await FacebookAuth.instance.logOut();
    if (mounted) {
      setState(() {
        _userData = null;
        _displayText = '';
      });
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
          break;
        case 2:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => CreateAdPage()),
          );
          break;
        case 3:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => WalletScreen()),
          );
          break;
        case 4:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => SettingsPage()),
          );
          break;
        default:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => AdvertisementsPage()),
          );
      }
    });
  }

  void _showAllAdsPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FacebookAdsPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).advertisements, style: TextStyle(color: Colors.white)),
        backgroundColor: purpleColor,
        automaticallyImplyLeading: false,
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.notifications, size: 30, color: Colors.white),
                onPressed: () async {
                  await Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => NotificationPage()),
                  );
                  _getNewNotificationsCount();
                },
              ),
              if (_newNotificationsCount > 0)
                Positioned(
                  right: 11,
                  top: 11,
                  child: Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 18,
                      minHeight: 18,
                    ),
                    child: Text(
                      '$_newNotificationsCount',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(width: 16),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SupportPage()),
              );
            },
            child: Text(S.of(context).support),
            style: ElevatedButton.styleFrom(
              backgroundColor: purpleColor,
              foregroundColor: Colors.white,
              elevation: 0,
              textStyle: TextStyle(fontSize: 18),
              padding: EdgeInsets.symmetric(horizontal: 12),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: buildButton(S.of(context).all_ads, Icons.facebook, () {
                      _onAdButtonPressed(S.of(context).all_ads, true);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FacebookAdsPage()),
                      );
                    }, active: _isFacebookAdsActive),
                  ),
                  SizedBox(width: 10), // مسافة بين الزرين
                  Expanded(
                    child: buildButton(S.of(context).active_ads, Icons.campaign, () {
                      _onAdButtonPressed(S.of(context).active_ads, false);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ActiveAdsPage()),
                      );
                    }, active: _isActiveAdsActive),
                  ),
                ],
              ),
              SizedBox(height: 20), // مسافة بين الصفوف
              buildButton(S.of(context).stopped_ads, Icons.pause_circle, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StoppedAdsPage()),
                );
              }),
              SizedBox(height: 20), // مسافة بين الصفوف
              _displayText.isEmpty
                  ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.touch_app,
                      size: 80,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 20),
                    Text(
                      S.of(context).view_all_ads,
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton.icon(
                      onPressed: _showAllAdsPage,
                      icon: Icon(Icons.link, size: 28),
                      label: Text(S.of(context).show_ads, style: TextStyle(fontSize: 18)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: purpleColor,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                      ),
                    ),
                  ],
                ),
              )
                  : Center(
                child: Text(
                  _displayText,
                  style: TextStyle(fontSize: 24, color: Colors.blue.shade900),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget buildButton(String label, IconData icon, VoidCallback onPressed, {bool active = false}) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: active ? Colors.orangeAccent : Colors.white,
        foregroundColor: active ? Colors.white : purpleColor,
        padding: const EdgeInsets.all(20.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        minimumSize: Size(150, 150), // جعل الأزرار بنفس الحجم
      ),
      onPressed: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40),
          SizedBox(height: 12),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}