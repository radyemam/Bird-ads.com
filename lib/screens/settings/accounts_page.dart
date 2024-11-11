// lib/screens/settings/accounts_page.dart

import 'package:flutter/material.dart';
import 'package:untitled5/generated/l10n.dart';

class AccountsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Color purpleColor = Color(0xFF800080);

    void _showComingSoonMessage(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(S.of(context).soon),
            content: Text(S.of(context).feature_coming_soon),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(S.of(context).ok),
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).my_accounts, style: TextStyle(color: Colors.white)),
        backgroundColor: purpleColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).link_accounts,
              style: TextStyle(fontSize: 16, color: Colors.blue.shade900),
            ),
            SizedBox(height: 16),
            AccountCard(
              platform: S.of(context).facebook,
              icon: Icons.facebook,
              isConnected: false,
              onPressed: () {
                _showComingSoonMessage(context);
              },
            ),
            SizedBox(height: 16),
            AccountCard(
              platform: S.of(context).instagram,
              icon: Icons.camera_alt,
              isConnected: false,
              onPressed: () {
                _showComingSoonMessage(context);
              },
            ),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(16),
              color: Colors.yellow[100],
              child: Row(
                children: [
                  Icon(Icons.info, color: Colors.orange),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      S.of(context).cannot_link_instagram,
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: Text(
                S.of(context).soon,
                style: TextStyle(fontSize: 18, color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AccountCard extends StatelessWidget {
  final String platform;
  final IconData icon;
  final bool isConnected;
  final VoidCallback onPressed;

  AccountCard({
    required this.platform,
    required this.icon,
    required this.isConnected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final Color purpleColor = Color(0xFF800080);

    return Card(
      child: ListTile(
        leading: Icon(icon, size: 40, color: isConnected ? Colors.green : purpleColor),
        title: Text(platform, style: TextStyle(fontSize: 18)),
        subtitle: Text(isConnected ? S.of(context).connected : S.of(context).not_connected),
        trailing: ElevatedButton(
          onPressed: onPressed,
          child: Text(isConnected ? S.of(context).unlink : S.of(context).link_account),
          style: ElevatedButton.styleFrom(
            backgroundColor: purpleColor,
            foregroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}