import 'package:flutter/material.dart';
import 'dart:math' as math;

class BasicAnim extends StatefulWidget {
  @override
  _BasicAnimState createState() => _BasicAnimState();
}

class _BasicAnimState extends State<BasicAnim>
    with SingleTickerProviderStateMixin {
  late AnimationController animController;
  late Animation<double> animation;
  @override
  void initState() {
    super.initState();
    animController =
        AnimationController(duration: Duration(seconds: 5), vsync: this);

    final animCurve = CurvedAnimation(
        parent: animController,
        curve: Curves.bounceIn,
        reverseCurve: Curves.easeOut);


    animation = Tween<double>(
      begin: 0,
      end: 2 * math.pi,
    ).animate(animCurve)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          animController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          animController.forward();
        }
      });

    animController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Center(
        child: Transform.rotate(
          angle: animation.value,
          child: Image.asset(
            'assets/images/leg.png',
            width: 100,
            height: 100,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    animController.dispose();
  }
}
