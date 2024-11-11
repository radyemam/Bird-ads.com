import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled5/generated/l10n.dart';

class PermissionsPage extends StatefulWidget {
  final ValueChanged<String> onPermissionSelected;

  PermissionsPage({required this.onPermissionSelected});

  @override
  _PermissionsPageState createState() => _PermissionsPageState();
}

class _PermissionsPageState extends State<PermissionsPage> {
  String _selectedOption = '';
  String _accountLink = '';
  String _accountName = '';

  @override
  void initState() {
    super.initState();
    _loadState();
    _fetchFirestoreData();
  }

  void _loadState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _selectedOption = prefs.getString('selectedOption') ?? '';
    });
  }

  void _saveState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedOption', _selectedOption);
    widget.onPermissionSelected(_selectedOption);
  }

  Future<void> _fetchFirestoreData() async {
    final documentId = 'LDYHr2kvHLOl7slzEfIl';
    final doc = await FirebaseFirestore.instance.collection('fb').doc(documentId).get();
    if (doc.exists) {
      setState(() {
        _accountLink = doc['link fb'] ?? '';
        _accountName = doc['name fb'] ?? '';
      });
    }
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
    final copiedText = S.of(context).copied_text(text);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(copiedText)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Color purpleColor = Color(0xFF800080);

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).permissions_page_title, style: TextStyle(color: Colors.white)),
        backgroundColor: purpleColor,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  S.of(context).assign_account_admin,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: purpleColor),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Divider(),
                Text(
                  S.of(context).how_to_assign_admin,
                  style: TextStyle(fontSize: 18, color: purpleColor),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.copy),
                      onPressed: () {
                        _copyToClipboard('https://www.youtube.com/watch?v=TI0GjXVv3lo');
                      },
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          _launchURL('https://www.youtube.com/watch?v=TI0GjXVv3lo');
                        },
                        child: Text(
                          'https://www.youtube.com/watch?v=TI0GjXVv3lo',
                          style: TextStyle(fontSize: 18, color: Colors.blue),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(),
                Text(
                  S.of(context).account_link,
                  style: TextStyle(fontSize: 18, color: purpleColor),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.copy),
                      onPressed: () {
                        _copyToClipboard(_accountLink);
                      },
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          _launchURL(_accountLink);
                        },
                        child: Text(
                          _accountLink,
                          style: TextStyle(fontSize: 18, color: Colors.blue),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(),
                Text(
                  S.of(context).account_name,
                  style: TextStyle(fontSize: 18, color: purpleColor),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.copy),
                      onPressed: () {
                        _copyToClipboard(_accountName);
                      },
                    ),
                    Expanded(
                      child: Text(
                        _accountName,
                        style: TextStyle(fontSize: 18),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                Text(
                  S.of(context).account_logo,
                  style: TextStyle(fontSize: 18, color: purpleColor),
                ),
                Divider(),
                RadioListTile<String>(
                  title: Text(S.of(context).option_admin_or_editor, style: TextStyle(fontSize: 18, color: purpleColor)),
                  value: S.of(context).option_admin_or_editor,
                  groupValue: _selectedOption,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedOption = value ?? '';
                    });
                    _saveState();
                  },
                ),
                Divider(),
                RadioListTile<String>(
                  title: Text(S.of(context).option_sent_friend_request, style: TextStyle(fontSize: 18, color: purpleColor)),
                  value: S.of(context).option_sent_friend_request,
                  groupValue: _selectedOption,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedOption = value ?? '';
                    });
                    _saveState();
                  },
                ),
                SizedBox(height: 80), // Add extra spacing
                Center(
                  child: Text(
                    S.of(context).note_how_to_assign_admin,
                    style: TextStyle(fontSize: 18, color: purpleColor),
                  ),
                ),
                SizedBox(height: 16),
                Center(
                  child: Text(
                    S.of(context).cannot_create_ad,
                    style: TextStyle(fontSize: 20, color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 16), // Add extra spacing
              ],
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: ElevatedButton(
              onPressed: () {
                if (_selectedOption.isNotEmpty) {
                  _saveState();
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(S.of(context).confirm_admin_or_friend_request)),
                  );
                }
              },
              child: Text(S.of(context).save, style: TextStyle(fontSize: 20, color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: purpleColor,
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
