import 'package:flutter/material.dart';

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

      body: Container(
        child: SizedBox(
                  height: 60,
                    width: 400,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
               
              ),
              onPressed: () {
                
              },
                      child: const Text('Register', 
                      style: TextStyle(
                        fontSize: 23, 
                        fontWeight: FontWeight.bold
                        ),
                        ), 
                      ),
                  ),
      )
    );
  }
}