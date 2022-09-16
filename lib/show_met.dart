// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:meteo_mar/main.dart';
import 'package:meteo_mar/model/FinalData.dart';
import 'package:meteo_mar/model/Met_data.dart';
import 'package:provider/provider.dart';

class show_data extends StatefulWidget {
  show_data({Key? key, required this.city}) : super(key: key);
  final String city;

  @override
  State<show_data> createState() => _show_dataState();
}

class _show_dataState extends State<show_data> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (BuildContext context) => new HomePage()));

              setState(() {});
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
        title: const Text(
          'weather ',
          textAlign: TextAlign.center,
        ),
      ),
      body: FutureBuilder(
          future: Provider.of<FinalData>(context).getDataMet(widget.city),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.data != null) // check for null
            {
              List<Met_data>? data = snapshot.data as List<Met_data>;

              if (snapshot.hasError) {
                return const Text('Error');
              }
              if (snapshot.data != Null) {
                return ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(data[index].vl),
                        Image.network(
                            'http://openweathermap.org/img/wn/${data[index].ic.toString()}@2x.png'),
                        Text(
                          '${data[index].temp.toStringAsFixed(0)} °C',
                          style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 36,
                          ),
                        ),
                        Text(data[index].desc.toString(),),
                      ],
                    );
                  },
                );
              }
            }
            return const Center(
              child: Text('Load ok'),
            );
          }),
    );
  }
}
