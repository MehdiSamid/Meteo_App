import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class SearchPage extends StatelessWidget {
  final String text;
   SearchPage({super.key, required this.text});

//   @override
//   State<SearchPage> createState() => _SearchPageState();
// }

// ignore: non_constant_identifier_names

// class _SearchPageState extends State<SearchPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Meteo $text',
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:  <Widget>[
          IconButton(
            onPressed: () => _getDataMet(),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }

   _getDataMet() async {
    const String apiKey = '07a37b042328196e21b028405ff33685';
    var url = Uri.https('api.openweathermap.org', '/data/2.5/weather',
        {'q': text, 'units': 'metric', 'appid': apiKey});
    var response = await http.get(url);
    print(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      Map<String, dynamic> MainWheather = jsonResponse['main'];
      // print(jsonResponse);
      // print(jsonResponse['main'] as Map<String, dynamic>);
      // print(MainWheather.keys.first);

      return jsonResponse['name'];
    } else {
      return Null;
    }
  }

  // ignore: non_constant_identifier_names
  Widget Showit = Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Container(
        child: Text(''),
      ),
    ],
  );
}
