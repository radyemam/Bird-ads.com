import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled5/generated/l10n.dart'; // تأكد من تحديث المسار الصحيح

class ResetPasswordPage extends StatefulWidget {
  final String email;
  ResetPasswordPage({required this.email});

  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final Color purpleColor = Color(0xFF800080);
  String? _errorMessage;
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _resetPassword() async {
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    if (password.isEmpty || confirmPassword.isEmpty) {
      setState(() {
        _errorMessage = S.of(context).error_empty_fields;
      });
      return;
    }

    if (password != confirmPassword) {
      setState(() {
        _errorMessage = S.of(context).error_passwords_not_matching;
      });
      return;
    }

    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('clients')
          .where('email', isEqualTo: widget.email)
          .get();

      if (querySnapshot.docs.isEmpty) {
        setState(() {
          _errorMessage = S.of(context).error_email_not_registered;
        });
        return;
      }

      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: widget.email,
        password: querySnapshot.docs.first['password'],
      );

      User? user = userCredential.user;
      if (user != null) {
        await user.updatePassword(password);

        await FirebaseFirestore.instance.collection('clients').doc(querySnapshot.docs.first.id).update({
          'password': password,
        });

        await FirebaseAuth.instance.signOut();
        userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: widget.email,
          password: password,
        );

        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('email', widget.email);
        await prefs.setString('password', password);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(S.of(context).success_password_reset)),
        );
        Navigator.pushReplacementNamed(context, '/login');
      } else {
        setState(() {
          _errorMessage = S.of(context).error_updating_password;
        });
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        _errorMessage = '${S.of(context).error_occurred}: ${e.message}';
      });
    } catch (e) {
      setState(() {
        _errorMessage = S.of(context).error_unexpected;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).reset_password, style: TextStyle(color: Colors.white)),
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
                  S.of(context).enter_new_password,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: purpleColor),
                ),
              ),
              SizedBox(height: 8),
              Center(
                child: Text(
                  S.of(context).enter_new_password_instructions,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 24),
              _buildPasswordTextField(),
              SizedBox(height: 16),
              _buildConfirmPasswordTextField(),
              SizedBox(height: 16),
              if (_errorMessage != null)
                Text(
                  _errorMessage!,
                  style: TextStyle(color: Colors.red),
                ),
              SizedBox(height: 16),
              ElevatedButton(
                key: Key('resetButton'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: purpleColor,
                  foregroundColor: Colors.white,
                ),
                onPressed: _resetPassword,
                child: Text(S.of(context).reset_password),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordTextField() {
    return Card(
      child: ListTile(
        leading: Icon(Icons.lock, color: purpleColor),
        title: TextField(
          key: Key('passwordField'),
          controller: _passwordController,
          decoration: InputDecoration(
            labelText: S.of(context).password,
            border: OutlineInputBorder(),
            suffixIcon: IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility_off : Icons.visibility,
                color: purpleColor,
              ),
              onPressed: _togglePasswordVisibility,
            ),
          ),
          obscureText: _obscureText,
        ),
      ),
    );
  }

  Widget _buildConfirmPasswordTextField() {
    return Card(
      child: ListTile(
        leading: Icon(Icons.lock_outline, color: purpleColor),
        title: TextField(
          key: Key('confirmPasswordField'),
          controller: _confirmPasswordController,
          decoration: InputDecoration(
            labelText: S.of(context).confirm_password,
            border: OutlineInputBorder(),
            suffixIcon: IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility_off : Icons.visibility,
                color: purpleColor,
              ),
              onPressed: _togglePasswordVisibility,
            ),
          ),
          obscureText: _obscureText,
        ),
      ),
    );
  }
}
