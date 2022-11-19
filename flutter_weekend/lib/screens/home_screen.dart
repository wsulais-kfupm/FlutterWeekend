import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weekend/components/custom_card.dart';
import 'package:flutter_weekend/components/nav_bar.dart';
import 'package:flutter_weekend/constants.dart';
import 'package:flutter_weekend/misc/custom_route.dart';
import 'package:flutter_weekend/screens/card_screen.dart';

import '../components/custom_bubble.dart';

// TODO GET EVENTS BASED ON INTEREST
// TODO INCLUDE MAPBOX TO FIND PLACES AND BUBBLE THEM

final _fireStore = FirebaseFirestore.instance;
final _fireStorage = FirebaseStorage.instance;

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
  dynamic events;
  dynamic ref;
  dynamic eventRef;
  void getInfo() async {
    final user = _auth.currentUser;
    if (user != null) {
      currentUser = user;
    }
    final userRef =
        await _fireStore.collection('users').doc(currentUser.uid).get();
    userPrefs = userRef['preferences'];
    // final eventRef =
    //     await _fireStore.collection('events').doc('dEm20Ei6BmXKFunkZCEZ').get();
    eventRef = await _fireStore.collection('events').get();
    ref = await downloadedUrl('media_Fhh3pzCXwAEqSHP.jpg');
    setState(() {
      _loading = false;
    });
  }

  Future<String> downloadedUrl(String imageName) async {
    String downloadedUrl = await _fireStorage
        .ref()
        .child('events')
        .child(imageName)
        .getDownloadURL();
    return downloadedUrl;
  }

  List<Widget> createCards() {
    setState(() {
      _loading = true;
    });
    List<Widget> cols = [];
    for (var doc in eventRef.docs) {
      Map<String, dynamic> data = doc.data();
      cols.add(CustomCard(
        containerContent: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30), // Image border
              child: SizedBox.fromSize(
                child: Image.network(ref, fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
              child: Text(
                data['categories'][0],
                style: kTitleStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                data['name'],
                style: kSubtitleStyle,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
              child: Text(data['overview'] ?? 'No Description provided',
                  style: kDescription,
                  textAlign: data['overview'] != null
                      ? TextAlign.right
                      : TextAlign.left),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
              child: data['seating'] != null
                  ? Text(
                      'Seating: ${data['seating']}',
                      style: kDescription,
                    )
                  : const Text(''),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'From: ${data['dates'][0]['from'].toDate()}',
                    style: kDescription,
                  ),
                  Text(
                    'To: ${data['dates'][0]['to'].toDate()}',
                    style: kDescription,
                  ),
                ],
              ),
            ),
          ],
        ),
        onPress: () => {
          // Navigator.push(context,
          //     CustomRoute(child: CardScreen(), direction: AxisDirection.right))
        },
      ));
    }

    setState(() {
      _loading = false;
    });
    return cols;
  }

  @override
  void initState() {
    getInfo();
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 15),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: SizedBox(
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
                                  onPress: () async {
                                    // On pressed it will select the category from the documents and its related events
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        _loading
                            ? Center(child: CircularProgressIndicator())
                            : Column(children: createCards()),
                      ],
                    ),
                  ),
                ),
              ),
        bottomNavigationBar: const BottomNavBar(),
      ),
    );
  }
}
