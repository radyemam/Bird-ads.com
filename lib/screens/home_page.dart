//lib/screens/home_page.dart
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../widgets/banner_widget.dart';
import '../../widgets/bottom_nav_bar.dart';
import 'advertisements/advertisements_page.dart';
import 'create_ad/create_ad_page.dart';
import 'wallet/wallet_screen.dart';
import 'settings/settings_page.dart';
import 'notification_page.dart';
import 'settings/support_page.dart';
import 'settings/faq_page.dart';
import 'other_services/other_services_page.dart';
import 'create_ad/create_ad_with_experts_page.dart';
import 'package:untitled5/generated/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  int _currentBannerIndex = 0;
  int _newNotificationsCount = 0;
  String? _userEmail;

  final List<Widget> _banners = [];
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _loadUserEmail();
  }

  Future<void> _loadUserEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _userEmail = prefs.getString('email');
    });
    if (_userEmail != null) {
      await _getNewNotificationsCount();
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

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _banners.addAll([
      BannerWidget(
        text: S.of(context).faq_question_1,
        icon: Icons.star,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FAQPage(initialQuestionIndex: 0)),
          );
        },
      ),
      BannerWidget(
        text: S.of(context).faq_question_2,
        icon: Icons.ad_units,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FAQPage(initialQuestionIndex: 0)),
          );
        },
      ),
      BannerWidget(
        text: S.of(context).faq_question_3,
        icon: Icons.account_balance_wallet,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FAQPage(initialQuestionIndex: 0)),
          );
        },
      ),
    ]);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => AdvertisementsPage()),
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
          MaterialPageRoute(builder: (context) => HomePage()),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color purpleColor = Color(0xFF800080);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.all(4),
              child: Image.asset(
                'assets/images/logo.png',
                width: 55,
                height: 45,
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: Text(
                S.of(context).home,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        backgroundColor: purpleColor,
        automaticallyImplyLeading: false,
        actions: [
          Stack(
            alignment: Alignment.center,
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
                  right: 0,
                  top: 10,
                  child: Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
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
              backgroundColor: Colors.white,
              foregroundColor: purpleColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              textStyle: TextStyle(fontSize: 18),
              padding: EdgeInsets.symmetric(horizontal: 12),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: PageView.builder(
                controller: _pageController,
                itemCount: _banners.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentBannerIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return _banners[index];
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _banners.length,
                    (index) => GestureDetector(
                  onTap: () {
                    _pageController.animateToPage(
                      index,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: _currentBannerIndex == index ? purpleColor : Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ),
            ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        S.of(context).start_with_bird,
                        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: purpleColor),
                      ),
                      SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CreateAdWithExpertsPage()),
                          );
                        },
                        child: Text(
                          S.of(context).start,
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: purpleColor,
                          padding: EdgeInsets.symmetric(vertical: 20),
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        S.of(context).our_other_services,
                        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: purpleColor),
                      ),
                      SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => OtherServicesPage()),
                          );
                        },
                        child: Text(
                          S.of(context).browse_our_services,
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: purpleColor,
                          padding: EdgeInsets.symmetric(vertical: 20),
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        S.of(context).view_all_our_other_services,
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}