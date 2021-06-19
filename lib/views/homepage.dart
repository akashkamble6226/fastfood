import 'package:fastfood/models/fast_food_item_dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import '../models/pramotion_dummy_data.dart';
import 'item_details.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // double devideWidth = MediaQuery.of(context).size.width;
    // double fromLeft = 120;
    return Scaffold(
      backgroundColor: HexColor('ffffff'),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                BuildTitleAndFirstRow(),
                SizedBox(height: 10),
                BuildPramotionRow(),
                SizedBox(height: 80),
              ],
            ),
          ),
          BuildFastFoodItemsRow(),
        ],
      ),
    );
  }
}

class BuildTitleAndFirstRow extends StatelessWidget {
  const BuildTitleAndFirstRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 120),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 40),
          Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Fast food',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Spacer(),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: SvgPicture.asset("assets/svg/avtar.svg",
                      matchTextDirection: false),
                ),
                SizedBox(
                  width: 30,
                ),
              ]),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text(
                'Pramotions',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BuildFastFoodItemsRow extends StatelessWidget {
  const BuildFastFoodItemsRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (ct, ind) {
          return Padding(
            padding: const EdgeInsets.only(left: 120, bottom: 70, right: 10),
            child: Material(
              borderRadius: BorderRadius.circular(20),
              elevation: 10,
              child: GestureDetector(
                onTap: () {
                  // Navigation.push();
                  Get.to(() =>ItemDetails());
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: HexColor('#ffffff').withOpacity(1)),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Column(
                            // clipBehavior: Clip.antiAliasWithSaveLayer,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 120,
                                  child: Text(
                                    fastFoodItemList[ind].name,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),

                              SizedBox(
                                height: 20,
                              ),

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  fastFoodItemList[ind].price.toString() +
                                      ' \$',
                                  style: TextStyle(
                                      color: HexColor('#ffa500'),
                                      fontWeight: FontWeight.bold),
                                ),
                              )

                              // Image.asset(fastFoodItemList[index].img,fit: BoxFit.contain,width: 100,),
                            ]),
                      ),
                      Positioned(
                        top: -40,
                        left: 0,
                        right: -135,
                        bottom: 50,
                        child: Image.asset(
                          fastFoodItemList[ind].img,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        childCount: fastFoodItemList.length,
      ),
    );
  }
}

class BuildPramotionRow extends StatelessWidget {
  const BuildPramotionRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 120),
      child: Container(
        height: 180,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: pramotionItemList.length,
          itemBuilder: (BuildContext ctx, int index) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Stack(
                clipBehavior: Clip.hardEdge,
                children: [
                  Container(
                    width: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: HexColor(
                        pramotionItemList[index].backClr,
                      ).withOpacity(0.3),
                    ),
                  ),
                  Positioned(
                      top: 15,
                      right: 20,
                      child: Text(
                        pramotionItemList[index].discount.toString() + "%",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: HexColor(pramotionItemList[index].backClr)),
                      )),
                  Positioned(
                    top: 30,
                    right: 5,
                    left: -30,
                    bottom: 2,
                    child: Image.asset(pramotionItemList[index].imgSrc,
                        fit: BoxFit.contain),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
