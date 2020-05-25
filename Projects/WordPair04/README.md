# WordPair04

## Contents

- [WordPair04](#wordpair04)
  - [Contents](#contents)

## Intro 

This is part 4 of a series to build an app which displays lists of random word pairs.

So far we have generated one word pair.

This version progresses that forward.

The youtube is https://www.youtube.com/watch?v=1gDhl4leEzA

## install

```java
flutter create WordPair04
```

## Hello World with Centred Text

```java
import 'package:flutter/material.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget{
  // override build
  @override 
  Widget build(BuildContext context){
    return MaterialApp(
      home: Text('Hello World', 
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 30,
          color: Colors.green[200],
        )
      )
    );
  }
}
```

## `AppBar` with `Scaffold`

```java
import 'package:flutter/material.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget{
  // override build
  @override 
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.purple[100]),
      home: Scaffold(
        appBar: AppBar(
          title: Text('WordPair Generator'),
        ),
      )
    );
  }
}
```

## Word Pairs

```yaml
english_words: ^3.1.5
```

```java
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget{
  // override build
  @override 
  Widget build(BuildContext context){
    final wordPair = WordPair.random();
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.purple[100]),
      home: Scaffold(
        appBar: AppBar(
          title: Text('WordPair Generator'),
        ),
        body: Center(
          child: Text(wordPair.asPascalCase)
        ),
      )
    );
  }
}
```

## Refactor

```java
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
void main() => runApp(MyApp());
class RandomWords extends StatefulWidget{
  @override
  RandomWordsState createState () => RandomWordsState();
}
class RandomWordsState extends State<RandomWords>{
  Widget build(BuildContext context){
    final wordPair = WordPair.random();
    return Scaffold(
        appBar: AppBar(
          title: Text('WordPair Generator'),
        ),
        body: Center(
          child: Text(wordPair.asPascalCase)
        ),      
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
```

## Add ListView

```java
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
void main() => runApp(MyApp());

class RandomWords extends StatefulWidget{
  @override
  RandomWordsState createState () => RandomWordsState();
}

class RandomWordsState extends State<RandomWords>{
  Widget _buildList(){
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        Container(
          height: 50,
          color: Colors.amber[600],
          child: const Center(child: Text('Entry A')),
        ),
        Container(
          height: 50,
          color: Colors.amber[500],
          child: const Center(child: Text('Entry B')),
        ),
        Container(
          height: 50,
          color: Colors.amber[100],
          child: const Center(child: Text('Entry C')),
        ),
      ],
    );
  }
  Widget build(BuildContext context){
    final wordPair = WordPair.random();
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
```

### Generate Random List

```java
// create our random list
final _randomWordPairs = <WordPair>[];
```

### Refactor code again 

```java
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
        return _buildRow(_randomWordPairs[index], index);
      },
    );
  }
  Widget _buildRow(WordPair pair){
    return ListTile(title: Text(index));
  }
  Widget build(BuildContext context){
    final wordPair = WordPair.random();
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
```



## Return Word Pairs

```java
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
        return _buildRow(_randomWordPairs[index]);
      },
    );
  }
  Widget _buildRow(WordPair pair){
    return ListTile(title: Text(pair.asPascalCase));
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
```
