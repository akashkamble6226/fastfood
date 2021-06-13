import 'package:flutter/material.dart';
import 'dart:math' as math;

class MoreEfficientAnim extends StatefulWidget {
  @override
  _MoreEfficientAnimState createState() => _MoreEfficientAnimState();
}

class _MoreEfficientAnimState extends State<MoreEfficientAnim>
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
      body: RotatingTransition(
        child: BoneImage(),
        angle: animation,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    animController.dispose();
  }
}

class RotatingTransition extends StatelessWidget {
  final Widget child;
  final Animation<double> angle;

  RotatingTransition({
    required this.angle,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: angle,
      child: child,
      builder: (context, child) {
        return Transform.rotate(
          angle: angle.value,
          child: child,
        );
      },
    );
  }
}

class BoneImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/images/leg.png',
        width: 100,
        height: 100,
      ),
    );
  }
}
