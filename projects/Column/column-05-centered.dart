// this has a column but it's centered on the screen by virtue of the row it's a child of which has main axis alignment (horizontally) centered

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
                  height: 100,
                  width: 100,
                  fit: BoxFit.fill,
                ),
                Image(
                  image: AssetImage('images/diamond.png'),
                  height: 100,
                  width: 100,
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
