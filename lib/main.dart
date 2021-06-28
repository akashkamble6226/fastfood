import 'package:fastfood/views/side_bar_layout.dart';

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  // final deviceDetails = DeviceDetails();
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        title: 'Fast Food',
        color: HexColor('#ffa500'),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: HexColor('#ffa500'),
        ),
        home: SideBarLayout(),
      );
    });
  }
}
