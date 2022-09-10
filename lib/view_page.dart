import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  final String text;
  // Map<String, dynamic> data = {};
  // List <dynamic> data=[''];

  Future<Object> _getDataMet() async {
    const String apiKey = '07a37b042328196e21b028405ff33685';
    var url = Uri.https('api.openweathermap.org', '/data/2.5/weather',
        {'q': text, 'units': 'metric', 'appid': apiKey});
    var response = await http.get(url);
    print(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      List weather = jsonResponse['weather'];
       List <dynamic> data = [jsonResponse['main']['temp'],jsonResponse['weather'][0]['icon']];
        
        
       
       print(data);
      // print(jsonResponse);
      // print(jsonResponse['main'] as Map<String, dynamic>);
      // print(MainWheather.keys.first);
      // data.addAll({
      //   'Ville ': text,
      //   'Temp is ': jsonResponse['main']['temp'],
      //   'icon ': weather.map((e) => e['icon'].toString())
      // });

      // print(weather.map((e) => e['icon'].toString()));
      // print(data);
      print(data);
      return data;
    } else {
      return Null;
    }
  }

  SearchPage({super.key, required this.text});

//   @override
//   State<SearchPage> createState() => _SearchPageState();
// }

// ignore: non_constant_identifier_names

// class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    _getDataMet();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Meteo $text',
          textAlign: TextAlign.center,
        ),
      ),
      body:Container(
        child: FutureBuilder(
          future: _getDataMet(),
          builder: (context, snapshot) {
            if(snapshot.data == null){
              return  Center(
                child: Container(
                  height: 500,
                  width: 500,
                  color: Colors.amber,
                  child: const Text('Loading...'),
                ),
              );
            }else {
              return  ListView.builder(
                itemCount: 1,
                itemBuilder: ((context, index) {
                  return ListTile(
                    title: Text('${snapshot.data}'),
                    subtitle: Text(snapshot.data.toString()),
                  );
                }),
                );
            }
          },
          ),
      ),
    );
  }

  // ignore: non_constant_identifier_names

}

