/// [GridView02] generates a grid of images of fixed size

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/// [myApp] is Stateless and renders a [GridView] with an auto-generateed [List] - 
/// each item in the [GridView] comes from the [List] [index] and also a random [Image]
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const title = 'GridView02 - a list of images displayed in a grid layout';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: GridView.count(
          crossAxisCount: 10,
          children: List.generate(20, (index) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Item $index',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Image(
                    image: NetworkImage('https://picsum.photos/120?random=$index'),
                  ),
                ]
              ),
            );
          }),
        ),
      ),
    );
  }
}