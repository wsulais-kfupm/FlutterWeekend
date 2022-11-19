// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_weekend/components/custom_card.dart';
// import 'package:flutter_weekend/constants.dart';

// final _fireStore = FirebaseFirestore.instance;
// final _fireStorage = FirebaseStorage.instance;

// class CardScreen extends StatefulWidget {
//   const CardScreen({super.key});

//   @override
//   State<CardScreen> createState() => _CardScreenState();
// }

// class _CardScreenState extends State<CardScreen> {
//   bool _loading = true;
//   dynamic exp;
//   List<dynamic>? images;
//   dynamic ref1;
//   dynamic ref2;

//   void getInfo() async {
//     ref1 = await downloadedUrl('IMG-20221118-WA0030.jpg');
//     ref1 = await downloadedUrl('IMG-20221118-WA0033.jpg');
//   }

//   Future<String> downloadedUrl(String imageName) async {
//     String downloadedUrl = await _fireStorage
//         .ref()
//         .child('experiences')
//         .child(imageName)
//         .getDownloadURL();
//     return downloadedUrl;
//   }

//   List<Widget> createCards() {
//     setState(() {
//       _loading = true;
//     });
//     List<Widget> cols = [];
//     cols.add(CustomCard(
//       containerContent: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(30), // Image border
//             child: SizedBox.fromSize(
//               child: Image.network(ref1, fit: BoxFit.cover),
//             ),
//           ),
//         ],
//       ),
//       onPress: () {},
//     ));
//     CustomCard(
//       containerContent: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(30), // Image border
//             child: SizedBox.fromSize(
//               child: Image.network(ref2, fit: BoxFit.cover),
//             ),
//           ),
//         ],
//       ),
//       onPress: () {},
//     );

//     setState(() {
//       _loading = false;
//     });
//     return cols;
//   }

//   @override
//   void initState() {
//     getInfo();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.white,
//         body: Container(
//           child: Column(children: createCards()),
//         ));
//   }
// }
