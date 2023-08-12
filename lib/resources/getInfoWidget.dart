import 'dart:math';

import 'package:flight_app/resources/data.dart';
import 'package:flight_app/widgets/info_card.dart';
import 'package:flutter/material.dart';

List<Widget> getFlightInfo() {
  List<dynamic> responseList = data;
  List<Widget> list = [];
  responseList.forEach((element) {
    list.add(Items(name: element["name"],image: element["logoUrl"],price: element["price"],departure: element["depart"],arrival: element["arrive"],
    timeH: element["d_hr"],timeM: element["d_min"],));
  });
  // "name":"Air India",
  // "logoUrl":"airIndia.png",
  // "price":"126",
  // "depart":"10:15",
  // "arrive":"12:30",
  // "d_hr":"2",
  // "d_min":"30",
  
  return list;
}
