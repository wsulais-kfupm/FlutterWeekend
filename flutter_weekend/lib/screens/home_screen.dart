import 'package:flutter/material.dart';
import 'package:flutter_weekend/components/custom_card.dart';
import 'package:flutter_weekend/components/nav_bar.dart';
import 'package:flutter_weekend/constants.dart';

import '../components/custom_bubble.dart';

// TODO GET INTEREST FROM DB
// TODO GET EVENTS BASED ON INTEREST
// TODO INCLUDE MAPBOX TO FIND PLACES AND BUBBLE THEM
// TODO GET GOOGLE MAP API KEY
// TODO GET SPECIFIC PLACES ACCORDING TO LOCATION OR INTEREST
// TODO EXAMPLE SHOWN IN YELP CAMP USING JS

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 50),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CustomBubble(
                      containerContent: const Center(
                        child: Text(
                          'STUFF',
                          style: kTextButtonStyle,
                        ),
                      ),
                      onPress: () {},
                    ),
                    CustomBubble(
                      containerContent: const Center(
                        child: Text(
                          'STUFF',
                          style: kTextButtonStyle,
                        ),
                      ),
                      onPress: () {},
                    ),
                    CustomBubble(
                      containerContent: const Center(
                        child: Text(
                          'STUFF',
                          style: kTextButtonStyle,
                        ),
                      ),
                      onPress: () {},
                    ),
                    CustomBubble(
                      containerContent: const Center(
                        child: Text(
                          'STUFF',
                          style: kTextButtonStyle,
                        ),
                      ),
                      onPress: () {},
                    ),
                    CustomBubble(
                      containerContent: const Center(
                        child: Text(
                          'STUFF',
                          style: kTextButtonStyle,
                        ),
                      ),
                      onPress: () {},
                    ),
                  ],
                ),
              ),
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
                            child: Image.asset('images/MugiwaraOnigashima.png',
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
                          padding: EdgeInsets.symmetric(horizontal: 15.0),
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
                            child: Image.asset('images/MugiwaraOnigashima.png',
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
                          padding: EdgeInsets.symmetric(horizontal: 15.0),
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
                            child: Image.asset('images/MugiwaraOnigashima.png',
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
                          padding: EdgeInsets.symmetric(horizontal: 15.0),
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
    );
  }
}
