import 'package:fastfood/views/chicken_menu.dart';
import 'package:fastfood/views/colddrink_menu.dart';
import 'package:fastfood/views/homepage.dart';
import 'package:fastfood/views/pizza_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/device_details.dart';
import '../views/homepage.dart';
class FastFoodItem extends GetxController {
  Alignment currentItemAlign = Alignment(0.0, DeviceDetails.bergerTop);
  Widget currentPage = BergerMenu();

   @override
  void onInit() 
  {   
  super.onInit();
  }

  
  List<Alignment> itemAlignLst = [
    Alignment(0.0, DeviceDetails.chickenTop),
    Alignment(0.0, DeviceDetails.pizzaTop),
    Alignment(0.0, DeviceDetails.bergerTop),
    Alignment(0.0, DeviceDetails.coldDrinkTop),
  ];

  // sequence is important here so do check while putiing widget here 
  List menuItemList = [
    ChickenMenu(),
    PizzaMenu(),
    BergerMenu(),
    ColdDrink(),
  ];

  void changeItem(int i) {
    currentItemAlign = itemAlignLst[i];
    currentPage = menuItemList[i];
    update();
  }
}
