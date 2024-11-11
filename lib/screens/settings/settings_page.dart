//lib/screens/settings/settings_page.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart'; // تأكد من استيراد المكتبة هنا
import '../../providers/user_provider.dart';
import 'edit_profile_page.dart';
import 'accounts_page.dart';
import 'faq_page.dart';
import 'support_page.dart';
import 'change_language_page.dart';
import 'change_password_page.dart';
import '../home_page.dart';
import '../advertisements/advertisements_page.dart';
import '../create_ad/create_ad_page.dart';
import '../wallet/wallet_screen.dart';
import '../../widgets/bottom_nav_bar.dart';
import '../login_screen.dart';
import '../../generated/l10n.dart';
import '../../main.dart';
import 'partner_for_success_page.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  int _selectedIndex = 4;
  final Color purpleColor = Color(0xFF800080);
  String firstName = '';
  String lastName = '';
  String uid = '';

  @override
  void initState() {
    super.initState();
    _fetchUserDetails();
  }

  void _fetchUserDetails() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final userId = user.uid;
      final userDoc = await FirebaseFirestore.instance.collection('clients').doc(userId).get();
      if (userDoc.exists) {
        final userData = userDoc.data();
        setState(() {
          firstName = userData?['firstName'] ?? '';
          lastName = userData?['lastName'] ?? '';
          uid = userId;
        });
      }
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
        default:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => SettingsPage()),
          );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).settings,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: purpleColor,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      child: Icon(Icons.person, size: 40),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '\$firstName \$lastName',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue.shade900),
                    ),
                    SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (uid.length >= 5)
                          Text(
                            uid.substring(0, 5), // Display only the first 5 characters
                            style: TextStyle(color: Colors.grey),
                          ),
                        IconButton(
                          icon: Icon(Icons.copy, color: Colors.grey),
                          onPressed: () {
                            Clipboard.setData(ClipboardData(text: uid)); // Copy the full ID
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(S.of(context).uid_copied))
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              _buildSettingsOption(
                context,
                icon: Icons.person,
                title: S.of(context).edit_profile,
                onTap: () async {
                  final updatedName = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EditProfilePage()),
                  );
                  if (updatedName != null && updatedName is String) {
                    setState(() {
                      List<String> names = updatedName.split(' ');
                      firstName = names[0];
                      lastName = names[1];
                    });
                  }
                },
              ),
              _buildSettingsOption(
                context,
                icon: Icons.account_balance_wallet,
                title: S.of(context).account_balance_wallet,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AccountsPage()),
                  );
                },
              ),
              _buildSettingsOption(
                context,
                icon: Icons.question_answer,
                title: S.of(context).faq,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FAQPage(initialQuestionIndex: 0)),
                  );
                },
              ),
              _buildSettingsOption(
                context,
                icon: Icons.headset_mic,
                title: S.of(context).support,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SupportPage()),
                  );
                },
              ),
              _buildSettingsOption(
                context,
                icon: Icons.language,
                title: S.of(context).change_language,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChangeLanguagePage(setLocale: (locale) {
                      setState(() {
                        MyAppState? appState = context.findAncestorStateOfType<MyAppState>();
                        appState?.setLocale(locale);
                      });
                    })),
                  );
                },
              ),
              _buildSettingsOption(
                context,
                icon: Icons.monetization_on,
                title: 'كن شريك النجاح - قريبا',
                onTap: () {
                  // Do nothing
                },
              ),
              _buildSettingsOption(
                context,
                icon: Icons.logout,
                title: S.of(context).logout,
                iconColor: Colors.red,
                textColor: Colors.red,
                onTap: () {
                  _showLogoutConfirmationDialog(context);
                },
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

  Widget _buildSettingsOption(BuildContext context,
      {required IconData icon, required String title, Color iconColor = Colors.black, Color textColor = Colors.black, required VoidCallback onTap}) {
    return Card(
      child: ListTile(
        leading: Icon(icon, color: purpleColor),
        title: Text(
          title,
          style: TextStyle(color: textColor),
        ),
        trailing: Icon(Icons.arrow_forward, color: purpleColor),
        onTap: onTap,
      ),
    );
  }

  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.person, color: Colors.red, size: 48),
              SizedBox(height: 16),
              Text(
                S.of(context).logout_confirmation,
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
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
              onPressed: () {
                Navigator.of(context).pop();
                _logout();
              },
              child: Text(
                S.of(context).confirm,
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
            ),
          ],
        );
      },
    );
  }

  void _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('rememberMe', false);
    FirebaseAuth.instance.signOut();
    Navigator.pushReplacementNamed(context, '/login');
  }
}
