import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:smileapp/gamescreen.dart';
import 'package:smileapp/model/callapi.dart';
import 'package:smileapp/provider/timer.dart';
import 'package:smileapp/registrationform.dart';
import 'package:smileapp/view/dropdownmenu.dart';
import 'loginpractice.dart';
import 'login.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
 runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      ),
     home: TimerScreen(),
    );
  }
}



