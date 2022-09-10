// ignore_for_file: unused_element

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;


import 'package:meteo_mar/model/Met_data.dart';
class FinalData with ChangeNotifier{
 List <Met_data> MetData=[];
Future<List<Met_data>?> getDataMet() async {
    const String apiKey = '07a37b042328196e21b028405ff33685';
    var url = Uri.https('api.openweathermap.org', '/data/2.5/weather',
        {'q': 'casablanca', 'units': 'metric', 'appid': apiKey});
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
          
          MetData.add(Met_data.fromJson(jsonResponse));
          
          return MetData;
    } else {
     print(response.statusCode);
    }
    
    return null;
    // ignore: dead_code
    notifyListeners();
  
  }
  
 

}