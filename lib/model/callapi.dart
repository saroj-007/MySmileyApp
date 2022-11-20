
import 'package:smileapp/provider/gameapiservice.dart';

class GetApiData{
  
var result;

  getApiData() async {

    
   result = await SmileyApi().getDatas();

    print(result['question']);
    print(result['solution']);
    print("Hello world");
  }
}