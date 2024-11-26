import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../settings/support_page.dart';
import 'package:untitled5/generated/l10n.dart';
import 'active_ads_logic.dart'; // Import the logic class

class ActiveAdsPage extends StatefulWidget {
  @override
  _ActiveAdsPageState createState() => _ActiveAdsPageState();
}

class _ActiveAdsPageState extends State<ActiveAdsPage> {
  List<DocumentSnapshot> _ads = [];
  bool _isLoading = true;
  String _errorMessage = '';

  final Color purpleColor = Color(0xFF800080);

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    String? email = await ActiveAdsLogic.loadUserEmail();
    if (email != null && email.isNotEmpty) {
      List<DocumentSnapshot> ads = await ActiveAdsLogic.loadAds(email);
      setState(() {
        _ads = ads;
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
        _errorMessage = S.of(context).no_ads_found;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).active_ads, style: TextStyle(color: Colors.white)),
          backgroundColor: purpleColor,
        ),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (_errorMessage.isNotEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).active_ads, style: TextStyle(color: Colors.white)),
          backgroundColor: purpleColor,
        ),
        body: Center(child: Text(_errorMessage)),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).active_ads, style: TextStyle(color: Colors.white)),
        backgroundColor: purpleColor,
      ),
      body: _ads.isEmpty
          ? Center(child: Text(S.of(context).no_ads_found))
          : ListView.builder(
        itemCount: _ads.length,
        itemBuilder: (context, index) {
          DocumentSnapshot ad = _ads[index];
          return _buildAdItem(ad, _ads.length - index);
        },
      ),
    );
  }

  Widget _buildAdItem(DocumentSnapshot ad, int adNumber) {
    Map<String, dynamic> adData = ad.data() as Map<String, dynamic>;
    String adName = adData['ad name'] ?? '';

    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ExpansionTile(
        tilePadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        title: Text(
          '${S.of(context).ad_details} $adNumber: ${adName.isNotEmpty ? adName : ''}',
          style: TextStyle(fontWeight: FontWeight.bold, color: purpleColor),
        ),
        subtitle: Text('${S.of(context).ad_details}: ${adData['status']}'),
        trailing: PopupMenuButton<String>(
          onSelected: (String value) {
            if (value == 'details') {
              ActiveAdsLogic.showAdDetails(context, ad);
            } else if (value == 'stop') {
              ActiveAdsLogic.stopAdRequest(context, ad);
            } else if (value == 'results') {
              ActiveAdsLogic.showAdResults(context);
            } else if (value == 'increase') {
              ActiveAdsLogic.showBudgetDialog(context, ad);
            } else if (value == 'edit') {
              ActiveAdsLogic.showEditDialog(context, ad);
            }
          },
          itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem<String>(
                value: 'details',
                child: Text(S.of(context).ad_details),
              ),
              PopupMenuItem<String>(
                value: 'stop',
                child: Text(S.of(context).stop_ad_request),
              ),
              PopupMenuItem<String>(
                value: 'results',
                child: Text(S.of(context).ad_results),
              ),
              PopupMenuItem<String>(
                value: 'increase',
                child: Text(S.of(context).increase_ad),
              ),
              PopupMenuItem<String>(
                value: 'edit',
                child: Text(S.of(context).edit_ad),
              ),
            ];
          },
        ),
        children: <Widget>[
          ListTile(
            title: Text(S.of(context).ad_details),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: ActiveAdsLogic.buildAdDetails(context, adData),
            ),
          ),
        ],
      ),
    );
  }
}
