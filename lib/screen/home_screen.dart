import 'dart:math';

import 'package:flight_app/responsive/mobile_screen_layout.dart';
import 'package:flight_app/responsive/responsive_layout_screen.dart';
import 'package:flight_app/responsive/web_screen_layout.dart';
import 'package:flight_app/screen/login_screen.dart';
import 'package:flight_app/screen/search_screen.dart';
import 'package:flight_app/utils/colors.dart';
import 'package:flight_app/widgets/text_field_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  String value = "Economy";
  List listItem = ["Economy", "Business", "First Class"];
  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _passengerController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  bool date = false;
  var month = [
    "Jan",
    "Feb",
    "March",
    "April",
    "May",
    "June",
    "July",
    "Aug",
    "Sept",
    "Oct",
    "Nov",
    "Dec"
  ];
  bool roundTrip = true, oneWay = false, multiCity = false;
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    void setTrip(int i) {
      setState(() {
        if (i == 1) {
          roundTrip = true;
          oneWay = false;
          multiCity = false;
        } else if (i == 2) {
          roundTrip = false;
          oneWay = true;
          multiCity = false;
        } else {
          roundTrip = false;
          oneWay = false;
          multiCity = true;
        }
      });
    }

    @override
    void dispose() {
      super.dispose();
      _fromController.dispose();
      _toController.dispose();
      _dateController.dispose();
      _passengerController.dispose();
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(children: [
        Container(
          color: primaryColor,
        ),
        Container(
            height: screenHeight * 0.45,
            width: screenWidth,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/Vector.png"),
                  fit: BoxFit.contain,
                  scale: 1.5,
                  alignment: AlignmentDirectional(1, -0.5)),
              color: primaryBlueText,
              borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(55),
                  bottomLeft: Radius.circular(55)),
            )),
        Positioned(
          top: screenHeight * 0.03,
          right: screenWidth * 0.20,
          child: Container(
            height: screenHeight * 0.20,
            width: screenWidth * 0.55,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/Group.png"),
                    fit: BoxFit.contain)),
          ),
        ),
        Positioned(
          top: screenHeight * 0.18,
          left: screenWidth * 0.05,
          child: Container(
            child: Text(
              "Book Your \nFlight",
              style: TextStyle(
                color: primaryColor,
                fontSize: 55,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Positioned(
          top: screenHeight * 0.35,
          left: screenWidth * 0.02,
          child: Row(
            children: [
              InkWell(
                onTap: () => setTrip(1),
                child: Container(
                  width: screenWidth * 0.33,
                  child: Center(
                    child: Text("Round Trip",
                        style: TextStyle(
                          color: roundTrip ? primaryColor : secondaryColor,
                          fontSize: 18,
                        )),
                  ),
                ),
              ),
              InkWell(
                onTap: () => setTrip(2),
                child: Container(
                  width: screenWidth * 0.33,
                  child: Center(
                    child: Text("One Way",
                        style: TextStyle(
                          color: oneWay ? primaryColor : secondaryColor,
                          fontSize: 18,
                        )),
                  ),
                ),
              ),
              InkWell(
                onTap: () => setTrip(3),
                child: Container(
                  width: screenWidth * 0.33,
                  child: Center(
                    child: Text("Multi City",
                        style: TextStyle(
                          color: multiCity ? primaryColor : secondaryColor,
                          fontSize: 18,
                        )),
                  ),
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: screenHeight * 0.42,
          // left: screenWidth * 0.07,
          
          child: Container(
            width: screenWidth,
            child: Center(
              child: Container(
                  // height: screenHeight * 0.42,
                  width: screenWidth * 0.83,
                  // color: primaryColor,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      boxShadow: [
                        BoxShadow(
                            color: secondaryColor, spreadRadius: 2, blurRadius: 5)
                      ],
                      borderRadius: const BorderRadius.all(Radius.circular(55))),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 55,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: primaryBlueText, width: 2),
                                borderRadius: BorderRadius.circular(25)),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 6.0),
                                child: TextFieldInput(
                                  textEditingController: _fromController,
                                  hint: 'From',
                                  textInputType: TextInputType.text,
                                  font: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 55,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: primaryBlueText, width: 2),
                                borderRadius: BorderRadius.circular(25)),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 6.0),
                                child: TextFieldInput(
                                  textEditingController: _toController,
                                  hint: 'To',
                                  textInputType: TextInputType.text,
                                  font: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 55,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: primaryBlueText, width: 2),
                                borderRadius: BorderRadius.circular(25)),
                            child: Center(
                              child: InkWell(
                                onTap: () {
                                  showCupertinoModalPopup(
                                      context: context,
                                      builder: (BuildContext context) => SizedBox(
                                            height: 255,
                                            child: CupertinoDatePicker(
                                                backgroundColor: primaryBlueText,
                                                initialDateTime: selectedDate,
                                                mode: CupertinoDatePickerMode.date,
                                                onDateTimeChanged:
                                                    (DateTime newTime) {
                                                  setState(
                                                    () {
                                                      selectedDate = newTime;
                                                    },
                                                  );
                                                }),
                                          ));
                                  setState(() {
                                    date = true;
                                  });
                                },
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: !date
                                      ? Text(
                                          "   Select Date",
                                          style: TextStyle(
                                            color: primaryBlueText,
                                            fontSize: 20,
                                          ),
                                        )
                                      : Text(
                                          "    ${selectedDate.day}, ${month[selectedDate.month - 1]} ${selectedDate.year}",
                                          style: TextStyle(
                                            color: primaryBlueText,
                                            fontSize: 20,
                                          ),
                                        ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 2),
                                  child: Container(
                                      alignment: Alignment.centerLeft,
                                      // padding:const EdgeInsets.only(right: 2),
                                      height: 55,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: primaryBlueText, width: 2),
                                          borderRadius: BorderRadius.circular(25)),
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 6.0),
                                        child: TextFieldInput(
                                          textEditingController:
                                              _passengerController,
                                          hint: 'Travellers',
                                          textInputType: TextInputType.number,
                                          font: 20,
                                        ),
                                      )),
                                ),
                              ),
                              Expanded( 
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 2),
                                  child: Container(
                                      // height: 55,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: primaryBlueText, width: 2),
                                          borderRadius: BorderRadius.circular(25)),
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10.0),
                                          child: DropdownButton(
                                            icon: const Icon(
                                                Icons.arrow_drop_down_outlined),
                                            iconEnabledColor: primaryBlueText,
                                            underline: Container(
                                              color: primaryColor,
                                              height: 0,
                                            ),
                                            elevation: 10,
                                            dropdownColor: primaryColor,
                                            value: value,
                                            style: TextStyle(
                                              color: primaryBlueText,
                                              fontSize: 20,
                                            ),
                                            onChanged: (newValue) {
                                              setState(() {
                                                if (newValue != null)
                                                  value = newValue.toString();
                                              });
                                            },
                                            items: listItem.map((valueItem) {
                                              return DropdownMenuItem(
                                                value: valueItem,
                                                child: Text(valueItem),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () => {
                              Navigator.of(context).push(
                                
                                  MaterialPageRoute(
                                      builder: (context) => const SearchScreen()))
                            },
                            child: Container(
                              // color: primaryPrice,
                              height: 55,
                              decoration: BoxDecoration(
                                  color: primaryPrice,
                                  border: Border.all(color: primaryPrice, width: 2),
                                  borderRadius: BorderRadius.circular(25)),
                              child: Center(
                                child: Padding(
                                    padding: const EdgeInsets.only(left: 6.0),
                                    child: Text(
                                      "Search Flights",
                                      style: TextStyle(
                                          color: primaryColor, fontSize: 18),
                                    )),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
          ),
        ),
        Positioned(
            bottom: 0,
            // left: 0,
            child: Container(
              height: 75,
              width: screenWidth,
              decoration: BoxDecoration(
                  color: primaryBlueText,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(55),
                      topLeft: Radius.circular(55))),
              child: Row(children: [
                Expanded(
                    child: InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/home.png"),
                            fit: BoxFit.contain)),
                  ),
                )),
                Expanded(
                    child: InkWell(
                     onTap:  () => {
                          Navigator.of(context).push(
                            
                              MaterialPageRoute(
                                  builder: (context) => const SearchScreen()))
                        },
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
