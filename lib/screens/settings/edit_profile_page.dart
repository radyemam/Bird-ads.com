import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../providers/user_provider.dart';
import 'change_password_page.dart';
import 'package:untitled5/generated/l10n.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  String? _phoneErrorMessage;

  @override
  void initState() {
    super.initState();
    _loadUserProfile();
  }

  void _loadUserProfile() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final userId = user.uid;
      final userDoc = await FirebaseFirestore.instance.collection('clients').doc(userId).get();
      if (userDoc.exists) {
        final userData = userDoc.data();
        setState(() {
          firstNameController.text = userData?['firstName'] ?? '';
          lastNameController.text = userData?['lastName'] ?? '';
          emailController.text = userData?['email'] ?? '';
          phoneController.text = userData?['phone'] ?? '';
        });
      }
    }
  }

  Future<bool> _isPhoneRegistered(String phone, String userId) async {
    final QuerySnapshot result = await FirebaseFirestore.instance
        .collection('clients')
        .where('phone', isEqualTo: phone)
        .get();
    final List<DocumentSnapshot> documents = result.docs;
    return documents.isNotEmpty && documents.first.id != userId;
  }

  void _saveChanges() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('User not logged in')),
      );
      return;
    }
    final String userId = user.uid;
    final String phone = phoneController.text;

    if (await _isPhoneRegistered(phone, userId)) {
      setState(() {
        _phoneErrorMessage = S.of(context).phone_already_registered;
      });
      return;
    }

    await FirebaseFirestore.instance.collection('clients').doc(userId).update({
      'firstName': firstNameController.text,
      'lastName': lastNameController.text,
      'phone': phoneController.text,
    });

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(S.of(context).snack_bar_message)));

    Navigator.pop(context, '${firstNameController.text} ${lastNameController.text}');
  }

  @override
  Widget build(BuildContext context) {
    final Color purpleColor = Color(0xFF800080);

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).edit_profile, style: TextStyle(color: Colors.white)),
        backgroundColor: purpleColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(S.of(context).first_name, style: TextStyle(color: purpleColor)),
            TextField(
              controller: firstNameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            Text(S.of(context).last_name, style: TextStyle(color: purpleColor)),
            TextField(
              controller: lastNameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            Text(S.of(context).email, style: TextStyle(color: purpleColor)),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.grey.shade200,
              ),
              style: TextStyle(color: purpleColor),
              enabled: false,
            ),
            SizedBox(height: 16),
            Text(S.of(context).phone, style: TextStyle(color: purpleColor)),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                errorText: _phoneErrorMessage,
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(S.of(context).password, style: TextStyle(color: purpleColor)),
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          enabled: false,
                        ),
                        obscureText: true,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChangePasswordPage()),
                    );
                  },
                  child: Text(S.of(context).update, style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: purpleColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _saveChanges,
              child: Center(
                child: Text(S.of(context).save_changes, style: TextStyle(color: Colors.white)),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: purpleColor,
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
