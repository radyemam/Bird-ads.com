// lib/screens/register_screen.dart

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';
import 'home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled5/generated/l10n.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _obscureText = true;
  final Color purpleColor = Color(0xFF800080);
  String? _phoneErrorMessage;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Future<bool> _isPhoneRegistered(String phone) async {
    final QuerySnapshot result = await FirebaseFirestore.instance
        .collection('clients')
        .where('phone', isEqualTo: phone)
        .get();
    return result.docs.isNotEmpty;
  }

  void _register() async {
    final firstName = _firstNameController.text;
    final lastName = _lastNameController.text;
    final phone = _phoneController.text;
    final email = _emailController.text;
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    if (firstName.isEmpty || lastName.isEmpty || phone.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      _showMessage(S.of(context).please_enter_all_fields);
      return;
    }

    if (!RegExp(r'^\+?[0-9]+$').hasMatch(phone)) {
      _showMessage(S.of(context).please_enter_valid_phone);
      return;
    }

    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
      _showMessage(S.of(context).please_enter_valid_email);
      return;
    }

    if (password.length < 6) {
      _showMessage(S.of(context).password_too_short);
      return;
    }

    if (password != confirmPassword) {
      _showMessage(S.of(context).passwords_do_not_match);
      return;
    }

    if (await _isPhoneRegistered(phone)) {
      setState(() {
        _phoneErrorMessage = S.of(context).phone_already_registered;
      });
      return;
    }

    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      Provider.of<UserProvider>(context, listen: false).setUser(
        firstName,
        lastName,
        email,
        userCredential.user?.uid ?? '',
        phone,
      );

      // Add user to Firestore with timestamps
      final currentTime = DateTime.now();
      await FirebaseFirestore.instance.collection('clients').doc(userCredential.user?.uid).set({
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'uid': userCredential.user?.uid,
        'phone': phone,
        'password': password,
        'created time': currentTime,
        'last seen': currentTime,
      });

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        _showMessage(S.of(context).weak_password);
      } else if (e.code == 'email-already-in-use') {
        _showMessage(S.of(context).email_already_in_use);
      } else {
        _showMessage('${S.of(context).error_registering}: ${e.message}');
      }
    } catch (e) {
      _showMessage('${S.of(context).error_registering}: $e');
    }
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).create_new_account, style: TextStyle(color: Colors.white)),
        backgroundColor: purpleColor,
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
                  S.of(context).create_new_account,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: purpleColor),
                ),
              ),
              SizedBox(height: 16),
              _buildTextField(_firstNameController, S.of(context).first_name, Icons.person),
              SizedBox(height: 16),
              _buildTextField(_lastNameController, S.of(context).last_name, Icons.person),
              SizedBox(height: 16),
              _buildTextField(_phoneController, S.of(context).phone_number, Icons.phone, keyboardType: TextInputType.phone, errorMessage: _phoneErrorMessage),
              SizedBox(height: 16),
              _buildTextField(_emailController, S.of(context).email, Icons.email, keyboardType: TextInputType.emailAddress),
              SizedBox(height: 16),
              _buildPasswordTextField(_passwordController, S.of(context).password),
              SizedBox(height: 16),
              _buildPasswordTextField(_confirmPasswordController, S.of(context).confirm_password),
              SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: purpleColor,
                  foregroundColor: Colors.white,
                ),
                onPressed: _register,
                child: Text(
                  S.of(context).register,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String labelText, IconData icon, {TextInputType keyboardType = TextInputType.text, String? errorMessage}) {
    return Card(
      child: ListTile(
        leading: Icon(icon, color: purpleColor),
        title: TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: labelText,
            border: OutlineInputBorder(),
            errorText: errorMessage,
          ),
          keyboardType: keyboardType,
        ),
      ),
    );
  }

  Widget _buildPasswordTextField(TextEditingController controller, String labelText) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.lock, color: purpleColor),
        title: TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: labelText,
            border: OutlineInputBorder(),
          ),
          obscureText: _obscureText,
        ),
        trailing: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
          ),
          onPressed: _togglePasswordVisibility,
        ),
      ),
    );
  }
}
