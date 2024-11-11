import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled5/generated/l10n.dart'; // استدعاء حزمة الترجمة
import 'interests_page.dart';
import 'behavior_page.dart' as behavior_page;
import 'demographic_status_page.dart' as demographic_status_page;

class MainTargetPage extends StatefulWidget {
  @override
  _MainTargetPageState createState() => _MainTargetPageState();
}

class _MainTargetPageState extends State<MainTargetPage> {
  List<String> _selectedInterests = [];
  List<String> _selectedDemographics = [];
  List<String> _selectedBehaviors = [];
  String? _selectedPlatform;
  final Color purpleColor = Color(0xFF800080);

  @override
  void initState() {
    super.initState();
    _loadSelectedPlatform();
    _loadSelectedInterests();
    _loadSelectedDemographics();
    _loadSelectedBehaviors();
  }

  Future<void> _loadSelectedPlatform() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _selectedPlatform = prefs.getString('selectedPlatform') ?? 'undefined';
    });
  }

  Future<void> _loadSelectedInterests() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _selectedInterests = prefs.getStringList('selectedInterests') ?? [];
    });
  }

  Future<void> _loadSelectedDemographics() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _selectedDemographics = prefs.getStringList('selectedStatuses') ?? [];
    });
  }

  Future<void> _loadSelectedBehaviors() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _selectedBehaviors = prefs.getStringList('selectedBehaviors') ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).ad_targeting, style: TextStyle(color: Colors.white)),
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
                      S.of(context).ad_targets,
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue.shade900),
                    ),
                    SizedBox(height: 4),
                    Text(
                      S.of(context).leave_blank_to_add_expert_categories,
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              _buildTargetOption(
                context,
                icon: Icons.interests,
                title: S.of(context).interests,
                subtitle: _selectedInterests.isNotEmpty ? _selectedInterests.join(' | ') : S.of(context).no_interests_selected,
                onTap: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InterestsPage()),
                  );
                  if (result != null) {
                    setState(() {
                      _selectedInterests = result;
                    });
                  }
                },
              ),
              Divider(),
              _buildTargetOption(
                context,
                icon: Icons.group,
                title: S.of(context).demographic_status,
                subtitle: _selectedDemographics.isNotEmpty ? _selectedDemographics.join(' | ') : S.of(context).no_demographic_status_selected,
                onTap: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => demographic_status_page.DemographicStatusPage()),
                  );
                  if (result != null) {
                    setState(() {
                      _selectedDemographics = result;
                    });
                  }
                },
              ),
              Divider(),
              _buildTargetOption(
                context,
                icon: Icons.person,
                title: S.of(context).behavior,
                subtitle: _selectedBehaviors.isNotEmpty ? _selectedBehaviors.join(' | ') : S.of(context).no_behavior_selected,
                onTap: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => behavior_page.BehaviorPage()),
                  );
                  if (result != null) {
                    setState(() {
                      _selectedBehaviors = result;
                    });
                  }
                },
              ),
              SizedBox(height: 16),
              Divider(),
              Text(
                S.of(context).notes,
                style: TextStyle(fontSize: 16, color: Colors.red, fontWeight: FontWeight.bold),
              ),
              Text(
                S.of(context).note1,
                style: TextStyle(fontSize: 14, color: Colors.red),
              ),
              Text(
                S.of(context).note2,
                style: TextStyle(fontSize: 14, color: Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTargetOption(BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      child: ListTile(
        leading: Icon(icon, color: purpleColor),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(color: Colors.orange),
        ),
        trailing: Icon(Icons.arrow_forward, color: purpleColor),
        onTap: onTap,
      ),
    );
  }
}
