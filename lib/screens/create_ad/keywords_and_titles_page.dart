import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled5/generated/l10n.dart';

class KeywordsAndTitlesPage extends StatefulWidget {
  @override
  _KeywordsAndTitlesPageState createState() => _KeywordsAndTitlesPageState();
}

class _KeywordsAndTitlesPageState extends State<KeywordsAndTitlesPage> {
  List<String> _keywords = [];
  TextEditingController _keywordsController = TextEditingController();
  final Color purpleColor = Color(0xFF800080);

  @override
  void initState() {
    super.initState();
    _loadKeywords();
  }

  Future<void> _loadKeywords() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _keywords = prefs.getStringList('keywords') ?? [];
    });
  }

  Future<void> _saveKeywords() async {
    if (_keywordsController.text.isEmpty) return;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _keywords.add(_keywordsController.text);
      prefs.setStringList('keywords', _keywords);
      _keywordsController.clear();
    });

    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      String userId = user.uid;
      DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('clients').doc(userId).get();
      if (userDoc.exists) {
        var userData = userDoc.data() as Map<String, dynamic>;
        if (userData.containsKey('currentAdId')) {
          String adId = userData['currentAdId'];
          await FirebaseFirestore.instance.collection('created ads').doc(adId).update({'keywords google': _keywords}).catchError((error) {
            print('Error updating Firestore: $error');
          });
        } else {
          print('Error: currentAdId not found in user document');
        }
      }
    } else {
      print('Error: user is null');
    }
  }

  Future<void> _deleteKeyword(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _keywords.removeAt(index);
      prefs.setStringList('keywords', _keywords);
    });

    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      String userId = user.uid;
      DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('clients').doc(userId).get();
      if (userDoc.exists) {
        var userData = userDoc.data() as Map<String, dynamic>;
        if (userData.containsKey('currentAdId')) {
          String adId = userData['currentAdId'];
          await FirebaseFirestore.instance.collection('created ads').doc(adId).update({'keywords google': _keywords}).catchError((error) {
            print('Error updating Firestore: $error');
          });
        } else {
          print('Error: currentAdId not found in user document');
        }
      }
    } else {
      print('Error: user is null');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).keywords_and_titles, style: TextStyle(color: Colors.white)),
        backgroundColor: purpleColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                S.of(context).enter_keywords_and_titles,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue.shade900),
              ),
              SizedBox(height: 8),
              TextField(
                controller: _keywordsController,
                maxLines: 1,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: S.of(context).hint_keywords_and_titles,
                ),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: _saveKeywords,
                    child: Text(S.of(context).save, style: TextStyle(fontSize: 20, color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: purpleColor,
                      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => _keywordsController.clear(),
                    child: Text(S.of(context).cancel, style: TextStyle(fontSize: 20, color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              if (_keywords.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _keywords
                      .asMap()
                      .entries
                      .map((entry) => ListTile(
                    title: Text(entry.value),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _deleteKeyword(entry.key),
                    ),
                  ))
                      .toList(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
