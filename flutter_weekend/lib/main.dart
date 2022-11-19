import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_weekend/constants.dart';
import 'package:flutter_weekend/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_weekend/screens/login_screen.dart';
import 'package:flutter_weekend/screens/profile_screen.dart';
import 'package:flutter_weekend/screens/question_screen.dart';
import 'package:flutter_weekend/screens/welcome_screen.dart';
import 'firebase_options.dart';
import 'package:flutter_weekend/screens/map_screen.dart';
import 'package:flutter_weekend/screens/registeration_screen.dart';
// import 'package:winner/screens/profilePage.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.transparent,
        backgroundColor: kBackgroundColor,
        appBarTheme: const AppBarTheme(backgroundColor: kAppBarColor),
        canvasColor: kAppBarColor,
      ),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => const WelcomeScreen(),
        RegisterationScreen.id: (context) => const RegisterationScreen(),
        LoginScreen.id: (context) => const LoginScreen(),
        MapScreen.id: (context) => const MapScreen(),
        ProfileScreen.id: (context) => const ProfileScreen(),
        HomeScreen.id: (context) => const HomeScreen(),
        QuestionScreen.id: (context) => const QuestionScreen()
      },
    );
  }
}
