// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:animated_text_kit/animated_text_kit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_weekend/components/rounter_button.dart';
import 'package:flutter_weekend/screens/login_screen.dart';
import 'package:flutter_weekend/screens/registeration_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});
  static const String id = 'welcome_screen';

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
      upperBound: 1,
    );
    animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);
    controller.forward();
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: <Widget>[
                Flexible(
                  child: Hero(
                    tag: 'logo',
                    child: Container(
                      height: 60.0,
                      child: Image.asset('images/logo.png'),
                    ),
                  ),
                ),
                AnimatedTextKit(
                    pause: Duration(milliseconds: 1000),
                    repeatForever: true,
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'FlutterWeekend',
                        textStyle: TextStyle(
                            fontSize: 45.0,
                            fontWeight: FontWeight.w900,
                            color: Colors.black),
                        speed: Duration(milliseconds: 150),
                      )
                    ]),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            Roundedbutton(
              color: Colors.lightBlueAccent,
              title: 'Log In',
              onPressed: (() => Navigator.pushNamed(context, LoginScreen.id)),
            ),
            Roundedbutton(
              color: Colors.blueAccent,
              title: 'Register',
              onPressed: (() =>
                  Navigator.pushNamed(context, RegisterationScreen.id)),
            ),
          ],
        ),
      ),
    );
  }
}
