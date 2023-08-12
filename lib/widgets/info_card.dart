import 'package:flutter/material.dart';

import '../utils/colors.dart';

class Items extends StatelessWidget {
  final String name;
  final String image;
  final String price;
  final String departure;
  final String arrival;
  final String timeH;
  final String timeM;
  const Items(
      {super.key,
      required this.name,
      required this.image,
      required this.price,
      required this.departure,
      required this.arrival,
      required this.timeH,
      required this.timeM});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          // height: 100,
          padding: EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
              color: primaryColor,
              // border: Border.all(color: primaryColor, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(25)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  // offset: Offset(0, 3), // changes position of shadow
                ),
              ]),

          // color: primaryPrice,

          child: Column(children: [
            
            Row(
              children: [
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      "$name",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 27,
                        color: primaryBlueText,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Image.asset("assets/$image",height: 80,),
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      "₹$price",
                      style: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.w700,
                        color: primaryPrice,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Column(
                    children: [
                      Text(
                        "Depart",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 22,
                          color: primaryGrey,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 6.0),
                        child: Text("$departure",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 25,
                              color: primaryBlueText,
                            )),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: primaryGrey, width: 2),
                        borderRadius: BorderRadius.circular(50)),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text("${timeH}H, ${timeM}M",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                              color: primaryGrey,
                            )),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Column(
                    children: [
                      Text(
                        "Arrive",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 22,
                          color: primaryGrey,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 6.0),
                        child: Text("$arrival",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 25,
                              color: primaryBlueText,
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text("View More",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 23,
                    color: primaryBlueText,
                  )),
            ),
            SizedBox(
              height: 20,
            ),
          ])
          // ;
          ),
    );
  }
}
