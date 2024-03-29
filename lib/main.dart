// https://github.com/may-andro/dribble_login_challenge
// https://github.com/huextrat/TheGorgeousLogin


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multiple_quiz/screens/onboarding/onboarding_page.dart';

void main() => run();

Future run() async {
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: OnBoardingPage(),
    );
  }
}