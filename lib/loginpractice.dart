import 'package:flutter/material.dart';

class loginpractice extends StatelessWidget {
  const loginpractice({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: InkWell(
          onTap: () {
            print("On tap is pressed");
          },
          onDoubleTap: () {
            print('On double tap is pressed');
          },
          child: Container(
            height: 500,
            width: 330,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}