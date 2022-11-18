// import 'package:cloud_firestore/cloud_firestore.dart';)
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weekend/components/nav_bar.dart';

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
  String? name;
  void getCurrentUser() async {
    final user = _auth.currentUser;
    if (user != null) {
      currentUser = user;
      final docRef = _fireStore.collection('users').doc(currentUser.uid);
      DocumentSnapshot doc = await docRef.get();
      name = doc.get('first_name');
    }
  }

  @override
  void initState() {
    getCurrentUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              width: 400,
              height: 400,
              decoration: const BoxDecoration(
                  // color: _isDark ? Theme.of(context).cardColor : Colors.white,
                  ),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 116,
                    left: 95,
                    child: Container(
                      width: 200,
                      height: 193,
                      decoration: BoxDecoration(
                        // color: _isDark
                        //     ? Theme.of(context).cardColor:
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.purple,
                          width: 3,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.elliptical(200, 200)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.8),
                            offset: const Offset(-10, 10),
                            blurRadius: 20.0,
                            spreadRadius: 4.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 129,
                    left: 108,
                    child: Container(
                      width: 174,
                      height: 170,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("images/default.png"),
                            fit: BoxFit.fill),
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 255,
                    left: 230,
                    child: Container(
                      width: 45,
                      height: 44,
                      decoration: const BoxDecoration(
                        // color: _isDark
                        //     ? Theme.of(context).cardColor
                        //     : Colors.white,
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(45, 45)),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 320,
                    left: 145,
                    child: Text(
                      name!,
                      // currentUser.email!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 260,
                    left: 236,
                    child: SizedBox(
                        width: 33,
                        height: 33,
                        child: FloatingActionButton(
                          onPressed: null,
                          backgroundColor: Colors.purple,
                          child: Icon(Icons.add),
                        )),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 200,
              child: Stack(
                children: [
                  Positioned(
                      child: Material(
                    child: Container(
                      height: 200,
                      width: 320,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.9),
                              offset: const Offset(-10, 10),
                              blurRadius: 20.0,
                              spreadRadius: 4.0,
                            ),
                          ]),
                    ),
                  )),
                  Positioned(
                    child: Card(
                      elevation: 10,
                      shadowColor: Colors.grey.withOpacity(0.6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Container(
                        height: 200,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.purple[800],
                        ),
                        child: Column(),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 170,
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        Text(
                          "Hi I am here",
                          style: TextStyle(
                              fontSize: 20, color: Colors.purple[700]),
                        ),
                        Text(
                          "Hi I am here ",
                          style: TextStyle(
                              fontSize: 16, color: Colors.purple[700]),
                        ),
                        Divider(
                          color: Theme.of(context).cardColor,
                          thickness: 1,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
