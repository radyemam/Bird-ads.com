//lib/screens/wallet/wallet_screen.dart
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../widgets/bottom_nav_bar.dart';
import '../advertisements/advertisements_page.dart';
import '../create_ad/create_ad_page.dart';
import '../settings/settings_page.dart';
import '../home_page.dart';
import 'detailed_account_statement.dart';
import '../../generated/l10n.dart'; // استيراد الترجمة

class WalletScreen extends StatefulWidget {
  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  int _selectedIndex = 3;
  final Color purpleColor = Color(0xFF800080);
  User? user;

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
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
        case 4:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => SettingsPage()),
          );
          break;
        default:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => WalletScreen()),
          );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).wallet_balance, style: TextStyle(color: Colors.white)),
        automaticallyImplyLeading: false,
        backgroundColor: purpleColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('clients')
                  .doc(user?.uid)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }
                if (!snapshot.hasData || !snapshot.data!.exists) {
                  return Text(
                    '0 ج.م',
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
                    '0 ج.م',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: purpleColor,
                    ),
                  );
                }
                var totalBalance = balanceData['total_balance'] ?? 0.0;
                int roundedBalance = (totalBalance is int) ? totalBalance : (totalBalance as double).ceil();
                return Text(
                  '$roundedBalance ${S.of(context).currency}',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: purpleColor,
                  ),
                );
              },
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildIconColumn(context, S.of(context).refund_request, Icons.refresh, '/refund-request'),
                _buildIconColumn(context, S.of(context).add_coupon, Icons.qr_code, '/add-coupon'),
                _buildIconColumn(context, S.of(context).add_balance, Icons.add_circle, '/add-balance', iconColor: Colors.blue),
              ],
            ),
            SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailedAccountStatement()),
                );
              },
              icon: Icon(Icons.account_balance_wallet, color: Colors.white),
              label: Text(S.of(context).detailed_account_statement),
              style: ElevatedButton.styleFrom(
                backgroundColor: purpleColor,
                foregroundColor: Colors.white,
                minimumSize: Size(double.infinity, 50), // زرار يأخذ السطر كله
                textStyle: TextStyle(fontSize: 18),
              ),
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

  Column _buildIconColumn(BuildContext context, String label, IconData icon, String route, {Color? iconColor}) {
    return Column(
      children: [
        IconButton(
          icon: Icon(icon, size: 50, color: iconColor ?? purpleColor),
          onPressed: () {
            Navigator.pushNamed(context, route);
          },
        ),
        Text(label),
      ],
    );
  }
}
