import 'package:flutter/material.dart';

class DropDownItems extends StatefulWidget {
  const DropDownItems({super.key});

  @override
  State<DropDownItems> createState() => _DropDownItemsState();
}

class _DropDownItemsState extends State<DropDownItems> {
  List<int> nums = [0,1,2,3,4,5,6,7,8,9];

 int _selectedNums= 0;


  @override
  Widget build(BuildContext context) {
    return Material(
     child: Center(
       child: SizedBox(
        width: 80,
         child: DropdownButtonFormField<int>(
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
              });
            },
            value: _selectedNums,
            
            ),
       ),
     )
        
    );
  }
}