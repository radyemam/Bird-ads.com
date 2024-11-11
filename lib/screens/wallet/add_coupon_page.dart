import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled5/generated/l10n.dart';
import 'package:untitled5/widgets/loading_screen.dart';

class AddCouponPage extends StatefulWidget {
  @override
  _AddCouponPageState createState() => _AddCouponPageState();
}

class _AddCouponPageState extends State<AddCouponPage> {
  final TextEditingController couponController = TextEditingController();
  String message = '';
  Color messageColor = Colors.red;
  final Color purpleColor = Color(0xFF800080);

  Future<void> _applyCoupon() async {
    setState(() {
      message = '';
    });

    // عرض شاشة التحميل
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return LoadingScreen();
      },
    );

    final String couponCode = couponController.text.trim();
    final User? user = FirebaseAuth.instance.currentUser;

    if (user == null || couponCode.isEmpty) {
      Navigator.pop(context); // إغلاق شاشة التحميل
      setState(() {
        message = S.of(context).invalid_coupon;
        messageColor = Colors.red;
      });
      return;
    }

    try {
      final couponSnapshot = await FirebaseFirestore.instance
          .collection('create coupon')
          .where('coupon name', isEqualTo: couponCode)
          .get();

      if (couponSnapshot.docs.isEmpty) {
        Navigator.pop(context); // إغلاق شاشة التحميل
        setState(() {
          message = S.of(context).invalid_coupon;
          messageColor = Colors.red;
        });
        return;
      }

      final couponData = couponSnapshot.docs.first.data();
      final couponId = couponSnapshot.docs.first.id;
      final int couponValue = couponData['cost'];
      final String userEmail = user.email!;
      final String couponName = couponData['coupon name'];

      final usedCouponSnapshot = await FirebaseFirestore.instance
          .collection('used_coupons')
          .where('coupon_id', isEqualTo: couponId)
          .where('email', isEqualTo: userEmail)
          .get();

      if (usedCouponSnapshot.docs.isNotEmpty) {
        Navigator.pop(context); // إغلاق شاشة التحميل
        setState(() {
          message = S.of(context).used_coupon;
          messageColor = Colors.red;
        });
        return;
      }

      final userBalanceDoc = FirebaseFirestore.instance.collection('clients').doc(user.uid);
      await FirebaseFirestore.instance.runTransaction((transaction) async {
        final userBalanceSnapshot = await transaction.get(userBalanceDoc);
        if (!userBalanceSnapshot.exists) {
          transaction.set(userBalanceDoc, {
            'total_balance': couponValue,
          });
        } else {
          transaction.update(userBalanceDoc, {
            'total_balance': FieldValue.increment(couponValue),
          });
        }
      });

      await FirebaseFirestore.instance.collection('used_coupons').add({
        'coupon_id': couponId,
        'email': userEmail,
        'timestamp': FieldValue.serverTimestamp(),
      });

      await FirebaseFirestore.instance.collection('statement').add({
        'ID client': user.uid,
        'first name': user.displayName?.split(' ').first ?? '',
        'last name': user.displayName?.split(' ').last ?? '',
        'email': userEmail,
        'addition_amount': couponValue,
        'deduction_amount': 0,
        'timestamp': FieldValue.serverTimestamp(),
        'transaction_name': 'تم اضافة كوبون $couponName بقيمة $couponValue ج.م',
      });

      Navigator.pop(context); // إغلاق شاشة التحميل
      setState(() {
        message = 'تم الحصول على مبلغ $couponValue ج.م';
        messageColor = Colors.green;
      });

      couponController.clear();
    } catch (e) {
      Navigator.pop(context); // إغلاق شاشة التحميل في حالة حدوث خطأ
      setState(() {
        message = 'حدث خطأ ما. حاول مرة أخرى.';
        messageColor = Colors.red;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).add_coupon, style: TextStyle(color: Colors.white)),
        backgroundColor: purpleColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      height: 150,
                    ),
                    SizedBox(height: 16),
                    Text(
                      S.of(context).coupon_message,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32),
              TextField(
                controller: couponController,
                decoration: InputDecoration(
                  labelText: S.of(context).enter_coupon,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _applyCoupon,
                      child: Text(S.of(context).apply_coupon, style: TextStyle(fontSize: 18, color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: purpleColor,
                        padding: EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(S.of(context).cancel, style: TextStyle(fontSize: 18)),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: purpleColor,
                        side: BorderSide(color: purpleColor),
                        padding: EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Center(
                child: Text(
                  message,
                  style: TextStyle(color: messageColor, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}