// lib/screens/settings/change_password_page.dart

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // إضافة استيراد مكتبة cloud_firestore
import '../../providers/user_provider.dart';
import 'package:untitled5/generated/l10n.dart'; // إضافة استيراد مكتبة الترجمة

class ChangePasswordPage extends StatefulWidget {
  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final TextEditingController currentPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  bool _obscureTextCurrent = true;
  bool _obscureTextNew = true;
  bool _obscureTextConfirm = true;

  void _toggleCurrentPasswordVisibility() {
    setState(() {
      _obscureTextCurrent = !_obscureTextCurrent;
    });
  }

  void _toggleNewPasswordVisibility() {
    setState(() {
      _obscureTextNew = !_obscureTextNew;
    });
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() {
      _obscureTextConfirm = !_obscureTextConfirm;
    });
  }

  Future<void> _changePassword() async {
    final currentPassword = currentPasswordController.text;
    final newPassword = newPasswordController.text;
    final confirmPassword = confirmPasswordController.text;

    if (currentPassword.isEmpty || newPassword.isEmpty || confirmPassword.isEmpty) {
      _showMessage(S.of(context).error_empty_fields);
      return;
    }

    if (newPassword.length < 6) {
      _showMessage(S.of(context).error_short_password);
      return;
    }

    if (newPassword != confirmPassword) {
      _showMessage(S.of(context).error_password_mismatch);
      return;
    }

    try {
      final user = FirebaseAuth.instance.currentUser!;
      final credential = EmailAuthProvider.credential(email: user.email!, password: currentPassword);

      await user.reauthenticateWithCredential(credential);
      await user.updatePassword(newPassword);

      final userProvider = Provider.of<UserProvider>(context, listen: false);
      await FirebaseFirestore.instance.collection('clients').doc(userProvider.userId).update({
        'password': newPassword, // يجب أن يتم تشفير كلمة المرور هنا في تطبيق حقيقي
      });

      Navigator.pop(context);
      _showMessage(S.of(context).success_update_password);
    } on FirebaseAuthException catch (e) {
      _showMessage(S.of(context).error_update_password(e.message ?? 'Unknown error'));
    }
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    final Color purpleColor = Color(0xFF800080); // استخدام نفس لون الموف من صفحة الإعدادات

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).change_password, style: TextStyle(color: Colors.white)),
        backgroundColor: purpleColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: currentPasswordController,
              decoration: InputDecoration(
                labelText: S.of(context).current_password,
                prefixIcon: Icon(Icons.lock, color: purpleColor),
                suffixIcon: IconButton(
                  icon: Icon(_obscureTextCurrent ? Icons.visibility_off : Icons.visibility, color: purpleColor),
                  onPressed: _toggleCurrentPasswordVisibility,
                ),
                border: OutlineInputBorder(),
              ),
              obscureText: _obscureTextCurrent,
            ),
            SizedBox(height: 16),
            TextField(
              controller: newPasswordController,
              decoration: InputDecoration(
                labelText: S.of(context).new_password,
                prefixIcon: Icon(Icons.lock, color: purpleColor),
                suffixIcon: IconButton(
                  icon: Icon(_obscureTextNew ? Icons.visibility_off : Icons.visibility, color: purpleColor),
                  onPressed: _toggleNewPasswordVisibility,
                ),
                border: OutlineInputBorder(),
              ),
              obscureText: _obscureTextNew,
            ),
            SizedBox(height: 16),
            TextField(
              controller: confirmPasswordController,
              decoration: InputDecoration(
                labelText: S.of(context).confirm_new_password,
                prefixIcon: Icon(Icons.lock, color: purpleColor),
                suffixIcon: IconButton(
                  icon: Icon(_obscureTextConfirm ? Icons.visibility_off : Icons.visibility, color: purpleColor),
                  onPressed: _toggleConfirmPasswordVisibility,
                ),
                border: OutlineInputBorder(),
              ),
              obscureText: _obscureTextConfirm,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _changePassword,
              child: Text(S.of(context).save_password, style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: purpleColor,
                minimumSize: Size(double.infinity, 50), // جعل الزر بعرض كامل
              ),
            ),
          ],
        ),
      ),
    );
  }
}
