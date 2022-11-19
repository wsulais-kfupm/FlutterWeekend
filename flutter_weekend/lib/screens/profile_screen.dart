// import 'package:cloud_firestore/cloud_firestore.dart';)
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weekend/components/card2_bubble.dart';
import 'package:flutter_weekend/components/nav_bar.dart';
import 'package:flutter_weekend/constants.dart';
import 'package:flutter_weekend/misc/custom_route.dart';
import 'package:flutter_weekend/screens/question_screen.dart';
import 'package:flutter_weekend/screens/welcome_screen.dart';

// final _fireStore = FirebaseFirestore.instance;
late User currentUser;
final _fireStore = FirebaseFirestore.instance;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  static const String id = 'profile_screen';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _auth = FirebaseAuth.instance;
  dynamic x;
  String? name;
  bool _loading = true;
  void getCurrentUser() async {
    final user = _auth.currentUser;
    if (user != null) {
      currentUser = user;
    }
    final dbRef =
        await _fireStore.collection('users').doc(currentUser.uid).get();
    name =
        '${dbRef['first_name'] ?? 'Random!'} ${dbRef['last_name'] ?? 'Random!'}';
    setState(() {
      _loading = false;
    });
    // final ref = FirebaseDatabase.instance.ref();
    // final snapshot = await ref.child('users/${currentUser.uid}').get();
    // if (snapshot.exists) {
    //   print(snapshot.value);
    // } else {
    //   print('No data available.');
    // }
  }

  logout() {
    BottomNavBar.reset();
    Navigator.pushReplacement(
        context,
        CustomRoute(
            child: const WelcomeScreen(), direction: AxisDirection.left));
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
        backgroundColor: Colors.white,
        body: _loading
            ? const Center(child: CircularProgressIndicator())
            : Center(
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        iconSize: 45,
                        icon: const Icon(Icons.settings_applications),
                        color: Colors.black,
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              CustomRoute(
                                  child: const QuestionScreen(),
                                  direction: AxisDirection.left));
                        },
                      ),
                      IconButton(
                        iconSize: 45,
                        color: Colors.black,
                        icon: const Icon(Icons.logout),
                        onPressed: () {
                          _auth.signOut();
                          logout();
                        },
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundImage: AssetImage('images/default.png'),
                      // backgroundColor: Colors.blue,
                      radius: 100,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    '$name',
                    style: kInputStyle,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    height: 200,
                    width: 350,
                    child: ListView.builder(
                        itemCount: 5,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return CardWidget(
                              onPress: () => {},
                              containerContent: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Text('I WAS HERE!', style: kDescription)
                                ],
                              ));
                        }),
                  ),
                ]),
              ),
        bottomNavigationBar: const BottomNavBar(),
      ),
    );
  }
}
    // );]
      // backgroundColor: Colors.amber,
      // body: Center(
      //   child: _loading ? const CircularProgressIndicator() : Column(
      //     children: [
      //       Text('$name'),
      //     ],
      //   ),
        // child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        //   SizedBox(
        //     child: FutureBuilder(
        //       future: dbRef.get(),
        //       builder: (BuildContext context, snapshot) {
        //         if (snapshot.data != null && snapshot.hasData) {
        //           dynamic x = snapshot.data!;

        //           return Center(
        //             child: Text(
        //               x['first_name'],
        //               style: kDescription,
        //             ),
        //           );
        //         } else if (snapshot.connectionState ==
        //             ConnectionState.waiting) {
        //           return const Center(
        //             child: CircularProgressIndicator(),
        //           );
        //         } else if (snapshot.hasError) {
        //           return const Text(
        //             'no data',
        //             style: kDescription,
        //           );
        //         }
        //         return const CircularProgressIndicator();
        //       },
        //     ),
        //   )
        // ]),
//       ),
//       bottomNavigationBar: const BottomNavBar(),
//     );
//   }
// }

// class profileScreen extends StatefulWidget {
//   const profileScreen({Key? key}) : super(key: key);

//   @override
//   State<profileScreen> createState() => _profileScreenState();
// }

// class _profileScreenState extends State<profileScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final Utils utils = Utils(context);
//     final themeState = Provider.of<DarkThemeProvider>(context);
//     bool _isDark = themeState.getDarkTheme;
//     return Scaffold(
//       backgroundColor: _isDark ? Theme.of(context).cardColor : Colors.white,
//         body: Center(
//       child: Column(
        
//         children: [
//           SwitchListTile(
//                 secondary: Icon(themeState.getDarkTheme
//                     ? Icons.dark_mode_outlined
//                     : Icons.light_mode_outlined),
//                 onChanged: (bool value) {
//                   setState(() {
//                     themeState.setDarkTheme = value;
//                   });
//                 },
//                 value: themeState.getDarkTheme,
//               ),
//           Container(
//               width: 400,
//               height: 400,
//               decoration:  BoxDecoration(
//                 color:  _isDark ? Theme.of(context).cardColor : Colors.white,
//               ),
//               child: Stack(children: <Widget>[
//                 Positioned(
//                     top: 116,
//                     left: 95,
//                     child: Container(
//                         width: 200,
//                         height: 193,
//                         decoration: BoxDecoration(
//                           color: _isDark ? Theme.of(context).cardColor : Colors.white,
//                           border: Border.all(
//                             color: Colors.purple,
//                             width: 3,
//                           ),
//                           borderRadius:
//                               const BorderRadius.all(Radius.elliptical(200, 200)),
//                                boxShadow: [ BoxShadow(
//                           color: Colors.grey.withOpacity(0.3),
//                           offset: const Offset(-10,10),
//                           blurRadius: 20.0,
//                           spreadRadius: 4.0,

//                         ),]
//                         ),),),
                        
                       
//                 Positioned(
//                     top: 129,
//                     left: 108,
//                     child: Container(
//                       width: 174,
//                       height: 170,
//                       decoration:  BoxDecoration(
//                         image: const DecorationImage(
//                             image: AssetImage("/images/image1.png"),
//                             fit: BoxFit.fill),
//                         color: _isDark ? Theme.of(context).cardColor : Colors.white,
//                         shape: BoxShape.circle,
//                       ),
//                     )),
//                 Positioned(
//                     top: 255,
//                     left: 230,
//                     child: Container(
//                         width: 45,
//                         height: 44,
//                         decoration:  BoxDecoration(
//                           color: _isDark ? Theme.of(context).cardColor : Colors.white,
//                           borderRadius: const BorderRadius.all(Radius.elliptical(45, 45)),
//                         ))),
//                  Positioned(
//                     top: 320,
//                     left: 145,
//                      child: _loading ? const CircularProgressIndicator() : Text('$name')
//                       style: TextStyle(
//                         color: _isDark ?  Colors.white : Colors.black,
//                         fontSize: 36,
//                       ),
//                     )),
//                 Positioned(
//                   top: 260,
//                   left: 236,
//                   child: Container(
//                     width: 33,
//                     height: 33,
//                     child:const FloatingActionButton(onPressed: null,
//                     backgroundColor: Colors.purple,
//                     child: Icon(Icons.add),
//                     )
//                   ),
//                 ),
//               ])),
              
//                  Flexible(
//                   child: SizedBox(
//                     height: size.height * 0.4,
//                     width: 350,
//                     child: ListView.builder(
//                         itemCount: 10,
//                         scrollDirection: Axis.horizontal,
//                         itemBuilder: (ctx, index) {
//                           return const CardWidget();
//                         }),
//                   ),
//                 ),
              
               
              
             
//         ],
//       ),
          
//     ));
//   }
// }