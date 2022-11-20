

import 'package:flutter/material.dart';
import 'package:smileapp/gamescreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main Menu"),
        centerTitle: true,
      ),

      body: Center(
        child: ElevatedButton(
          child: const Text('START',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const GameScreen()));
          },
          style: ElevatedButton.styleFrom(
              fixedSize: const Size(170, 170),
              shape: const CircleBorder(), 
          ),
),
      )
    );
  }
}