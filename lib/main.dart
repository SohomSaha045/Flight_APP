import 'package:firebase_auth/firebase_auth.dart';
import 'package:flight_app/screen/login_screen.dart';
import 'package:flight_app/screen/signup_screen.dart';
import 'package:flutter/foundation.dart';

import 'firebase_options.dart';
import 'package:flight_app/responsive/responsive_layout_screen.dart';
import 'package:flutter/material.dart';
import './utils/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import './responsive/mobile_screen_layout.dart';
import './responsive/web_screen_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "",
          appId: "1:696943933969:web:3bb47578470cca02f54fb0",
          messagingSenderId: "696943933969",
          projectId: "flight-app-80866",
          storageBucket: "flight-app-80866.appspot.com"),
    );
  } else {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flight App',
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: primaryColor),
      home: StreamBuilder(
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                return const ResponsiveLayout(
                  mobileScreenLayout: MobileScreenLayout(),
                  webScreenLayout: WebScreenLayout(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('${snapshot.error}'),
                );
              }
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: primaryBlueText,
                ),
              );
            }
            return const LoginScreen();
          },
          stream: FirebaseAuth.instance.authStateChanges()),
      // home: const ResponsiveLayout(
      //   mobileScreenLayout: MobileScreenLayout(),
      //   webScreenLayout: WebScreenLayout(),
      // ),
    );
  }
}
