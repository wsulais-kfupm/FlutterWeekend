import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weekend/components/custom_card.dart';
import 'package:flutter_weekend/components/nav_bar.dart';
import 'package:flutter_weekend/constants.dart';

import '../components/custom_bubble.dart';

// TODO GET EVENTS BASED ON INTEREST
// TODO INCLUDE MAPBOX TO FIND PLACES AND BUBBLE THEM

final _fireStore = FirebaseFirestore.instance;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String id = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late User currentUser;
  final _auth = FirebaseAuth.instance;
  dynamic x;
  List<dynamic>? userPrefs;
  bool _loading = true;
  void getCurrentUser() async {
    final user = _auth.currentUser;
    if (user != null) {
      currentUser = user;
    }
    final dbRef =
        await _fireStore.collection('users').doc(currentUser.uid).get();
    userPrefs = dbRef['preferences'];
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
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.cyan,
        body: _loading
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 50),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 70,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: userPrefs!.length,
                          itemBuilder: (context, index) {
                            final item = userPrefs![index];

                            return CustomBubble(
                              containerContent: Center(
                                  child: Text(
                                item,
                                style: kTextButtonStyle,
                              )),
                              onPress: () {},
                            );
                          },
                        ),
                      )
                      // ListView(
                      //   scrollDirection: Axis.horizontal,
                      //   shrinkWrap: true,
                      //   children: userPrefs.forEach((String key) {
                      //     return CustomBubble(
                      //       containerContent: Center(
                      //         child: Text(
                      //           key,
                      //           style: kName,
                      //         ),
                      //       ),
                      //       value: prefs[key],
                      //       onChanged: (bool? value) {
                      //         setState(
                      //           () {
                      //             prefs[key] = value!;
                      //           },
                      //         );
                      //       },
                      //     );
                      //   }).toList(),
                      // ),
                      // SingleChildScrollView(
                      //   scrollDirection: Axis.horizontal,
                      //   child: Row(

                      //     children: [
                      //       CustomBubble(
                      //         containerContent: const Center(
                      //           child: Text(
                      //             'STUFF',
                      //             style: kTextButtonStyle,
                      //           ),
                      //         ),
                      //         onPress: () {},
                      //       ),
                      //       CustomBubble(
                      //         containerContent: const Center(
                      //           child: Text(
                      //             'STUFF',
                      //             style: kTextButtonStyle,
                      //           ),
                      //         ),
                      //         onPress: () {},
                      //       ),
                      //       CustomBubble(
                      //         containerContent: const Center(
                      //           child: Text(
                      //             'STUFF',
                      //             style: kTextButtonStyle,
                      //           ),
                      //         ),
                      //         onPress: () {},
                      //       ),
                      //       CustomBubble(
                      //         containerContent: const Center(
                      //           child: Text(
                      //             'STUFF',
                      //             style: kTextButtonStyle,
                      //           ),
                      //         ),
                      //         onPress: () {},
                      //       ),
                      //       CustomBubble(
                      //         containerContent: const Center(
                      //           child: Text(
                      //             'STUFF',
                      //             style: kTextButtonStyle,
                      //           ),
                      //         ),
                      //         onPress: () {},
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      ,
                      const SizedBox(
                        height: 20.0,
                      ),
                      Column(
                        children: [
                          CustomCard(
                            containerContent: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                ClipRRect(
                                  borderRadius:
                                      BorderRadius.circular(30), // Image border
                                  child: SizedBox.fromSize(
                                    child: Image.asset(
                                        'images/MugiwaraOnigashima.png',
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(15.0),
                                  child: Text(
                                    'NAME OF THE THING',
                                    style: kName,
                                  ),
                                ),
                                const Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 15.0),
                                  child: Text(
                                    'small description',
                                    style: kDescription,
                                  ),
                                ),
                              ],
                            ),
                            onPress: () => {},
                          ),
                          CustomCard(
                            containerContent: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                ClipRRect(
                                  borderRadius:
                                      BorderRadius.circular(30), // Image border
                                  child: SizedBox.fromSize(
                                    child: Image.asset(
                                        'images/MugiwaraOnigashima.png',
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(15.0),
                                  child: Text(
                                    'NAME OF THE THING',
                                    style: kName,
                                  ),
                                ),
                                const Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 15.0),
                                  child: Text(
                                    'small description',
                                    style: kDescription,
                                  ),
                                ),
                              ],
                            ),
                            onPress: () => {},
                          ),
                          CustomCard(
                            containerContent: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                ClipRRect(
                                  borderRadius:
                                      BorderRadius.circular(30), // Image border
                                  child: SizedBox.fromSize(
                                    child: Image.asset(
                                        'images/MugiwaraOnigashima.png',
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(15.0),
                                  child: Text(
                                    'NAME OF THE THING',
                                    style: kName,
                                  ),
                                ),
                                const Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 15.0),
                                  child: Text(
                                    'small description',
                                    style: kDescription,
                                  ),
                                ),
                              ],
                            ),
                            onPress: () => {},
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
        bottomNavigationBar: const BottomNavBar(),
      ),
    );
  }
}
