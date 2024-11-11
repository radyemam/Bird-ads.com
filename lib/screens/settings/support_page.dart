//lib/screens/settings/support_page.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // استيراد Clipboard
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../providers/user_provider.dart';
import '../../widgets/bottom_nav_bar.dart';
import '../home_page.dart';
import '../advertisements/advertisements_page.dart';
import '../create_ad/create_ad_page.dart';
import '../wallet/wallet_screen.dart';
import 'settings_page.dart';
import 'package:untitled5/generated/l10n.dart';

class SupportPage extends StatefulWidget {
  @override
  _SupportPageState createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  int _selectedIndex = 4;
  final Color purpleColor = Color(0xFF800080);

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final bool fromLogin = ModalRoute.of(context)?.settings.arguments == 'fromLogin';

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).support, style: TextStyle(color: Colors.white)),
        backgroundColor: purpleColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection('support')
              .doc('7rFk8oFUoxqFi8MOPgj1')
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }

            var supportData = snapshot.data!.data() as Map<String, dynamic>;
            var supportPhoneNumber = supportData.containsKey('calls num') ? supportData['calls num'].toString().trim() : '';
            var whatsappNumber = supportData.containsKey('whats num') ? supportData['whats num'].toString().trim() : '';
            var emailSupport = supportData.containsKey('email supp') ? supportData['email supp'].toString().trim() : '';
            var messengerLink = supportData.containsKey('messenger') ? supportData['messenger'].toString().trim() : '';

            return ListView(
              children: [
                _buildSupportOption(
                  context,
                  icon: Icons.phone,
                  text: S.of(context).contact_phone,
                  url: 'tel:$supportPhoneNumber',
                  purpleColor: purpleColor,
                ),
                _buildSupportOption(
                  context,
                  icon: Icons.message,
                  text: S.of(context).contact_whatsapp,
                  url: whatsappNumber,
                  purpleColor: purpleColor,
                ),
                _buildSupportOption(
                  context,
                  icon: Icons.message,
                  text: S.of(context).contact_messenger,
                  url: messengerLink,
                  purpleColor: purpleColor,
                ),
                _buildSupportOption(
                  context,
                  icon: Icons.email,
                  text: S.of(context).contact_email,
                  email: emailSupport,
                  purpleColor: purpleColor,
                ),
                _buildOption(
                  context,
                  icon: Icons.support_agent,
                  text: S.of(context).complaints_and_suggestions,
                  purpleColor: purpleColor,
                  onTap: () {
                    _showComplaintDialog(context, userProvider, purpleColor);
                  },
                ),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: fromLogin ? null : BottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildSupportOption(BuildContext context, {required IconData icon, required String text, String? url, String? email, required Color purpleColor}) {
    return _buildOption(
      context,
      icon: icon,
      text: text,
      purpleColor: purpleColor,
      onTap: () {
        if (url != null) {
          _launchURL(url);
        } else if (email != null) {
          _showCopyDialog(context, email);
        }
      },
      hideDetails: false,
    );
  }

  Widget _buildOption(BuildContext context, {required IconData icon, required String text, required Color purpleColor, required VoidCallback onTap, bool hideDetails = false}) {
    return Card(
      child: ListTile(
        leading: Icon(icon, color: purpleColor),
        title: Text(
          text,
          style: TextStyle(color: Colors.black),
        ),
        trailing: Icon(Icons.arrow_forward, color: purpleColor),
        onTap: onTap,
      ),
    );
  }

  void _launchURL(String url) async {
    url = url.trim();
    final Uri uri = Uri.parse(url);
    if (url.isNotEmpty && (await canLaunch(uri.toString()))) {
      await launch(uri.toString());
    } else {
      _showErrorDialog('Could not launch $url');
      throw 'Could not launch $url';
    }
  }

  void _showCopyDialog(BuildContext context, String email) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            S.of(context).official_email,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          content: Row(
            children: [
              Expanded(
                child: Text(
                  email,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              IconButton(
                icon: Icon(Icons.copy, color: purpleColor),
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: email));
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(S.of(context).email_copied + email),
                  ));
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showComplaintDialog(BuildContext context, UserProvider userProvider, Color purpleColor) {
    final TextEditingController complaintController = TextEditingController();
    final TextEditingController phoneNumberController = TextEditingController(text: userProvider.phone);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(S.of(context).complaints_and_suggestions),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(S.of(context).leave_phone_for_contact),
              SizedBox(height: 8.0),
              TextField(
                controller: phoneNumberController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: S.of(context).phone_number,
                ),
              ),
              SizedBox(height: 8.0),
              TextField(
                controller: complaintController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: S.of(context).enter_complaint_here,
                ),
                maxLines: 3,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(S.of(context).cancel, style: TextStyle(color: purpleColor)),
            ),
            ElevatedButton(
              onPressed: () {
                _sendComplaintToFirestore(
                  userProvider.firstName,
                  userProvider.lastName,
                  userProvider.email,
                  phoneNumberController.text,
                  complaintController.text,
                );
                Navigator.of(context).pop();
                _showConfirmationDialog(context, purpleColor);
              },
              child: Text(S.of(context).send, style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: purpleColor,
              ),
            ),
          ],
        );
      },
    );
  }

  void _sendComplaintToFirestore(String firstName, String lastName, String email, String phoneNumber, String complaint) async {
    await FirebaseFirestore.instance.collection('complaints').add({
      'timestamp': FieldValue.serverTimestamp(),
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phone': phoneNumber,
      'complaint': complaint,
    });
  }

  void _showConfirmationDialog(BuildContext context, Color purpleColor) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(S.of(context).complaint_sent),
          content: Text(S.of(context).thank_you_complaint_sent),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(S.of(context).continue_action, style: TextStyle(color: purpleColor)),
            ),
          ],
        );
      },
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
          break;
        case 1:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => AdvertisementsPage()),
          );
          break;
        case 2:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => CreateAdPage()),
          );
          break;
        case 3:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => WalletScreen()),
          );
          break;
        default:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => SettingsPage()),
          );
      }
    });
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: MaterialApp(
        home: SupportPage(),
      ),
    );
  }
}
