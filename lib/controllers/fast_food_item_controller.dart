import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FastFoodItem extends GetxController
{
   Alignment currentItemAlign = Alignment(0.0, -0.5);

  List<Alignment> itemAlignLst = [
    Alignment(0.0, -0.5),
    Alignment(0.0, -0.2),
    Alignment(0.0, 0.0),
    Alignment(0.0, 0.3),
  ];

  void changeItem(int i) {
   
      currentItemAlign= itemAlignLst[i];
      update();
      
    
  }

  
}