import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled5/generated/l10n.dart';

class BehaviorPage extends StatefulWidget {
  @override
  _BehaviorPageState createState() => _BehaviorPageState();
}

class _BehaviorPageState extends State<BehaviorPage> {
  List<String> _allBehaviors = [];
  List<String> _filteredBehaviors = [];
  List<String> _selectedBehaviors = [];
  final TextEditingController _searchController = TextEditingController();
  final Color purpleColor = Color(0xFF800080);

  @override
  void initState() {
    super.initState();
    _initializeBehaviors();
    _loadSelectedBehaviors();
  }

  void _initializeBehaviors() {
    _allBehaviors = [
      S.current.engaged_shoppers,
      S.current.soccer_fans_moderate,
      S.current.soccer_fans_high,
      S.current.friends_of_soccer_fans,
      S.current.facebook_access_mobile_all_devices,
      S.current.facebook_access_mobile_smartphones_tablets,
      S.current.facebook_access_mobile_feature_phones,
      S.current.all_mobile_devices_by_brand,
      S.current.all_mobile_devices_by_os,
      S.current.new_smartphone_tablet_users,
      S.current.network_connection,
      S.current.android_360_media_supported,
      S.current.android_360_media_not_supported,
      S.current.owns_oneplus,
      S.current.small_business_owners,
      S.current.facebook_payment_users_90_days,
      S.current.technology_early_adopters,
      S.current.os_used,
      S.current.facebook_access_old_devices_os,
      S.current.facebook_payment_users_30_days,
      S.current.mobile_gamers,
      S.current.browser_used,
      S.current.facebook_page_admins,
      S.current.canvas_games,
      S.current.people_visited_facebook_gaming,
      S.current.new_active_business_6_months,
      S.current.new_active_business_24_months,
      S.current.new_active_business_12_months,
      S.current.instagram_business_profile_admins,
      S.current.frequent_travelers,
      S.current.returned_from_travel_week,
      S.current.returned_from_travel_two_weeks,
      S.current.daily_commuters,
      S.current.frequent_international_travelers,
      S.current.facebook_lite_users,
      S.current.store_admins,
      S.current.travel_outdoor_enthusiasts,
      S.current.food_drink_creators,
      S.current.health_wellness_creators,
      S.current.all_creators,
      S.current.internet_personality_creators,
      S.current.travel,
      S.current.digital_activities,
      S.current.mobile_device_user,
      S.current.expats,
      S.current.anniversary,
      S.current.consumer_classification,
      S.current.purchase_behavior,
      S.current.soccer,
      S.current.more_categories,
      S.current.mobile_device_user_device_usage_time,
      S.current.behaviors,
      S.current.digital_activities_team,
    ];
    _filteredBehaviors.addAll(_allBehaviors);
  }

  Future<void> _loadSelectedBehaviors() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _selectedBehaviors = prefs.getStringList('selectedBehaviors') ?? [];
    });
  }

  void _filterBehaviors(String query) {
    final filtered = _allBehaviors.where((behavior) => behavior.contains(query)).toList();
    setState(() {
      _filteredBehaviors.clear();
      _filteredBehaviors.addAll(filtered);
    });
  }

  void _toggleBehavior(String behavior) {
    setState(() {
      if (_selectedBehaviors.contains(behavior)) {
        _selectedBehaviors.remove(behavior);
      } else {
        _selectedBehaviors.add(behavior);
      }
    });
  }

  Future<void> _saveBehaviors() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('selectedBehaviors', _selectedBehaviors);
    Navigator.pop(context, _selectedBehaviors);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).search_behavior, style: TextStyle(color: Colors.white)),
        backgroundColor: purpleColor,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    labelText: S.of(context).search_behavior_hint,
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onChanged: _filterBehaviors,
                ),
                SizedBox(height: 16),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: _selectedBehaviors.map((behavior) {
                    return Chip(
                      label: Text(behavior),
                      onDeleted: () {
                        _toggleBehavior(behavior);
                      },
                    );
                  }).toList(),
                ),
                SizedBox(height: 16),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: _filteredBehaviors.length,
                  itemBuilder: (context, index) {
                    final behavior = _filteredBehaviors[index];
                    final isSelected = _selectedBehaviors.contains(behavior);
                    return GestureDetector(
                      onTap: () {
                        _toggleBehavior(behavior);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.green[100] : Colors.white,
                          border: Border.all(
                            color: isSelected ? Colors.green : Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            behavior,
                            style: TextStyle(
                              color: isSelected ? Colors.green[700] : Colors.black,
                              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 80), // Add some space at the bottom
              ],
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: ElevatedButton(
              onPressed: _saveBehaviors,
              child: Text(S.of(context).save_behaviors, style: TextStyle(fontSize: 20, color: Colors.white)),
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
