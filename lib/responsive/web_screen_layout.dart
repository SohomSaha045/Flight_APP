import 'package:flutter/material.dart';

import '../utils/colors.dart';

class WebScreenLayout extends StatelessWidget {
  const WebScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Center(child: Text('This is web',style: TextStyle(color: primaryBlueText))),
    );
  }
}