import 'dart:async';

import 'package:flutter/material.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {

  int initalValue = 60;

  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (t){
      setState(() {
        initalValue--;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(initalValue.toString(), style: TextStyle(fontSize: 60),)
          ],
        ),
      ),
    );
  }
}