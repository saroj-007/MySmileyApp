import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:smileapp/provider/gameapiservice.dart';
import 'package:smileapp/model/apimodel.dart';
import 'package:smileapp/model/callapi.dart';
import 'package:smileapp/view/dropdownmenu.dart';

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

  late String _isResultCheck;
  late bool _isCheck;
  late bool _isButtonDisabled = true;

 late int _selectedNums = 0;
  
  List<int> nums = [0,1,2,3,4,5,6,7,8,9];

 void _getDataInit() async {
  items = SmileyApi().getDatas();
 }

@override
  void initState() {
    _isResultCheck = "No Result";
    _isCheck = false;
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
                  padding: const EdgeInsets.only(top:30),
                  child: Container(
                   // color: Colors.blueAccent,
                    height: 900,
                    width: 400,
                  
                    child: Column(
                      children: [
                        Container(
                          
                          child: Image(image: NetworkImage(snapshot.data!.question.toString())),
                        ),
                        
                        const SizedBox(height: 15,),
                        Padding(
                          padding: const EdgeInsets.only(top: 45),
                          child: Container(
                            
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      
                                    // Drop Down menu
                                    Padding(
                                      padding: const EdgeInsets.only(left: 35),
                                      child: SizedBox(
                                        height: 60,
                                        width: 70,
                                        child: DropdownButtonFormField<int>(
                                              icon: Icon(Icons.arrow_downward),
                                              iconSize: 24,
                                              elevation: 16,
                                              isExpanded: true,
                                              style: TextStyle(color: Colors.blueAccent, fontSize: 20),
            
                                        decoration: InputDecoration(
                                                    enabledBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(12),
                                                    borderSide: const BorderSide(width: 3, color: Colors.blueAccent)
                                       )
                                     ),
                                        items: nums.map((int dropDownValue) {
                                     return DropdownMenuItem<int>(
                                      value: dropDownValue,
                 
                                      child: Text(dropDownValue.toString())
               );
             }).toList(),
             onChanged: (newVal) {
               setState(() {
                 _selectedNums = newVal!;
                 print(_selectedNums);
               }
               
               );
             },
             value: _selectedNums,
             
             ),
                                      ),
                                    ),
  
                             Padding(
                               padding: const EdgeInsets.only(left: 20.0),
                               child: ElevatedButton(
                                
                                onPressed: (){
                                var res1 = snapshot.data!.solution;
                                  
                                if (_isButtonDisabled){
                                  // To check condition for the correct answer
                                  if ( res1 == _selectedNums){
                                  print("The answer is correct");
                                  score += 1;
                                  _isCheck = true;
                                  setState(() {
                                    _isButtonDisabled = false;
                                    _selectedNums = 0;
                                  });
                                  
                                }
                                else{
                                  tries += 1;
                                  print("Try: $tries");
                                  _isCheck = false;
                                } 
                                
                                setState(() {
                                  if (_isCheck == true){
                                     _isResultCheck = "Correct";
                                     print("Your score is: $score");
                                  }
                                  else{
                                     _isResultCheck = "Incorrect";
                                  }
                                 
                                });

                                }

                                      
                                // Check condition for correct / incorrect result
                                
                            }, 
                            
                            
                          child: const Text("Check")),
                             ),
              
                        //  const SizedBox(height: 15,),

                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                // final Future<SmileyModel> item1;
                                // item1 = SmileyApi().getDatas();
                                // items = item1;
                                _getDataInit();
                                _selectedNums = 0;
                                tries = 0;
                                _isResultCheck = "No Result";
                                _isButtonDisabled = true;
                                snapshot.data!.solution.toString();
                              });
                              
                            }, 
                            child: const Text("New Game")),
                          )
                                    ],
                                  ),
                          ),
                        ),
                        
                       
                        Row(
                          children: [

                            Padding(
                    padding: const EdgeInsets.only(left:35.0),
                    child: Text("$_isResultCheck", style: TextStyle(fontSize: 20, color: Colors.blueAccent),),
                  ),

                            Padding(
                    padding: const EdgeInsets.only(left:50.0),
                    child: Text("Hint: ${snapshot.data!.solution.toString()}", style: TextStyle(fontSize: 20),),
                  ),
                          ],
                        ),

                   
                        
                      ],
                    ),    
                  ),
                ),
              );
              
            }
            else{
              return const Center(child: CircularProgressIndicator());
            }
          }
        )
        );
  
  }
}