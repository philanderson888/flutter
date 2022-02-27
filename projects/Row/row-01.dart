import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World',
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
        title: const Text('home screen')
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
              const Text('page body'),
              const Text('second item'),
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
              Container(
                padding: const EdgeInsets.fromLTRB(5,5,5,5),
                margin: const EdgeInsets.fromLTRB(5,5,5,5,),
                child: const Image(
                  image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                  width:100,
                  height:100,
                  fit: BoxFit.fill
                ),
              ), 
              const CircleAvatar(
                backgroundImage: NetworkImage('https://i.ya-webdesign.com/images/avatar-png-1.png'),
                backgroundColor: Colors.lightGreen,
                radius: 24.0,
              ),
          ]
        ),
      )
    );
  }
}
