// ignore_for_file: prefer_const_constructors


import 'package:flutter/material.dart';
import 'package:flutter_weekend/components/rounter_button.dart';
import 'package:flutter_weekend/constants.dart';

class RegisterationScreen extends StatefulWidget {
  const RegisterationScreen({super.key});
  static const String id = 'register_screen';

  @override
  State<RegisterationScreen> createState() => _RegisterationScreenState();
}

class _RegisterationScreenState extends State<RegisterationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Hero(
            //   tag: 'logo',
            //   child: SizedBox(
            //     height: 200.0,
            //     child: Image.asset('images/logo.png'),
            //   ),
            // ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
                onChanged: (value) {
                  //Do something with the user input.
                },
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Enter Your Email')
                ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              onChanged: (value) {
                //Do something with the user input.
              },
              decoration: kTextFieldDecoration.copyWith(
                hintText: 'Enter Your Password',
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            Roundedbutton(
              color: Colors.blueAccent,
              title: 'Register',
              onPressed: () => {},
            ),
          ],
        ),
      ),
    );
  }
}
