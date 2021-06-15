import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import '../models/pramotion_dummy_data.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // double devideWidth = MediaQuery.of(context).size.width;
    // double fromLeft = 120;
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
          SizedBox(height:10),
          Container(
            height: 180,
            
                      child:ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: pramotionItemList.length,
                    itemBuilder: (BuildContext ctx, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          width: 130,
                          
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: HexColor(pramotionItemList[index].backClr,).withOpacity(0.4),
                          ),
                          child:  Image.asset(pramotionItemList[index].imgSrc,fit: BoxFit.contain),
                          
                        ),
                      );
                    },
                  
                          ),
          ),
              
          
          
        ],
      ),
    );
  }
}
