import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: const Text('this is an app'),
          backgroundColor: Colors.lightBlueAccent[200],
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: const <Widget>[
                Text('body11'),
                Text('body22'),
                Text('body33'),
                Image(
                  image: NetworkImage(
                      'https://www.w3schools.com/w3css/img_lights.jpg'),
                  height: 300,
                  width: 400,
                  fit: BoxFit.fill,
                ),
                Image(
                  image: AssetImage('images/diamond.png'),
                  height: 300,
                  width: 300,
                  fit: BoxFit.fill,
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
