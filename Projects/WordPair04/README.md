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

### Return word pairs with counting of index and list length

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
        return _buildRow(_randomWordPairs[index], index, _randomWordPairs.length);
      },
    );
  }
  Widget _buildRow(WordPair pair, int index, int listLength){
    return ListTile(
      title: Text(
        pair.asPascalCase, 
        style:  TextStyle( 
          fontSize: 18.0
        )
      ),
      subtitle: Text('Index is $index and total list length is $listLength'),
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
```


## Split into 2 files 

### main

```java
import 'package:flutter/material.dart';
import './random_words.dart';
void main() => runApp(MyApp());

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

### random_words

```java
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class RandomWords extends StatefulWidget{
  @override
  RandomWordsState createState () => RandomWordsState();
}
class RandomWordsState extends State<RandomWords>{
  // create our random list
  // ListView.builder contains 'itemBuilder' property
  final _randomWordPairs = <WordPair>[];
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
    return ListTile(
      title: Text(
        pair.asPascalCase, 
        style:  TextStyle( 
          fontSize: 18.0
        )
      ),
      subtitle: Text('Index is $index and total list length is $listLength'),
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
```

## Add to favourites

```java
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

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
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text('WordPair Generator'),
        ),
        body: _buildList()           
    );
  }
}
```


## Create a button which will enable us to create another page

```java
void _pushSaved(){}

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
```

## Final working app with routes and separate page of list pairs

Note that routes are handled with a `stack` structure with `push` and `pop` so the top page is shown

```java
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
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
```

## Summary

Wow !  

I have just built my first flutter mobile app which works great and looks just like the real, native app.  In fact it is the real, native app but built with java Flutter/Dart and that works great.

I am really impressed.

I look forward to developing this theme!

Phil Anderson

May 2020