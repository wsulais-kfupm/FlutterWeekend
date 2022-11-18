import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_weekend/constants.dart';
import 'package:flutter_weekend/screens/home_screen.dart';
import 'package:flutter_weekend/screens/map_screen.dart';
// import 'package:winner/screens/profilePage.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        backgroundColor: kBackgroundColor,
        // scaffoldBackgroundColor: kBackgroundColor,
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: const AppBarTheme(backgroundColor: kAppBarColor),
        canvasColor: kAppBarColor,
      ),
      home: const MapScreen(),
    );
  }
}
