import 'package:flutter/material.dart';

class SuspendedBalancePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الرصيد المعلق'),
        backgroundColor: Colors.blue[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('اجمالي الرصيد المعلق'),
            Text(
              '0.00 ج.م',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text('المعاملات'),
            Center(
              child: Column(
                children: [
                  Icon(Icons.money_off, size: 150), // Placeholder icon
                  SizedBox(height: 16),
                  Text('لا يوجد معاملات'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
