import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weekend/components/rounter_button.dart';
import 'package:flutter_weekend/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_weekend/screens/home_screen.dart';

Map<String, bool> prefs = {
  'Resturants': false,
  'Museums': false,
  'Parks': false,
  'Malls': false,
  'Cinama': false,
  'Cultural': false,
  'Water Parks': false,
  'Concerts': false,
  'Tech': false,
  'Art': false,
  'Music': false,
  'Coffee': false
};

List<String> userPrefs = [];

final _fireStore = FirebaseFirestore.instance;

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});
  static const String id = 'question_screen';

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  final _auth = FirebaseAuth.instance;
  late String firstName;
  late String lastName;
  late String uid;
  bool showSpinner = false;
  late User currentUser;

  void getCurrentUser() async {
    final user = _auth.currentUser;
    if (user != null) {
      currentUser = user;
      uid = currentUser.uid;
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: SizedBox(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              const SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.name,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white),
                onChanged: (value) {
                  firstName = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'First Name',
                  hintStyle: const TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                keyboardType: TextInputType.name,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white),
                onChanged: (value) {
                  lastName = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Last Name',
                  hintStyle: const TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Preferences: ',
                  style: kTextStyle,
                ),
              ),
              ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: prefs.keys.map((String key) {
                  return CheckboxListTile(
                    title: Text(
                      key,
                      style: kName,
                    ),
                    value: prefs[key],
                    onChanged: (bool? value) {
                      setState(
                        () {
                          prefs[key] = value!;
                        },
                      );
                    },
                  );
                }).toList(),
              ),
              Roundedbutton(
                color: Colors.blueAccent,
                title: 'Submit',
                onPressed: () async {
                  prefs.entries.forEach((element) {
                    if (element.value) {
                      userPrefs.add(element.key);
                    }
                  });
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    _fireStore.collection('users').doc(uid).set({
                      'first_name': firstName,
                      'last_name': lastName,
                      'preferences': userPrefs
                    });
                    // _controller.clear();
                    // final currentUser = await _auth.(
                    //     'first_name':firstName, password: password);
                    // if (newUser != null) {
                    setState(() {
                      showSpinner = false;
                    });
                    Navigator.pushNamed(context, HomeScreen.id);
                  } catch (e) {
                    print(e);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}



// 10 HOw close
// 20 UI/UX
// 20 Idea visibility
// 20 Final presentation
// 30 Live demo 

