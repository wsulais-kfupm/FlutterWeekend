// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weekend/components/rounded_button.dart';
import 'package:flutter_weekend/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_weekend/screens/home_screen.dart';

final _fireStore = FirebaseFirestore.instance;

Map<String, bool> prefs = {
  'Tech': false,
  'bowling_alley': false,
  'cafe': false,
  'bakery': false,
  'supermarket': false,
  'convenience_store': false,
  'florist': false,
  'library': false,
  'book_store': false,
  'mosque': false,
  'movie_theater': false,
  'museum': false,
  'restaurant': false,
  'shopping_mall': false,
  'home_goods_store': false,
  'jewelry_store': false,
  'grocery_or_supermarket': false,
  'lodging': false,
  'beauty_salon': false,
  'spa': false,
  'gym': false,
  'food': false,
  'veterinary_care': false,
  'clothing_store': false,
  'furniture_store': false,
  'store': false,
  'electronics_store': false,
  'health': false,
  'pet_store': false,
};

List<dynamic> userPrefs = [];

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});
  static const String id = 'question_screen';

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  TextEditingController controller = TextEditingController();
  final _auth = FirebaseAuth.instance;
  String? firstName;
  String? lastName;
  late String uid;
  bool showSpinner = false;
  late User currentUser;
  bool _loading = true;
  void getCurrentUser() async {
    final user = _auth.currentUser;
    if (user != null) {
      currentUser = user;
      uid = currentUser.uid;
    }
    await _fireStore.collection('users').doc(uid).set(
      {'preferences': []},
      SetOptions(
        merge: true,
      ),
    );
    final current = await _fireStore.collection('users').doc(uid).get();

    firstName = current['first_name'] ?? '';
    lastName = current['last_name'] ?? '';
    userPrefs = current['preferences'] ?? [];

    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    getCurrentUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: _loading
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Flexible(
                      child: Hero(
                        tag: 'logo',
                        child: SizedBox(
                          height: 200.0,
                          child: Image.asset('images/logo.png'),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 48.0,
                    ),
                    TextFormField(
                      initialValue: firstName,
                      keyboardType: TextInputType.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white),
                      onChanged: (value) {
                        firstName = value;
                      },
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: 'First Name',
                        hintStyle: const TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      initialValue: lastName,
                      keyboardType: TextInputType.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white),
                      onChanged: (value) {
                        lastName = value;
                      },
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Last Name',
                        hintStyle: const TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Preferences: ',
                        style: kName,
                      ),
                    ),
                    SizedBox(
                      height: 250,
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        physics: const AlwaysScrollableScrollPhysics(),
                        children: prefs.keys.map((String key) {
                          return CheckboxListTile(
                            title: Text(
                              key,
                              style: kName,
                            ),
                            value: prefs[key],
                            onChanged: (bool? value) {
                              setState(
                                () {
                                  prefs[key] = value!;
                                },
                              );
                            },
                          );
                        }).toList(),
                      ),
                    ),
                    Roundedbutton(
                      color: Colors.blueAccent,
                      title: 'Submit',
                      onPressed: () async {
                        prefs.entries.forEach((element) {
                          if (element.value) {
                            userPrefs.add(element.key);
                          }
                        });
                        setState(() {
                          showSpinner = true;
                        });
                        try {
                          _fireStore.collection('users').doc(uid).set({
                            'first_name': firstName ?? 'Random!',
                            'last_name': lastName ?? 'Random!',
                            'preferences': userPrefs
                          });
                          setState(() {
                            showSpinner = false;
                          });
                          Navigator.pushNamed(context, HomeScreen.id);
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



// 10 HOw close
// 20 UI/UX
// 20 Idea visibility
// 20 Final presentation
// 30 Live demo 

