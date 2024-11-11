import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider with ChangeNotifier {
  String _firstName = '';
  String _lastName = '';
  String _email = '';
  String _phone = '';
  String _userId = '';
  String _uid = '';

  String get firstName => _firstName;
  String get lastName => _lastName;
  String get email => _email;
  String get phone => _phone;
  String get userId => _userId;
  String get uid => _uid;

  void setUser(String firstName, String lastName, String email, String userId, String phone) {
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _userId = userId;
    _phone = phone;
    notifyListeners();
  }

  void setUserId(String userId) {
    _userId = userId;
    notifyListeners();
  }

  Future<void> fetchUserDetails(String userId) async {
    if (userId.isEmpty) {
      throw Exception('User ID is empty');
    }

    print('Fetching user details for userId: $userId');
    DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('clients').doc(userId).get();
    if (userDoc.exists) {
      Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;
      setUser(
        userData['firstName'] ?? '',
        userData['lastName'] ?? '',
        userData['email'] ?? '',
        userId,
        userData['phone'] ?? '',
      );
      _uid = userData['uid'] ?? '';
      await _saveUserDetailsToPreferences();
      notifyListeners();
      print('User details fetched and set successfully');
    } else {
      print('User document does not exist');
    }
  }

  Future<void> updateUserDetails() async {
    if (_userId.isEmpty) {
      throw Exception('User ID is empty');
    }

    try {
      await FirebaseFirestore.instance.collection('clients').doc(_userId).update({
        'firstName': _firstName,
        'lastName': _lastName,
        'email': _email,
        'phone': _phone,
      });
      await _saveUserDetailsToPreferences();
    } catch (e) {
      print('Error updating user details: $e');
      throw e;
    }
  }

  Future<void> _saveUserDetailsToPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('firstName', _firstName);
    await prefs.setString('lastName', _lastName);
    await prefs.setString('email', _email);
    await prefs.setString('userId', _userId);
    await prefs.setString('phone', _phone);
    await prefs.setString('uid', _uid);
  }

  Future<void> loadUserDetailsFromPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _firstName = prefs.getString('firstName') ?? '';
    _lastName = prefs.getString('lastName') ?? '';
    _email = prefs.getString('email') ?? '';
    _userId = prefs.getString('userId') ?? '';
    _phone = prefs.getString('phone') ?? '';
    _uid = prefs.getString('uid') ?? '';
    notifyListeners();
  }
}
