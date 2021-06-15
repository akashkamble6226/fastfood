import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Widget filterWidget(bool isSideBarOpen) {
  return Row(
    mainAxisAlignment:
        isSideBarOpen ? MainAxisAlignment.start : MainAxisAlignment.center,
    children: [
      SizedBox(
        width: 10,
      ),
      Container(
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: HexColor('#F8C764').withOpacity(0.5),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
              child: Container(
            height: 12,
            child: Image.asset(
              'assets/images/filter.png',
              fit: BoxFit.contain,
            ),
          )),
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
                            child: Text('Filter',
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

/*


 
 
 */
