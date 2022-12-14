import 'package:flutter/material.dart';
import 'package:meteo_mar/model/FinalData.dart';
import 'package:meteo_mar/show_met.dart';
import 'package:meteo_mar/view_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => FinalData(),
      )
    ],
    child: Myapp(),
  ));
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:ThemeData.dark().copyWith(
        colorScheme: const ColorScheme.light().copyWith(primary: Colors.deepPurple),
        
        ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget with ChangeNotifier {
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
        automaticallyImplyLeading: false,
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
              
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) =>
                      ChangeNotifierProvider
                      (
                        
                        create: (context) => FinalData(),
                        child: show_data( city: entries[index])),
                       
                      
                ),
                
                
               
              ),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Color.fromARGB(247, 27, 30, 29),
                ),
                height: 400,

                // child: Center(child: Text('Entry ${entries[index]}')),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  
                  children: <Widget>[
                    Image.asset(City[index]),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      
                      entries[index],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          height: 2,
                          fontSize: 26,
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.bold),
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
