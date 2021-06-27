import 'package:flutter/material.dart';

Widget fastFoodItem(
    bool isSideBarOpen, String name, String imgPath) {
  return  Row(
      
      mainAxisAlignment:
          isSideBarOpen ? MainAxisAlignment.start : MainAxisAlignment.center,
      children: [

         SizedBox(
        width: 10,
      ),
        Image.asset(
          imgPath,
          width: 30,
          height: 30,
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
                              child: Text(name,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                            )),
                      )
                    : Text(' '))
            : Text(' '),
        
      ],
    
  );
}
