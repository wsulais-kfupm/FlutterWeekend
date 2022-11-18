import 'package:flutter/material.dart';
import 'package:flutter_weekend/services/utils.dart';

import 'package:flutter_weekend/widgets/cons.dart';
import 'package:provider/provider.dart';

import '../components/custom_bubble.dart';
import '../provider/dark_theme_provider.dart';
import '../widgets/custom_card.dart';


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
    final Utils utils = Utils(context);
    final themeState = Provider.of<DarkThemeProvider>(context);
    bool _isDark = themeState.getDarkTheme;
    return Scaffold(
        backgroundColor: _isDark ? Theme.of(context).cardColor : Colors.white,
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
                                child: Image.asset(
                                    '',
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
                                padding: EdgeInsets.symmetric(horizontal: 15.0),
                                child: Text(
                                  'small description',
                                  style: kDescription,
                                ),
                              ),
                            ],
                          ),
                          onPress: () => {})
                    ],
                  ),
                ]),
          ),
        ));
  }
}