import 'package:http/http.dart' as http;
import 'package:smileapp/model/apimodel.dart';
import 'package:smileapp/model/callapi.dart';
import 'dart:convert';

class SmileyApi {

  String url = "http://marcconrad.com/uob/smile/api.php?out=json";

  Future<SmileyModel> getDatas() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200){
       return SmileyModel.fromJson(jsonDecode(response.body));
       }
       else{
        throw Exception("Failed to load data");
       }
  }

  // Future<dynamic> getData() async {
  //   try{
  //     final response = await http.get(Uri.parse(url),
  //   //  log("Fetch data ${response.body}}");
  //     );
  //     if (response.statusCode == 200){
  //       return jsonDecode(response.body);
  //     }
  //     else{
  //       return null;
  //     }
      
  //   }
  //   catch (e) {
  //     print("Error");
  //   }
  // }

}