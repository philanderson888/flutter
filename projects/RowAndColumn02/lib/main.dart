import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListView Demo - Row And Column',
      theme: ThemeData(primarySwatch: Colors.blue,),
      home: const Home(),
    );
  }
}


class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override 
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView Row And Column Demo')
      ),
      body: ListView(
        padding: const EdgeInsets.all(100),
        shrinkWrap: true,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                const Text('Row 1'),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Image.network(
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                    height: 100, 
                    width: 100, 
                    fit: BoxFit.fill
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Image.network(
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                    height: 100, 
                    width: 100, 
                    fit: BoxFit.fill
                  ),
                ),
            ]
          ), 
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                const Text('Row 2'),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Image.network(
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                    height: 100, 
                    width: 100, 
                    fit: BoxFit.fill
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Image.network(
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                    height: 100, 
                    width: 100, 
                    fit: BoxFit.fill
                  ),
                ),
            ]
          ), 

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Row 3'),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('Column 1'),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Image.network(
                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                      height: 100, 
                      width: 100, 
                      fit: BoxFit.fill
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: Image.network(
                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                      height: 100, 
                      width: 100, 
                      fit: BoxFit.fill
                    ),
                  ),
                ]
              ), 
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('Column 2'),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Image.network(
                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                      height: 100, 
                      width: 100, 
                      fit: BoxFit.fill
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: Image.network(
                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                      height: 100, 
                      width: 100, 
                      fit: BoxFit.fill
                    ),
                  ),
                ]
              ), 
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('Column 3'),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Image.network(
                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                      height: 100, 
                      width: 100, 
                      fit: BoxFit.fill
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: Image.network(
                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                      height: 100, 
                      width: 100, 
                      fit: BoxFit.fill
                    ),
                  ),
                ]
              ), 
            ]
          ), 


        ]
      ),
    );
  }
}
