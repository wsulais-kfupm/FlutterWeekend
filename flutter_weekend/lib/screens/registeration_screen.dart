// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, unnecessary_null_comparison, avoid_print

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_weekend/components/rounter_button.dart';
import 'package:flutter_weekend/constants.dart';
import 'package:flutter_weekend/screens/home_screen.dart';
import 'package:flutter_weekend/screens/profile_screen.dart';
import 'package:flutter_weekend/screens/question_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

final _fireStore = FirebaseFirestore.instance;

class RegisterationScreen extends StatefulWidget {
  const RegisterationScreen({super.key});
  static const String id = 'register_screen';

  @override
  State<RegisterationScreen> createState() => _RegisterationScreenState();
}

class _RegisterationScreenState extends State<RegisterationScreen> {
  final _auth = FirebaseAuth.instance;
  String email = '';
  String password = '';
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: SizedBox(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black),
                onChanged: (value) {
                  email = value;
                },
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Enter Your Email'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black),
                onChanged: (value) {
                  password = value;
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
                onPressed: () async {
                  setState(
                    () {
                      showSpinner = true;
                    },
                  );
                  try {
                    final _auth = FirebaseAuth.instance;
                    final newUser = await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                    User currentUser = await _auth.currentUser!;
                    await _fireStore
                        .collection('users')
                        .doc(currentUser.uid)
                        .set({
                      'first_name': '',
                      'last_Name': '',
                      'preferences': []
                    });
                    if (newUser != null) {
                      Navigator.pushNamed(context, QuestionScreen.id);
                    }
                    setState(() {
                      showSpinner = false;
                    });
                  } catch (e) {
                    print(e);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
