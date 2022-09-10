import 'package:flutter/material.dart';
import 'package:meteo_mar/model/FinalData.dart';
import 'package:meteo_mar/model/Met_data.dart';
import 'package:provider/provider.dart';

class show_data extends StatelessWidget {
  const show_data({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'weather',
          textAlign: TextAlign.center,
        ),
      ),
      body: FutureBuilder(
        future: Provider.of<FinalData>(context).getDataMet(),
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
                  return Center(
                    child: Text(
                      data[index].temp.toString(),
                      style: const TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 36,
                      ),
                    ),
                  );
                },
              );
            } 
          }
          return const Center(child: Text('Load ok'),);
        }
        
      ),
    );
  }
}
