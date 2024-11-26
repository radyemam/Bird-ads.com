// lib/screens/ads/stopped_ads_ui.dart
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:untitled5/generated/l10n.dart';
import 'stopped_ads_logic.dart';

class StoppedAdsPage extends StatefulWidget {
  @override
  _StoppedAdsPageState createState() => _StoppedAdsPageState();
}

class _StoppedAdsPageState extends State<StoppedAdsPage> {
  final StoppedAdsLogic _logic = StoppedAdsLogic();

  @override
  void initState() {
    super.initState();
    _logic.loadUserEmail(context, setState);
  }

  @override
  Widget build(BuildContext context) {
    if (_logic.isLoading) {
      return Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).stopped_ads, style: TextStyle(color: Colors.white)),
          backgroundColor: _logic.purpleColor,
        ),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (_logic.errorMessage.isNotEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).stopped_ads, style: TextStyle(color: Colors.white)),
          backgroundColor: _logic.purpleColor,
        ),
        body: Center(child: Text(_logic.errorMessage)),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).stopped_ads, style: TextStyle(color: Colors.white)),
        backgroundColor: _logic.purpleColor,
      ),
      body: _logic.ads.isEmpty
          ? Center(child: Text(S.of(context).no_ads_found))
          : ListView.builder(
        itemCount: _logic.ads.length,
        itemBuilder: (context, index) {
          DocumentSnapshot ad = _logic.ads[index];
          return _buildAdItem(ad, _logic.ads.length - index);
        },
      ),
    );
  }

  Widget _buildAdItem(DocumentSnapshot ad, int adNumber) {
    Map<String, dynamic> adData = ad.data() as Map<String, dynamic>;
    String adName = adData['ad name'] ?? '';
    String platform = adData['Platform'] ?? '';
    String adGoal = adData['ad goal'] ?? '';
    String gender = adData['gender'] ?? '';
    String ageFrom = adData['age from']?.toString() ?? '';
    String ageTo = adData['age to']?.toString() ?? '';
    String budget = adData['budget']?.toString() ?? '';
    String duration = adData['duration']?.toString() ?? '';
    String country = adData['country'] ?? '';
    String location = adData['location'] ?? '';
    String interests = adData['interests'] ?? '';
    String behavior = adData['behavior'] ?? '';
    String postLink = adData['Link post'] ?? '';
    String postText = adData['text post'] ?? '';
    String imagePost = adData['image post'] ?? '';

    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ExpansionTile(
        tilePadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        title: Text(
          '${S.of(context).ad_number(adNumber, adName.isNotEmpty ? adName : '')}',
          style: TextStyle(fontWeight: FontWeight.bold, color: _logic.purpleColor),
        ),
        subtitle: Text('${S.of(context).ad_status(adData['status'])}'),
        trailing: PopupMenuButton<String>(
          onSelected: (String value) {
            if (value == 'resume') {
              _logic.showResumeAdDialog(context, ad);
            } else if (value == 'details') {
              _logic.showAdDetails(context, ad);
            } else if (value == 'activate') {
              _logic.activateAd(context, ad);
            }
          },
          itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem<String>(
                value: 'resume',
                child: Text(S.of(context).resume_ad),
              ),
              PopupMenuItem<String>(
                value: 'details',
                child: Text(S.of(context).ad_details),
              ),
              PopupMenuItem<String>(
                value: 'activate',
                child: Text(S.of(context).activate_ad),
              ),
            ];
          },
        ),
        children: <Widget>[
          ListTile(
            title: Text(S.of(context).ad_details),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (platform.isNotEmpty) Text('${S.of(context).platform}: $platform'),
                if (adGoal.isNotEmpty) Text('${S.of(context).ad_goal}: $adGoal'),
                if (gender.isNotEmpty) Text('${S.of(context).gender}: $gender'),
                if (ageFrom.isNotEmpty && ageTo.isNotEmpty) Text('${S.of(context).age_range(ageFrom, ageTo)}'),
                if (budget.isNotEmpty) Text('${S.of(context).budget}: $budget'),
                if (duration.isNotEmpty) Text('${S.of(context).duration_days(duration)}'),
                if (country.isNotEmpty) Text('${S.of(context).country}: $country'),
                if (location.isNotEmpty) Text('${S.of(context).location}: ${location.toString()}'),
                if (interests.isNotEmpty) Text('${S.of(context).interests}: $interests'),
                if (behavior.isNotEmpty) Text('${S.of(context).behaviors}: $behavior'),
                if (postLink.isNotEmpty) GestureDetector(
                  onTap: () async {
                    if (await canLaunch(postLink)) {
                      await launch(postLink);
                    }
                  },
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Link post: ',
                          style: TextStyle(color: Colors.black),
                        ),
                        TextSpan(
                          text: postLink,
                          style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
                        ),
                      ],
                    ),
                  ),
                ),
                if (postText.isNotEmpty && postLink.isEmpty) Text('${S.of(context).post_text}: $postText'),
                if (imagePost.isNotEmpty) Text('${S.of(context).post_images}: $imagePost'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
