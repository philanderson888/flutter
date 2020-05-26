import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
void main() => runApp(MyApp());
class RandomWords extends StatefulWidget{
  @override
  RandomWordsState createState () => RandomWordsState();
}
class RandomWordsState extends State<RandomWords>{
  // create our random list
  // ListView.builder contains 'itemBuilder' property
  final _randomWordPairs = <WordPair>[];
  Widget _buildList(){
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, item) {
        if(item.isOdd) return Divider();
        final index = item ~/ 2;
        if(index >= _randomWordPairs.length){
          _randomWordPairs.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_randomWordPairs[index], _randomWordPairs.length);
      },
    );
  }
  Widget _buildRow(WordPair pair, int length){
    return ListTile(
      title: Text(
        pair.asPascalCase, 
        style:  TextStyle(          fontSize: 18.0         )
      ),
      subtitle: Text('Length is $length.toString()'),
    );
  }
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text('WordPair Generator'),
        ),
        body: _buildList()           
    );
  }
}

class MyApp extends StatelessWidget{
  // override build
  @override 
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.purple[100]),
      home: RandomWords()
    );
  }
}