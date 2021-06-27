import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:fastfood/controllers/fast_food_item_controller.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../views/sidebar.dart';
import 'package:flutter/material.dart';

import 'homepage.dart';

class SideBarLayout extends StatelessWidget {
  final FastFoodItem selectMenu = Get.put(FastFoodItem());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ColorfulSafeArea(
        color: HexColor('#ffa500'),
        child: Stack(
          children: [
            GetBuilder<FastFoodItem>(
              init: FastFoodItem(),
              builder: (controller) {
                return controller.currentPage;
              },
            ),
            SideBar(),
          ],
        ),
      ),
    );
  }
}
