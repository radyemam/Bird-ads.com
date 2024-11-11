import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled5/generated/l10n.dart';

class DemographicStatusPage extends StatefulWidget {
  @override
  _DemographicStatusPageState createState() => _DemographicStatusPageState();
}

class _DemographicStatusPageState extends State<DemographicStatusPage> {
  List<String> _allStatuses = [];
  List<String> _filteredStatuses = [];
  List<String> _selectedStatuses = [];
  final TextEditingController _searchController = TextEditingController();
  final Color purpleColor = Color(0xFF800080);

  @override
  void initState() {
    super.initState();
    _loadSelectedStatuses();
    _filteredStatuses.addAll(_allStatuses);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _allStatuses = [
      S.of(context).status_1,
      S.of(context).status_2,
      S.of(context).status_3,
      S.of(context).status_4,
      S.of(context).status_5,
      S.of(context).status_6,
      S.of(context).status_7,
      S.of(context).status_8,
      S.of(context).status_9,
      S.of(context).status_10,
      S.of(context).status_11,
      S.of(context).status_12,
      S.of(context).status_13,
      S.of(context).status_14,
      S.of(context).status_15,
      S.of(context).status_16,
      S.of(context).status_17,
      S.of(context).status_18,
      S.of(context).status_19,
      S.of(context).status_20,
      S.of(context).status_21,
      S.of(context).status_22,
      S.of(context).status_23,
      S.of(context).status_24,
      S.of(context).status_25,
      S.of(context).status_26,
      S.of(context).status_27,
      S.of(context).status_28,
      S.of(context).status_29,
      S.of(context).status_30,
      S.of(context).status_31,
      S.of(context).status_32,
      S.of(context).status_33,
      S.of(context).status_34,
      S.of(context).status_35,
      S.of(context).status_36,
      S.of(context).status_37,
      S.of(context).status_38,
      S.of(context).status_39,
      S.of(context).status_40,
      S.of(context).status_41,
      S.of(context).status_42,
      S.of(context).status_43,
      S.of(context).status_44,
      S.of(context).status_45,
      S.of(context).status_46,
      S.of(context).status_47,
      S.of(context).status_48,
      S.of(context).status_49,
      S.of(context).status_50,
      S.of(context).status_51,
      S.of(context).status_52,
      S.of(context).status_53,
      S.of(context).status_54,
      S.of(context).status_55,
      S.of(context).status_56,
      S.of(context).status_57,
      S.of(context).status_58,
      S.of(context).status_59,
      S.of(context).status_60,
    ];
    setState(() {
      _filteredStatuses = List.from(_allStatuses);
    });
  }

  Future<void> _loadSelectedStatuses() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _selectedStatuses = prefs.getStringList('selectedStatuses') ?? [];
    });
  }

  void _filterStatuses(String query) {
    final filtered = _allStatuses.where((status) => status.contains(query)).toList();
    setState(() {
      _filteredStatuses.clear();
      _filteredStatuses.addAll(filtered);
    });
  }

  void _toggleStatus(String status) {
    setState(() {
      if (_selectedStatuses.contains(status)) {
        _selectedStatuses.remove(status);
      } else {
        _selectedStatuses.add(status);
      }
    });
  }

  Future<void> _saveStatuses() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('selectedStatuses', _selectedStatuses);
    Navigator.pop(context, _selectedStatuses);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).demographic_status_page_title, style: TextStyle(color: Colors.white)),
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
                    labelText: S.of(context).search_demographic_status,
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onChanged: _filterStatuses,
                ),
                SizedBox(height: 16),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: _selectedStatuses.map((status) {
                    return Chip(
                      label: Text(status),
                      onDeleted: () {
                        _toggleStatus(status);
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
                  itemCount: _filteredStatuses.length,
                  itemBuilder: (context, index) {
                    final status = _filteredStatuses[index];
                    final isSelected = _selectedStatuses.contains(status);
                    return GestureDetector(
                      onTap: () {
                        _toggleStatus(status);
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
                            status,
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
              onPressed: _saveStatuses,
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
