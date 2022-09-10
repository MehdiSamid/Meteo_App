// ignore_for_file: unnecessary_this

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Met_data{
  late double temp;
  late String ic ;
  Met_data(this.temp,this.ic);

 Met_data.fromJson(Map<String,dynamic> m){
   this.temp = m['main']['temp'];
   this.ic = m['weather'][0]['icon'];
  
 }

  


}