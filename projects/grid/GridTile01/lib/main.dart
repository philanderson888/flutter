/// generates a grid of images of fixed size and adds in margin spacing between items.  This also adds in a [GridTile] to the [GridView]

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
    const title = 'GridTile01 with tiles in a grid';
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: Container(
          margin: EdgeInsets.all(10),
          child: GridView.count(
            crossAxisCount: 10,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            children: List.generate(20, (index) {
              return Center(
                  child: GridTile(
                  header: Container(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text('a header'),
                        const Text('extra description'),
                      ],
                    ),
                  ),
                  child: Image(
                    image: NetworkImage('https://picsum.photos/120?random=$index'),
                    fit: BoxFit.cover,
                  ),
                  footer: Container(
                    padding: const EdgeInsets.all(8),
                    child: Text('a footer'),
                  ),

                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}