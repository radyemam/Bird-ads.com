import 'package:flutter/material.dart';
import 'package:untitled5/generated/l10n.dart'; // تأكد من استيراد مكتبة الترجمات
import '../screens/home_page.dart';
import '../screens/advertisements/advertisements_page.dart';
import '../screens/create_ad/create_ad_page.dart';
import '../screens/wallet/wallet_screen.dart';
import '../screens/settings/settings_page.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  BottomNavBar({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final Color purpleColor = Color(0xFF800080);

    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Column(
            children: [
              Icon(Icons.home),
              Text(S.of(context).home, style: TextStyle(fontSize: 12)),
            ],
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Column(
            children: [
              Icon(Icons.campaign),
              Text(S.of(context).advertisements, style: TextStyle(fontSize: 12)),
            ],
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Column(
            children: [
              Icon(Icons.create),
              Text(S.of(context).create, style: TextStyle(fontSize: 12)),
            ],
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Column(
            children: [
              Icon(Icons.account_balance_wallet),
              Text(S.of(context).wallet, style: TextStyle(fontSize: 12)),
            ],
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Column(
            children: [
              Icon(Icons.settings),
              Text(S.of(context).settings, style: TextStyle(fontSize: 12)),
            ],
          ),
          label: '',
        ),
      ],
      currentIndex: currentIndex,
      selectedItemColor: purpleColor,
      unselectedItemColor: Colors.black54,
      onTap: onTap,
    );
  }
}
