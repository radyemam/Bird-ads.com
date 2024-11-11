import 'package:flutter/material.dart';
import '../settings/support_page.dart'; // استيراد صفحة الدعم
import 'package:untitled5/generated/l10n.dart';
import 'new_creative_content_details_page.dart'; // استيراد صفحة التفاصيل الجديدة
import 'client_requests_history.dart'; // استيراد صفحة الطلبات السابقة

class OtherServicesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Color purpleColor = Color(0xFF800080);

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).other_services, style: TextStyle(color: Colors.white)),
        backgroundColor: purpleColor,
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _buildServiceCard(context, S.of(context).ad_services, S.of(context).ad_platforms, purpleColor),
              _buildServiceCard(context, S.of(context).design_services, S.of(context).design_examples, purpleColor),
              _buildServiceCardWithDetails(context, S.of(context).creative_content, S.of(context).ai_collaboration, purpleColor),
              _buildServiceCard(context, S.of(context).ready_facebook_pages, S.of(context).price_based_on_followers, purpleColor),
              _buildServiceCard(context, S.of(context).facebook_followers, S.of(context).real_engaged_people, purpleColor),
              _buildServiceCard(context, S.of(context).comments_likes, "", purpleColor),
              _buildServiceCard(context, S.of(context).instagram_accounts, "", purpleColor),
              _buildServiceCard(context, S.of(context).ready_instagram_accounts, "", purpleColor),
              _buildServiceCard(context, S.of(context).ready_tiktok_accounts, "", purpleColor),
              SizedBox(height: 16),
              Text(
                S.of(context).request_services,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SupportPage()),
                      );
                    },
                    child: Text(
                      S.of(context).order_service,
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: purpleColor,
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    ),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ClientRequestsHistoryPage()),
                      );
                    },
                    child: Text(
                      S.of(context).previous_requests,
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: purpleColor,
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildServiceCard(BuildContext context, String title, String subtitle, Color color) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color),
        ),
        subtitle: subtitle.isNotEmpty
            ? Text(
          subtitle,
          style: TextStyle(fontSize: 16, color: Colors.grey),
        )
            : null,
      ),
    );
  }

  Widget _buildServiceCardWithDetails(BuildContext context, String title, String subtitle, Color color) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          ListTile(
            title: Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color),
            ),
            subtitle: subtitle.isNotEmpty
                ? Text(
              subtitle,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            )
                : null,
            trailing: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NewCreativeContentDetailsPage()),
                );
              },
              child: Text(
                S.of(context).details,
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
