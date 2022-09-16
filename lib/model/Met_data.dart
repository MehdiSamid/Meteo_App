// ignore_for_file: unnecessary_this

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Met_data{
  late double temp;
  late String ic ;
  late String desc ;
  late String vl ;
  Met_data(this.temp,this.ic,this.desc,this.vl);

 Met_data.fromJson(Map<String,dynamic> m){
   this.temp = m['main']['temp'];
   this.ic = m['weather'][0]['icon'];
   this.desc = m['weather'][0]['description'];
   this.vl = m['name'];
  
 }

  


}