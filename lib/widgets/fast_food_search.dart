import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Widget fastFoodSearch(bool isSideBarOpen) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment:
            isSideBarOpen ? MainAxisAlignment.start : MainAxisAlignment.center,
        children: [
          isSideBarOpen ? SizedBox(width: 5,) :SizedBox(width: 6,) ,
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: HexColor('#F8C764').withOpacity(0.5),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ),
          ),

          isSideBarOpen
              ? FutureBuilder(
                  future: Future.delayed(Duration(milliseconds: 500)),
                  builder: (c, s) => s.connectionState == ConnectionState.done
                      ? Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                              width: 100,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text('Search',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                              )),
                        )
                      : Text(' '))
              : Text(' '),
        ],
      ),
    ],
  );
}
