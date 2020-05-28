import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class NoteList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List of notes')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => { 

        },
        child: Icon(Icons.add),
      ),
      body: Container(),
    );
  }
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: NoteList(),
    );
  }
}
