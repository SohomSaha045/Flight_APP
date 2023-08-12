import 'dart:math';

import 'package:flight_app/responsive/mobile_screen_layout.dart';
import 'package:flight_app/responsive/responsive_layout_screen.dart';
import 'package:flight_app/responsive/web_screen_layout.dart';
import 'package:flight_app/screen/login_screen.dart';
import 'package:flight_app/utils/colors.dart';
import 'package:flight_app/widgets/text_field_input.dart';
import 'package:flutter/material.dart';

import '../resources/authentication.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });

    String res = await AuthMethods().signupUser(
        email: _emailController.text,
        password: _passwordController.text,
        name: _nameController.text);
    print(res);
    setState(() {
      _isLoading = false;
    });
    if (res != 'success') {
      final snackBar = SnackBar(content: Text(res));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const ResponsiveLayout(
              webScreenLayout: WebScreenLayout(),
              mobileScreenLayout: MobileScreenLayout())));
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void navigateToLogin() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: ListView(
      padding: EdgeInsets.zero,
      children: [
        Container(
          height: screenHeight * 0.40,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/Vector.png"),
                fit: BoxFit.fitWidth,
                scale: 1,
                alignment: AlignmentDirectional(1, -1)),
            color: primaryBlueText,
            borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(50),
                bottomLeft: Radius.circular(50)),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 100, 0, 0),
            child: Center(
              child: Text(
                "WELCOME TO FAPP",
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: screenHeight * 0.05,
        ),
        Card(
          // borderOnForeground: f,
          margin: EdgeInsets.all(16),
          color: primaryColor,
          shadowColor: secondaryColor,
          elevation: 25,

          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Center(
                      child: Text(
                    "Sign Up",
                    style: TextStyle(
                        color: primaryBlueText,
                        fontSize: 40,
                        fontWeight: FontWeight.w500),
                  )),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: primaryBlueText, width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    child: TextFieldInput(
                        textEditingController: _nameController,
                        hint: 'Enter your Name',
                        textInputType: TextInputType.text),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: primaryBlueText, width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    child: TextFieldInput(
                        textEditingController: _emailController,
                        hint: 'Enter your Email',
                        textInputType: TextInputType.emailAddress),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: primaryBlueText, width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    child: TextFieldInput(
                      textEditingController: _passwordController,
                      hint: 'Enter your Password',
                      textInputType: TextInputType.emailAddress,
                      isPass: true,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: signUpUser,
                  child: _isLoading
                      ? Center(
                          child: const CircularProgressIndicator(
                            color: primaryBlueText,
                          ),
                        )
                      : Container(
                          padding: const EdgeInsets.all(8.0),
                          // color: primaryBlueText,
                          decoration: BoxDecoration(
                              color: primaryBlueText,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25))),

                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: const Text(
                              'Submit',
                              style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an Account?",
                          style: TextStyle(
                              color: primaryBlueText,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                        GestureDetector(
                          onTap: navigateToLogin,
                          child: Container(
                            child: Text(
                              '  Log In',
                              style: TextStyle(
                                color: primaryBlueText,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
