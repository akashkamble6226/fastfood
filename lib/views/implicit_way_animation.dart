import 'package:flutter/material.dart';
import 'dart:math' as math;

class ImplicitWayAnim extends StatefulWidget {
  @override
  _ImplicitWayAnimState createState() => _ImplicitWayAnimState();
}

class _ImplicitWayAnimState extends State<ImplicitWayAnim>
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
      body: BoneAnim(animation: animation,)
    );
  }

  @override
  void dispose() {
    super.dispose();
    animController.dispose();
  }
}

class BoneAnim extends AnimatedWidget {

  BoneAnim({
    required Animation<double> animation,
  }):super(listenable: animation);



  @override
  Widget build(BuildContext context) {
    final animation = super.listenable as Animation<double>;
    return Center(
        child: Transform.rotate(
          angle: animation.value,
          child: Image.asset(
            'assets/images/leg.png',
            width: 100,
            height: 100,
          ),
        ),
      );
  }
}
