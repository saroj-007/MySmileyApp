import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:smileapp/gameapiservice.dart';
import 'package:smileapp/model/apimodel.dart';
import 'package:smileapp/model/callapi.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {

 late Future<SmileyModel> items;

 final TextEditingController user1 = TextEditingController();

 int score = 0;
 int tries = 0;

 void _getDataInit() async {
  items = SmileyApi().getDatas();
 }

@override
  void initState() {
    _getDataInit();
    super.initState(); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          
        ),
        
        body: FutureBuilder<SmileyModel>(
          future: items,
          builder: (context, snapshot) {
            if (snapshot.hasData){
              print(snapshot.data!.question);
            
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top:8.0),
                  child: Container(
                   // color: Colors.blueAccent,
                    height: 700,
                    width: 400,
                  
                    child: Column(
                      children: [
                        Image(image: NetworkImage(snapshot.data!.question.toString())),
                        SizedBox(height: 15,),


                        Container(
                                child: Column(
                                  children: [
                                    TextFormField(
                                      
                    controller: user1,
                    decoration: InputDecoration(
                      
                      hintText: "Enter User name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide()
                      )
                    ),
                    
                  ),

                  Text(snapshot.data!.solution.toString()),

                           ElevatedButton(
                          onPressed: (){
                            var res1 = snapshot.data!.solution;
              
              
                            if (int.parse(user1.text) == res1){
                              print("The answer is correct");
                              score += 1;
                            }
                            else{
                              tries += 1;
                              print("Try: $tries");
                              Text("Try: $tries");
                            }
                            print("Your score is: $score");
                          }, 
                          
                        child: const Text("Ok")),
              
                        const SizedBox(height: 15,),
                                  ],
                                ),
                        ),
                        
                       
                        
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              final Future<SmileyModel> item1;
                              item1 = SmileyApi().getDatas();
                              items = item1;
                            });
                            
                          }, 
                          child: const Text("New Game"))
                      ],
                    ),    
                  ),
                ),
              );
              
            }
            else{
              return Center(child: CircularProgressIndicator());
            }
          }
        )
        );
  
  }
}