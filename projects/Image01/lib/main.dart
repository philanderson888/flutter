import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World',
      theme: ThemeData(primarySwatch: Colors.blue,),
      home: Home(),
    );
  }
}


class Home extends StatelessWidget {
  @override 
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home screen')
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
              Text('page body'),
              Text('second item'),
              const Image(
                image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
              ),
              new CircleAvatar(
                backgroundImage: new NetworkImage('https://i.ya-webdesign.com/images/avatar-png-1.png'),
                backgroundColor: Colors.lightGreen,
                radius: 24.0,
              ),
          ]
        ),
      )
    );
  }
}
