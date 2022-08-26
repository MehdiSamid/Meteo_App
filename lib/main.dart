import 'package:flutter/material.dart';
import 'package:meteo_mar/SearchPage.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final List<String> entries = <String>[
    'Casablanca',
    'Agadir',
    'Marrakech',
    'Tanger'
  ];
  final List<String> City = <String>[
    'assets/images/casablanca.png',
    'assets/images/Agadir.PNG',
    'assets/images/marrakech.PNG',
    'assets/images/Tanger.PNG'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) =>
                     SearchPage(text: 'casablanca'),
              ),
            ),
            icon: const Icon(Icons.access_time),
          )
        ],
        centerTitle: true,
        title: const Text('Meteo Maroc'),
      ),
      body: Center(
        child: ListView.separated(
          addAutomaticKeepAlives: true,
          padding: const EdgeInsets.all(8),
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onDoubleTap: () => print('${entries[index]} is clicked'),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) =>
                      SearchPage(text: entries[index]),
                ),
              ),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Colors.blueGrey,
                ),
                height: 400,

                // child: Center(child: Text('Entry ${entries[index]}')),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(City[index]),
                    Text(
                      entries[index],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          height: 2,
                          fontSize: 26,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: const <Widget>[],
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        ),
      ),
    );
  }




  
}
