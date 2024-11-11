import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'verify_code_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:untitled5/generated/l10n.dart';
import '../widgets/loading_screen.dart'; // إضافة هذا السطر

class ForgotPasswordPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final Color purpleColor = Color(0xFF800080);

  void _resetPassword(BuildContext context) async {
    showLoadingScreen(context);
    final email = _emailController.text;

    if (email.isEmpty || !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(S.of(context).invalid_email)),
      );
      hideLoadingScreen(context);
      return;
    }

    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('clients')
          .where('email', isEqualTo: email)
          .get();

      if (querySnapshot.docs.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(S.of(context).email_not_registered)),
        );
        hideLoadingScreen(context);
        return;
      }

      HttpsCallable callable = FirebaseFunctions.instance.httpsCallable('sendVerificationCode');
      final results = await callable.call(<String, dynamic>{'email': email});

      print('Firebase Function response: ${results.data}');

      if (results.data != null && results.data['success'] != null && results.data['success']) {
        final code = results.data['code'];
        hideLoadingScreen(context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VerifyCodePage(email: email, verificationCode: code),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(S.of(context).verification_code_error)),
        );
        hideLoadingScreen(context);
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(S.of(context).reset_password_error(e.message.toString()))),
      );
      hideLoadingScreen(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(S.of(context).unexpected_error)),
      );
      hideLoadingScreen(context);
    }
  }

  void showLoadingScreen(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return LoadingScreen();
      },
    );
  }

  void hideLoadingScreen(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).reset_password_title, style: TextStyle(color: Colors.white)),
        backgroundColor: purpleColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(
                child: Text(
                  S.of(context).reset_password_title,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: purpleColor),
                ),
              ),
              SizedBox(height: 8),
              Center(
                child: Text(
                  S.of(context).reset_password_instruction,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 24),
              _buildEmailTextField(context),
              SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: purpleColor,
                  foregroundColor: Colors.white,
                ),
                onPressed: () => _resetPassword(context),
                child: Text(S.of(context).reset_password_button),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmailTextField(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.email, color: purpleColor),
        title: TextField(
          controller: _emailController,
          decoration: InputDecoration(
            labelText: S.of(context).email_label,
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.emailAddress,
        ),
      ),
    );
  }
}
