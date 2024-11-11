import 'package:flutter/material.dart';
import 'dart:math' as math;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _dotCountAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
    _dotCountAnimation = StepTween(begin: 0, end: 3).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                RotationTransition(
                  turns: _controller,
                  child: CustomPaint(
                    size: Size(100, 100),
                    painter: _CircularIndicatorPainter(),
                  ),
                ),
                Image.asset(
                  'assets/images/logo.png',
                  width: 60,
                  height: 60,
                ),
              ],
            ),
            SizedBox(height: 20),
            AnimatedBuilder(
              animation: _dotCountAnimation,
              builder: (context, child) {
                return Text(
                  'Loading${'.' * (_dotCountAnimation.value % 4)}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _CircularIndicatorPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 8
      ..style = PaintingStyle.stroke
      ..shader = LinearGradient(
        colors: [
          Color(0xFF800080), // اللون الأساسي للوجو (Purple)
          Colors.purpleAccent,
        ],
      ).createShader(Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: size.width / 2,
      ));

    final path = Path();
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    path.addArc(rect, 0, 2 * math.pi);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
