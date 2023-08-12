// import 'dart:html';
import 'dart:math';

import 'package:flight_app/resources/data.dart';
import 'package:flight_app/widgets/info_card.dart';
import 'package:flutter/material.dart';

import 'package:flight_app/responsive/mobile_screen_layout.dart';
import 'package:flight_app/responsive/responsive_layout_screen.dart';
import 'package:flight_app/responsive/web_screen_layout.dart';
import 'package:flight_app/screen/login_screen.dart';
import 'package:flight_app/utils/colors.dart';
import 'package:flight_app/widgets/text_field_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../resources/getInfoWidget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    List<dynamic> responseList = data;
    bool _isLoading = false;
    // List<Widget> Data = [];
    int size = 12;
    @override
    void initState() {
      super.initState();
      setState(() {
        _isLoading = true;
      });
      setState(() {
        // Data = getFlightInfo();
        // log(Data.length);
        // responseList = data;
        size = data.length + 1;
        // log(data.length);
      });

      setState(() {
        _isLoading = false;
      });
    }

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(children: [
        Container(
          color: primaryColor,
        ),
        Container(
            height: screenHeight * 0.40,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/Vector.png"),
                  fit: BoxFit.fitHeight,
                  scale: 1.5,
                  alignment: AlignmentDirectional(1, -0.5)),
              color: primaryBlueText,
              borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25)),
            )),
        Positioned(
          top: screenHeight * 0.06,
          child: Center(
            child: Container(
              alignment: Alignment(0, 0),
              width: screenWidth,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Search Result",
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 22,
                    // fontFamily: ,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: screenHeight * 0.125,
          // right: 0,

          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              alignment: Alignment.center,
              height: screenHeight * 0.11,
              width: screenWidth,
              decoration: BoxDecoration(
                image: DecorationImage(
                  //  scale: 0.7,
                  image: AssetImage("assets/Group-transformed.png"),
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
          ),
          // transform: ,
        ),
        Positioned(
          top: screenHeight * 0.25,
          right: 0,
          child: Center(
            child: Container(
              // decoration: BoxDecoration(
              //  border: Border.all(
              //   width: 1,
              //   color: Colors.white
              //  )
              // ),
              height: screenWidth * 0.10,
              alignment: Alignment(0, 0),
              width: screenWidth,
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 50.0),
                      child: Container(
                        alignment: AlignmentDirectional.topCenter,
                        child: Text("JS",
                            style: TextStyle(
                              color: primaryColor,
                              fontSize: 32,
                              // fontFamily: ,
                              fontWeight: FontWeight.w900,
                            )),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 50.0),
                      child: Container(
                        alignment: AlignmentDirectional.topCenter,
                        child: Text("IND",
                            style: TextStyle(
                              color: primaryColor,
                              fontSize: 32,
                              // fontFamily: ,
                              fontWeight: FontWeight.w900,
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: screenHeight * 0.33,
          child: Center(
            child: Container(
              alignment: Alignment(0, 0),
              width: screenWidth,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "$size Flights Available",
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 16,
                    // fontFamily: ,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
            top: screenHeight * 0.40,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Container(
                height: screenHeight * 0.525,
                width: screenWidth * 0.90,
                // color: Colors.black,
                child: Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: ListView.builder(
                    itemCount: responseList.length,
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return Items(
                          name: responseList[index]["name"],
                          image: responseList[index]["logoUrl"],
                          price: responseList[index]["price"],
                          departure: responseList[index]["depart"],
                          arrival: responseList[index]["arrive"],
                          timeH: responseList[index]["d_hr"],
                          timeM: responseList[index]["d_min"]);
                    },
                  ),
                ),
              ),
            )),
        Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              height: 75,
              width: screenWidth,
              decoration: BoxDecoration(
                  color: primaryBlueText,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(50),
                      topLeft: Radius.circular(50))),
              child: Row(children: [
                Expanded(
                    child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/home.png"),
                            fit: BoxFit.contain)),
                  ),
                )),
                Expanded(
                    child: InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/search.png"),
                            fit: BoxFit.contain)),
                  ),
                ))
              ]),
            ))
      ]),
    );
  }
}
