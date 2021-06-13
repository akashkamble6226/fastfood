import 'package:flutter/material.dart';

Widget menuWidget(bool isSideBarOpen, dynamic animationController) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(
        height: 20,
      ),
      Row(
        mainAxisAlignment:
            isSideBarOpen ? MainAxisAlignment.start : MainAxisAlignment.center,
        children: [

         isSideBarOpen ?  SizedBox(
        width: 10,
      ) : SizedBox(
        width: 0,
      ),
          Center(
            child: AnimatedIcon(
              progress: animationController.view,
              icon: AnimatedIcons.menu_close,
              color: Colors.white,
              size: 25,
            ),
          ),
        ],
      ),
    ],
  );
}
