import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled5/generated/l10n.dart';
import 'reset_password_page.dart';

class VerifyCodePage extends StatefulWidget {
  final String email;
  final String verificationCode;

  VerifyCodePage({required this.email, required this.verificationCode});

  @override
  _VerifyCodePageState createState() => _VerifyCodePageState();
}

class _VerifyCodePageState extends State<VerifyCodePage> {
  final _codeController = TextEditingController();
  String? _errorMessage;
  final Color purpleColor = Color(0xFF800080);

  void _verifyCode() async {
    final code = _codeController.text;

    if (code.isEmpty || code.length != 6) {
      setState(() {
        _errorMessage = S.of(context).error_empty_code;
      });
      return;
    }

    try {
      if (code == widget.verificationCode) {
        setState(() {
          _errorMessage = null;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(S.of(context).code_verified)),
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResetPasswordPage(email: widget.email),
          ),
        );
      } else {
        setState(() {
          _errorMessage = S.of(context).invalid_code;
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = S.of(context).unexpected_error;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).verify_code, style: TextStyle(color: Colors.white)),
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
                  S.of(context).enter_six_digit_code(widget.email),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: purpleColor),
                ),
              ),
              SizedBox(height: 24),
              Card(
                child: ListTile(
                  leading: Icon(Icons.lock, color: purpleColor),
                  title: TextField(
                    controller: _codeController,
                    decoration: InputDecoration(
                      labelText: S.of(context).code,
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ),
              SizedBox(height: 16),
              if (_errorMessage != null)
                Text(
                  _errorMessage!,
                  style: TextStyle(color: Colors.red),
                ),
              SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: purpleColor,
                  foregroundColor: Colors.white,
                ),
                onPressed: _verifyCode,
                child: Text(S.of(context).verify),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
