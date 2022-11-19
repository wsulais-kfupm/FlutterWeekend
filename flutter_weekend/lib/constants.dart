import 'package:flutter/material.dart';

const kHourglass = 'QuizU ⏳';

// const kBackgroundColor = Color(0xFF2E1F46);
// const kBackgroundColor = Color(0xFF3C096C);
// const kBackgroundColor = Color(0xFF421869);
const kBackgroundColor = Color(0xFF32004f);
var kButtonColor = Colors.purple[100];
// const kButtonColor = Color(0xFF4e2c70);
// const kButtonColor = Color(0xFF522882);
// const kButtonColor = Color(0xFF6818a5);
// const kAppBarColor = Color(0xFF240046);
const kAppBarColor = Colors.white;
// 511f73
// const kAppBarColor = Color(0xFF431259);
// const kAppBarColor = Color(0xFF310055);
// const kAppBarColor = Color(0xFF190028);
const kBottomAppBar = Color(0xFF6436AE);
// const kActivated = Color(0xFF5E6AD9);
const kActivated = Color.fromARGB(255, 97, 17, 141);
const kInActivated = Color(0xFF636365);

const kAppBarStyle = TextStyle(
  fontSize: 28.0,
  fontFamily: 'SourceSans',
);
var kHintStyle = const TextStyle(
  fontSize: 20,
  fontFamily: 'SourceSans',
  color: Colors.white,
);
var kButtonStyle = TextButton.styleFrom(
  backgroundColor: const Color.fromARGB(255, 40, 46, 137),
);
const kTextButtonStyle = TextStyle(
  color: Colors.white,
  fontSize: 18,
  fontFamily: 'SourceSans',
);
const kName = TextStyle(
  color: Colors.white,
  fontSize: 18,
  fontFamily: 'SourceSans',
);
const kDescription = TextStyle(
  color: Colors.white,
  fontSize: 15,
  fontFamily: 'SourceSans',
);
const kAnswerButtonStyle = TextStyle(
  color: Colors.white,
  fontSize: 22,
  fontFamily: 'SourceSans',
);
const kTextInputStyle = TextStyle(
  color: Colors.black,
  fontSize: 22,
  fontFamily: 'SourceSans',
);
const kTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 30,
  fontFamily: 'SourceSans',
);
const kInfoStyle = TextStyle(
  color: Colors.white,
  fontSize: 28,
  fontFamily: 'SourceSans',
);
const kChallenge = TextStyle(
  fontSize: 28,
  fontFamily: 'SourceSans',
);

const kNumberStyle = TextStyle(
  fontSize: 48.0,
  fontWeight: FontWeight.w900,
  fontFamily: 'SourceSans',
);
const kTimerStyle = TextStyle(
  fontSize: 28.0,
  fontFamily: 'SourceSans',
);

const kQuestion = TextStyle(
  fontSize: 30.0,
  color: Colors.white,
  fontFamily: 'SourceSans',
);

const kTitleStyle = TextStyle(
  fontSize: 18.0,
  fontFamily: 'SourceSans',
  color: Colors.white70,
);
const kSubtitleStyle = TextStyle(
  fontSize: 18.0,
  fontFamily: 'SourceSans',
  color: Colors.white,
);
const kBodyStyle = TextStyle(
  fontSize: 20.0,
  fontFamily: 'SourceSans',
);
const kInputStyle = TextStyle(
  fontSize: 20.0,
  fontFamily: 'SourceSans',
  color: Colors.black,
);

const kMyInputDecoration = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  prefixIconConstraints: BoxConstraints(minWidth: 20, maxWidth: 30),
  hintText: 'Mohammad Al Ali',
  hintStyle: TextStyle(
    color: Colors.grey,
    fontFamily: 'SourceSans',
  ),
  border: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10.0),
      ),
      borderSide: BorderSide.none),
);
const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);

var kTextFieldDecoration = InputDecoration(
  hintText: '',
  hintStyle: TextStyle(color: Colors.black54),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.purple.shade400, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.purple.shade500, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);
