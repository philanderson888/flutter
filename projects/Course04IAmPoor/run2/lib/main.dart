import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        title: const Text('I am poor (not!)'),
      ),
      body: Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        Column(
          children: const [
            Text('I am (not) poor'),
            Text('very (not) poor'),
            Text('!!!!!!!!!!!!!!!'),
            Image(
              image: NetworkImage(
                  'https://www.planete-energies.com/sites/default/files/styles/media_full_width_940px/public/thumbnails/image/452001095-lignite.jpg'),
              width: 400,
              height: 400,
            ),
            Image(
              image: AssetImage('images/coal.jpg'),
              width: 200,
              height: 200,
            )
          ],
        ),
      ]),
    ),
  ));
}
