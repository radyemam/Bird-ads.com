// lib/screens/target_audience/target_audience_page.dart

import 'package:flutter/material.dart';
import '../../widgets/bottom_nav_bar.dart'; // Assuming you have a bottom navigation bar like in settings
import '../../providers/user_provider.dart'; // Assuming the same provider setup
import 'package:provider/provider.dart'; // Ensure this is added

class TargetAudiencePage extends StatefulWidget {
  @override
  _TargetAudiencePageState createState() => _TargetAudiencePageState();
}

class _TargetAudiencePageState extends State<TargetAudiencePage> {
  final Color purpleColor = Color(0xFF800080); // استخدام نفس لون الموف من صفحة الإعدادات

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'الفئات المستهدفة',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: purpleColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      child: Icon(Icons.group, size: 40, color: Colors.white),
                      backgroundColor: purpleColor,
                    ),
                    SizedBox(height: 8),
                    Text(
                      'الفئات المستهدفة',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue.shade900),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'اكتشف الفئات المستهدفة لمنتجاتك وإعلاناتك هنا',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              _buildTargetAudienceOption(
                context,
                icon: Icons.person,
                title: 'فئة الشباب',
                description: 'الفئة العمرية من 18 إلى 35 سنة.',
                onTap: () {
                  // Navigate to detailed page or perform action
                },
              ),
              _buildTargetAudienceOption(
                context,
                icon: Icons.family_restroom,
                title: 'العائلات',
                description: 'الأزواج والأسر الصغيرة.',
                onTap: () {
                  // Navigate to detailed page or perform action
                },
              ),
              _buildTargetAudienceOption(
                context,
                icon: Icons.work,
                title: 'المحترفين',
                description: 'الأشخاص العاملين في مجالات مختلفة.',
                onTap: () {
                  // Navigate to detailed page or perform action
                },
              ),
              // Add more target audience options as needed
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 1, // Assuming this is the second tab like in the settings
        onTap: (index) {
          // Handle navigation
        },
      ),
    );
  }

  Widget _buildTargetAudienceOption(BuildContext context,
      {required IconData icon, required String title, required String description, required VoidCallback onTap}) {
    return Card(
      child: ListTile(
        leading: Icon(icon, color: purpleColor),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(description),
        trailing: Icon(Icons.arrow_forward, color: purpleColor),
        onTap: onTap,
      ),
    );
  }
}
