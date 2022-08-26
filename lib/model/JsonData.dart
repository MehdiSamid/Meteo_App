import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class JsonData{
  Future <dynamic> _getDataMet(String Ville) async{
  const String apiKey = '07a37b042328196e21b028405ff33685';
  var url = Uri.https('api.openweathermap.org','/data/2.5/weather', {'q':'$Ville','units':'metric','appid':'$apiKey'});
  var response = await http.get(url);
  print(url);
  if (response.statusCode == 200) {
    var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;
    Map<String,dynamic> MainWheather =jsonResponse['main'];
    print(jsonResponse['name']);
    print(jsonResponse['main'] as Map<String,dynamic>);
    print(MainWheather.keys.first);   

    return jsonResponse;

  } else {
    print('Error');
    return Null;
    
  }
}

static Widget _ShowData(Map<String,dynamic> data){
  return Column(

  );
}


}