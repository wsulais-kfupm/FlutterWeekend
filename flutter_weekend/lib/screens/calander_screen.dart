import 'package:flutter/material.dart';
import 'package:flutter_weekend/components/nav_bar.dart';

class CalanderScreen extends StatefulWidget {
  const CalanderScreen({super.key});
  static const String id = 'calander_screen';

  @override
  State<CalanderScreen> createState() => _CalanderScreenState();
}

class _CalanderScreenState extends State<CalanderScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('HELLO HELLO'),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
