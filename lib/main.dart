import 'package:fastfood/views/basic_animation.dart';
import 'package:fastfood/views/efficient_anim.dart';
import 'package:fastfood/views/side_bar_layout.dart';
import 'package:fastfood/views/sidebar.dart';
import 'package:fastfood/views/implicit_way_animation.dart';
import 'package:fastfood/widgets/device_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hexcolor/hexcolor.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  // final deviceDetails = DeviceDetails();
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Fast Food',
      color: HexColor('#ffa500'),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        
        primaryColor:  HexColor('#ffa500'),
      ),
      home: SideBarLayout(),
    );
  }
}

