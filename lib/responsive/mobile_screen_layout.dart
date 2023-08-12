import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flight_app/screen/home_screen.dart';
import 'package:flight_app/screen/search_screen.dart';
import 'package:flight_app/utils/colors.dart';
import 'package:flutter/material.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({super.key});

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  String username = "hu";
  @override
  @override
  void initState() {
    super.initState();
    getUserName();
  }

  void getUserName() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    // print(snap.data());
    // setState(() {
    //   username = (snap.data() as Map<String, dynamic>)['username'];
    // });
  }

  Widget build(BuildContext context) {
    // return SearchScreen();
    return homeScreen();
  }
}
