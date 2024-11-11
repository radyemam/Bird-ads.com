// في مجلد screens اعمل ملف جديد اسمه facebook_login_screen.dart

import 'package:flutter/material.dart';

class FacebookLoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Facebook Login'),
      ),
      body: Center(
        child: Text('Facebook Login Screen'),
      ),
    );
  }
}
