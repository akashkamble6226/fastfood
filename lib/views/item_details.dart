import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:fastfood/models/dummy_ingredients.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:ionicons/ionicons.dart';

class ItemDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColorfulSafeArea(
        color: HexColor('#ffa500'),
        child: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 50),
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: HexColor('#ffa500'),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: IconButton(
                                // Use the MdiIcons class for the IconData
                                icon: new Icon(
                                  Ionicons.arrow_back_sharp,
                                  color: HexColor('#ffffff'),
                                ),
                                onPressed: () {
                                  Get.back();
                                  //
                                }),
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          child: SvgPicture.asset("assets/svg/avtar.svg",
                              matchTextDirection: false),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        width: 150,
                        child: Text(
                          'Chicken Burger',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Spacer(),
                      Text(
                        '11.95\$',
                        style: TextStyle(
                            color: HexColor('#ffa500'),
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildCharacteristics("20-30 m", "delivery"),
                          SizedBox(
                            height: 50,
                          ),
                          buildCharacteristics("250 g", "weight"),
                          SizedBox(
                            height: 50,
                          ),
                          buildCharacteristics("295 kcal", "energy"),
                        ],
                      ),
                      Spacer(),
                      FittedBox(
                        child: Transform.rotate(
                          angle: 270,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: FittedBox(

                                                          child: Image.asset(
                                'assets/images/burger.png',
                                fit: BoxFit.fitWidth,
                                width: 200,
                                height: 250,
                              ),
                            ),
                          ),
                        ),
                        fit: BoxFit.fill,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: 180,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (ctx, ind) {
                          return  Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Container(
                                    width: 120,
                                    height: 120,
                                    decoration: BoxDecoration(
                                        color: HexColor(ingredientsList[ind].clr)
                                            .withOpacity(0.3),
                                        borderRadius: BorderRadius.circular(15)),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Container(
                                            width: 70,
                                            height: 70,
                                            child: Image.asset(
                                                ingredientsList[ind].img)),
                                      ),
                                    ),
                                  
                                ),
                              ),

                              Text(ingredientsList[ind].name,style: TextStyle(fontWeight: FontWeight.bold),),
                            ],
                          );
                        },
                        itemCount: ingredientsList.length),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2 ,
                      height: 50,
                      decoration: BoxDecoration(
                        color: HexColor('#ffa500'),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
                        child: Text(
                          'to cart +',
                          style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                   SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildCharacteristics(String detail, String name) {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Text(
      detail,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    SizedBox(
      height: 10,
    ),
    Text(name),
  ]);
}
