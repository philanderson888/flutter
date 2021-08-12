import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class RandomWords extends StatefulWidget{
  @override
  RandomWordsState createState () => RandomWordsState();
}
class RandomWordsState extends State<RandomWords>{
  // create our random list
  // ListView.builder contains 'itemBuilder' property
  final _randomWordPairs = <WordPair>[];
  // set can only appear once per item in the set list
  final _savedWordPairs = Set<WordPair>();
  int listLength = 0;
  Widget _buildList(){
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, item) {
        if(item.isOdd) return Divider();
        final index = item ~/ 2;
        if(index >= _randomWordPairs.length){
          _randomWordPairs.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_randomWordPairs[index], index+1, _randomWordPairs.length);
      },
    );
  }
  Widget _buildRow(WordPair pair, int index, int listLength){
    // is the current pair contained in the saved word pair list?  true/false
    final alreadySaved = _savedWordPairs.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase, 
        style:  TextStyle( 
          fontSize: 18.0
        )
      ),
      subtitle: Text('Index is $index and total list length is $listLength'),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border, color: alreadySaved ? Colors.red : null
      ),
      onTap: () => {
        setState( () => { 
          if(alreadySaved){
            _savedWordPairs.remove(pair) 
          } else {
            _savedWordPairs.add(pair)
          }
        })
      },
    );
  }
  void _pushSaved(){
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context){

          final Iterable<ListTile> tiles = _savedWordPairs.map((WordPair pair){
            return ListTile(
              title: Text(pair.asPascalCase, style: TextStyle(fontSize: 16.0)),
              subtitle: Text('This is a subtitle'),
            );
          });
          final List<Widget> divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();
          return Scaffold(
            appBar: AppBar(
              title: Text('Saved Word Pairs')
            ),
            body: ListView(
              children: divided,
            ),
          );
        }
      )
    );
  }
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text('WordPair Generator'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.list),
              onPressed: _pushSaved,
            ),
          ],
        ),
        body: _buildList()           
    );
  }
}


Future<Album> fetchAlbum() async {
  final response =
      await http.get('https://jsonplaceholder.typicode.com/albums/1');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
class Album {
  final int userId;
  final int id;
  final String title;

  Album({this.userId, this.id, this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}