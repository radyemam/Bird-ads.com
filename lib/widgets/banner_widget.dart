import 'package:flutter/material.dart';
import 'package:untitled5/generated/l10n.dart';

class BannerWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onTap;

  const BannerWidget({required this.text, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final Color purpleColor = Color(0xFF800080);

    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: purpleColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 40, color: purpleColor),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: purpleColor),
                ),
              ),
            ],
          ),
          Spacer(),
          ElevatedButton(
            onPressed: onTap,
            child: Text(S.of(context).know_more, style: TextStyle(color: Colors.white)),
            style: ElevatedButton.styleFrom(
              backgroundColor: purpleColor,
              padding: EdgeInsets.symmetric(vertical: 16),
            ),
          ),
        ],
      ),
    );
  }
}
