import 'dart:async';

import 'package:fastfood/controllers/fast_food_item_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:rxdart/rxdart.dart';
import 'package:get/get.dart';

import '../widgets/filter_widget.dart';

import '../widgets/fast_food_item.dart';
import '../widgets/fast_food_search.dart';

import '../widgets/menuWidget.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> with SingleTickerProviderStateMixin {
  // bool isSideBarOpen = true;

  late AnimationController animationController;
  final _animatedDuration = const Duration(milliseconds: 500);

  late StreamController<bool> _isSideBarOpenedStreamController;
  late Stream<bool> isSideBarOpendStream;
  late StreamSink<bool> isSideBarOpendSink;

  final FastFoodItem carDetailPageController = Get.put(FastFoodItem());

  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(vsync: this, duration: _animatedDuration);
    _isSideBarOpenedStreamController = PublishSubject<bool>();
    isSideBarOpendStream = _isSideBarOpenedStreamController.stream;
    isSideBarOpendSink = _isSideBarOpenedStreamController.sink;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    _isSideBarOpenedStreamController.close();
    isSideBarOpendSink.close();
    super.dispose();
  }

  void onIconPressed() {
    final animationStatus = animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;

    if (isAnimationCompleted) {
      isSideBarOpendSink.add(false);
      animationController.reverse();
    } else {
      isSideBarOpendSink.add(true);
      animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double devideWidth = MediaQuery.of(context).size.width;

    

    return Stack(
      children: [
        StreamBuilder<bool>(
          initialData: false,
          stream: isSideBarOpendStream,
          builder: (context, AsyncSnapshot<bool> isSideBarOpendAsync) {
            bool isSideBarOpen = isSideBarOpendAsync.requireData;

            return AnimatedPositioned(
              duration: _animatedDuration,
              top: 0,
              bottom: 0,
              left: isSideBarOpen ? 0 : 0,
              right: isSideBarOpen ? devideWidth / 2 : devideWidth - 100,
              child: GetBuilder<FastFoodItem>(
                init:FastFoodItem(),
                builder:(controller){
                  return  Row(
                    children: [
                      Expanded(
                        child: Container(
                            width: devideWidth,
                            height: deviceHeight,
                            color: HexColor('#ffa500'),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                // menu search
                                GestureDetector(
                                    onTap: () {
                                      onIconPressed();
                                    },
                                    child: menuWidget(
                                        isSideBarOpen, animationController)),

                                SizedBox(
                                  height: 20,
                                ),
                                //search tab
                                fastFoodSearch(isSideBarOpen),
                                // Chicken tab
                                SizedBox(
                                  height: 35,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    controller.changeItem(0);
                                  },
                                  child: fastFoodItem(isSideBarOpen, "Chicken",
                                      'assets/images/leg.png'),
                                ),
                                // Pizza tab
                                GestureDetector(
                                  onTap: () {
                                    controller.changeItem(1);
                                  },
                                  child: fastFoodItem(isSideBarOpen, "Pizza",
                                      'assets/images/pizza.png'),
                                ),
                                // Hamburger tab
                                GestureDetector(
                                  onTap: () {
                                    controller.changeItem(2);
                                  },
                                  child: fastFoodItem(isSideBarOpen, "Hamburger",
                                      'assets/images/hamburguer.png'),
                                ),
                                // beer tab
                                GestureDetector(
                                  onTap: () {
                                    controller.changeItem(3);
                                  },
                                  child: fastFoodItem(isSideBarOpen, "Beer",
                                      'assets/images/beer.png'),
                                ),
                                // filter tab
                                filterWidget(isSideBarOpen),
                              ],
                            )),
                      ),
                      Align(
                        alignment: controller.currentItemAlign,
                        child: GestureDetector(
                          onTap: () {},
                          child: ClipPath(
                            clipper: CustomMenuClipper(),
                            child: Container(
                              alignment: Alignment.center,
                              height: 90,
                              width: 30,
                              decoration: BoxDecoration(
                                color: HexColor('#ffa500'),
                              ),
                              child:
                                  // AnimatedIcon(
                                  //   progress: animationController.view,
                                  //   icon: AnimatedIcons.menu_close,
                                  //   color: Colors.white,
                                  //   size: 25,
                                  // ),
                                  Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                } ,
                              
              ),
              
            );
          },
        ),
      ],
    );
  }
}

class CustomMenuClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    // TODO: implement getClip

    Paint paint = Paint();
    paint.color = Colors.white;

    final width = size.width;
    final height = size.height;

    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width - 1, height / 2 - 20, width, height / 2);
    path.quadraticBezierTo(width + 1, height / 2 + 20, 10, height - 16);
    path.quadraticBezierTo(0, height - 8, 0, height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}
