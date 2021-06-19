import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:hexcolor/hexcolor.dart';

import '../views/sidebar.dart';
import 'package:flutter/material.dart';

import 'homepage.dart';

class SideBarLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ColorfulSafeArea(
        color: HexColor('#ffa500'),
        child: Stack(
          children: [
            HomePage(),
            SideBar(),
          ],
        ),
      ),
    );
  }
}
