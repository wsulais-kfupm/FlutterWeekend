// import 'package:flutter/material.dart';
// import 'package:flutter_weekend/misc/dark_provider.dart';
// import 'package:flutter_weekend/screens/calander_screen.dart';
// import 'package:flutter_weekend/screens/home_screen.dart';
// import 'package:flutter_weekend/screens/map_screen.dart';
// import 'package:flutter_weekend/screens/profile_screen.dart';
// import 'package:iconly/iconly.dart';
// import 'package:provider/provider.dart';

// class BottomBar extends StatefulWidget {
//   const BottomBar({Key? key}) : super(key: key);

//   @override
//   State<BottomBar> createState() => _BottomBarState();
// }

// class _BottomBarState extends State<BottomBar> {
//   static int _selectedIndex = 0;
//   static reset() {
//     _selectedIndex = 0;
//   }
//   // int _selectedIndex = 0;
//   // final List<Map<String, dynamic>> _pages = [
//   //   {
//   //     'page': const HomeScreen(),
//   //     'title': 'Home Screen',
//   //   },
//   //   {
//   //     'page': const CalanderScreen(),
//   //     'title': 'Calander Screen',
//   //   },
//   //   {
//   //     'page': const MapScreen(),
//   //     'title': 'Cart Screen',
//   //   },
//   //   {
//   //     'page': const ProfileScreen(),
//   //     'title': 'User Screen',
//   //   },
//   // ];
//   // void _selectedPage(int index) {
//   //   setState(() {
//   //     _selectedIndex = index;
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     final themeState = Provider.of<DarkThemeProvider>(context);
//     bool _isDark = themeState.getDarkTheme;
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: Text( _pages[_selectedIndex]['title']),
//       // ),
//       body: _pages[_selectedIndex]['page'],
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: _isDark ? Theme.of(context).cardColor : Colors.white,
//         type: BottomNavigationBarType.fixed,
//         showSelectedLabels: false,
//         showUnselectedLabels: false,
//         currentIndex: _selectedIndex,
//         unselectedItemColor: _isDark ? Colors.white10 : Colors.black12,
//         selectedItemColor: _isDark ? Colors.lightBlue.shade200 : Colors.black87,
//         onTap: _selectedPage,
//         items: <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon:
//                 Icon(_selectedIndex == 0 ? IconlyBold.home : IconlyLight.home),
//             label: "Home",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(_selectedIndex == 1
//                 ? IconlyBold.calendar
//                 : IconlyLight.calendar),
//             label: "Calender",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(_selectedIndex == 2
//                 ? IconlyBold.location
//                 : IconlyLight.location),
//             label: "Location",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//                 _selectedIndex == 3 ? IconlyBold.user_2 : IconlyLight.user_1),
//             label: "Profile",
//           ),
//         ],
//       ),
//     );
//   }
// }
