# api 

## contents
- [api](#api)
  - [contents](#contents)
  - [introduction](#introduction)
  - [printing json](#printing-json)
  - [API HTTP GET](#api-http-get)
  - [api http post](#api-http-post)
  - [serialization](#serialization)
    - [http get with serialization](#http-get-with-serialization)
    - [http build a list view from api data](#http-build-a-list-view-from-api-data)
    - [http post with serialization](#http-post-with-serialization)

## introduction

next we look at obtaining api data and then displaying it in the app

## printing json

to print json output we can use the following

```java
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Album> createAlbum(String title) async {
  final response = await http.post(
    Uri.parse('https://jsonplaceholder.typicode.com/albums'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': title,
    }),
  );

  JsonEncoder encoder = new JsonEncoder.withIndent('  ');
  JsonDecoder decoder = JsonDecoder();

  print('response status code = ' + response.statusCode.toString());

  void prettyPrintJson(String input) {
    var object = decoder.convert(input);
    var prettyString = encoder.convert(object);
    prettyString.split('\n').forEach((element) => print(element));
  }

  Map json = {
    'name' : 'Kasper Peulen',
    'best_language': 'dart',
    'best_chat': 'https://dartlang.slack.com',
    'some_field': {
      'a': 'a',
      'b': 'b'
    }
  };
  String prettyprint = encoder.convert(json);
  print(' ');
  print('pretty print json = ...');
  print(prettyprint);

  if (response.statusCode == 201) {
    Album json = Album.fromJson(jsonDecode(response.body));
    print(' ');
    print('JSON is ... ');
    print(json);
    print(' ');
    print('response.body = ...');
    print(response.body);
    print(' ');
    print('jsonDecode(response.body)');
    print(jsonDecode(response.body));
    print(' ');
    print('pretty print');
    prettyPrintJson(response.body);
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to create album.');
  }
}

class Album {
  final int id;
  final String title;

  Album({required this.id, required this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      title: json['title'],
    );
  }
}

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() {
    return _AppState();
  }
}

class _AppState extends State<App> {
  final TextEditingController _controller = TextEditingController();
  Future<Album>? _futureAlbum;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Create Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Create Data Example'),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: (_futureAlbum == null) ? buildColumn() : buildFutureBuilder(),
        ),
      ),
    );
  }

  Column buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          controller: _controller,
          decoration: const InputDecoration(hintText: 'Enter Title'),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _futureAlbum = createAlbum(_controller.text);
            });
          },
          child: const Text('Create Data'),
        ),
      ],
    );
  }
  FutureBuilder<Album> buildFutureBuilder() {
    return FutureBuilder<Album>(
      future: _futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!.title);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
```

## API HTTP GET

This project gets a single piece of API data, and the source code is at [../projects/api-01](../projects/APIGet01)

It also decodes and prints whole list, both to the screen and console.

```java
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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

Future<List<Album>> fetchAlbums() async {
  final response =
      await http.get('https://jsonplaceholder.typicode.com/albums');
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print('server returned response of 200 with fetchAlbums()');
    var jsonOutput = json.decode(response.body);
    print('yes we got jsonOutput');
    List<Album> list;
    list = (json.decode(response.body) as List)
      .map( (album) => Album.fromJson(album)).toList();
    print('yes we obtained a list');       
    // // List<Album>.from(jsonOutput)
    // //   .map((Map model) => Album.fromJson(model)).toList();
    // final List<Album> list = json.decode(response.body)['result']
    //   .map((data) => Album.fromJson(data))
    //   .toList();
    var listLength = list.length;
    print('list length is $listLength');
    for(var item in list){
      print('i am an item in a list');
      print(item.title);
    }
    return list;
    //return Album.fromJson(json.decode(response.body));
  } else {
    print('something went wrong');
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

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // holds one album
  Future<Album> futureAlbum;
  // holds list of albums
  Future<List<Album>> futureAlbums;
  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
    futureAlbums = fetchAlbums();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FutureBuilder<Album>(
                future: futureAlbum,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    String output = snapshot.data.title;
                    return Text('data read is - - $output');
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  // By default, show a loading spinner.
                  return CircularProgressIndicator();
                },
              ),
              Text('Above is just one item; below are all items read from JSON API'),
              FutureBuilder<List<Album>>(
                future:futureAlbums,
                builder: (context, snapshot){
                  if(snapshot.hasData){
                    List<Album> dataList = snapshot.data;
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        for (int i = 0; i < 10; i++) Text(dataList[i].title)
                      ],
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```


## api http post

here is a more complex example where we post data to an api and obtain a `http 201` response code which means that a new record has been created ie our `http post` has been successful

see [APIPost01](../projects/APIPost01) and [APIPost02](../projects/APIPost02) for examples with one or two fields respectfully.  Below is [APIPost02](../projects/APIPost02) which updates two fields a string and an integer, thus creating a new record

```java
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Album> createAlbum(int userId, String title) async {
  final response = await http.post(
    Uri.parse('https://jsonplaceholder.typicode.com/albums'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{'userId': userId, 'title': title}),
  );

  print('\n\njson decoder decodes string into an object');
  JsonDecoder decoder = JsonDecoder();

  print('\n\njson encoder encodes object into a string');
  JsonEncoder encoder = new JsonEncoder.withIndent('  ');

  print('response status code = ' + response.statusCode.toString());

  void prettyPrintJson(String input) {
    print('\nwe can directly print our json string out');
    input.split('\n').forEach((element) => print(element));

    print('\nwe can also convert a json string to an object');
    var object = decoder.convert(input);
    var prettyString = encoder.convert(object);
    prettyString.split('\n').forEach((element) => print(element));
  }

  Map json = {
    'name': 'Kasper Peulen',
    'best_language': 'dart',
    'best_chat': 'https://dartlang.slack.com',
    'some_field': {'a': 'a', 'b': 'b'}
  };

  String prettyprint = encoder.convert(json);
  print(' ');
  print('pretty print json = ...');
  print(prettyprint);

  if (response.statusCode == 201) {
    Album json = Album.fromJson(jsonDecode(response.body));
    print(' ');
    print('JSON is ... ');
    print(json);
    print(' ');
    print('response.body = ...');
    print(response.body);
    print(' ');
    print('jsonDecode(response.body)');
    print(jsonDecode(response.body));
    print(' ');
    print('pretty print');
    prettyPrintJson(response.body);
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to create album.');
  }
}

class Album {
  final int userId;
  final String title;
  final int id;

  Album({required this.userId, required this.title, required this.id});

  factory Album.fromJson(Map<dynamic, dynamic> json) {
    return Album(userId: json['userId'], title: json['title'], id: json['id']);
  }
}

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() {
    return _AppState();
  }
}

class _AppState extends State<App> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  Future<Album>? _futureAlbum;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Create Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Create Data Example'),
        ),
        body: ListView(
          padding: const EdgeInsets.all(100),
          shrinkWrap: true,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8.0),
              child:
                  (_futureAlbum == null) ? buildColumn() : buildFutureBuilder(),
            ),
          ],
        ),
      ),
    );
  }

  Column buildColumn() {
    _controller1.text = '123';
    _controller2.text = 'bob';
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          controller: _controller1,
          decoration: const InputDecoration(hintText: 'Enter userId'),
        ),
        TextField(
          controller: _controller2,
          decoration: const InputDecoration(hintText: 'Enter title'),
        ),
        ElevatedButton(
          onPressed: () {
            int userId = int.parse(_controller1.text);
            setState(() {
              _futureAlbum = createAlbum(userId, _controller2.text);
            });
          },
          child: const Text('Enter User Id and Title'),
        ),
      ],
    );
  }

  FutureBuilder<Album> buildFutureBuilder() {
    return FutureBuilder<Album>(
      future: _futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text('New user created with id ' + snapshot.data!.id.toString  () + ', name ' + snapshot.data!.title + ', userId ' + snapshot.data!.userId.toString()
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
```


## serialization

### http get with serialization

here is an http get example with serialization

[APIGet01](../projects/APIGet01)

```java
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Album> fetchAlbum() async {
  final url = 'https://jsonplaceholder.typicode.com/albums/1';
  final response =
      await http.get(Uri.parse(url));
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

Future<List<Album>> fetchAlbums() async {
  final url = 'https://jsonplaceholder.typicode.com/albums';
  final response =
      await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print('server returned response of 200 with fetchAlbums()');
    var jsonOutput = json.decode(response.body);
    print('yes we got jsonOutput');
    
    List<Album> list;
    list = (jsonOutput as List)
        .map((album) => Album.fromJson(album))
        .toList();
    print('yes we obtained a list');
    // // List<Album>.from(jsonOutput)
    // //   .map((Map model) => Album.fromJson(model)).toList();
    // final List<Album> list = json.decode(response.body)['result']
    //   .map((data) => Album.fromJson(data))
    //   .toList();
    var listLength = list.length;
    print('list length is $listLength');
    for (var item in list) {
      print(' ');
      print('i am an item in a list');
      print(item.title);
    }
    return list;
    //return Album.fromJson(json.decode(response.body));
  } else {
    print('something went wrong');
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

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // holds one album
  Future<Album> futureAlbum;
  // holds list of albums
  Future<List<Album>> futureAlbums;
  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
    futureAlbums = fetchAlbums();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FutureBuilder<Album>(
                future: futureAlbum,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    String output = snapshot.data.title;
                    return Text('data read is - - $output');
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  // By default, show a loading spinner.
                  return CircularProgressIndicator();
                },
              ),
              Text(
                  'Above is just one item; below are all items read from JSON API'),
              FutureBuilder<List<Album>>(
                  future: futureAlbums,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Album> dataList = snapshot.data;
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          for (int i = 0; i < 10; i++) Text(dataList[i].title)
                        ],
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
```

### http build a list view from api data

here is a list view builder which dynamically builds a list view built from items obtained from the internet

[APIGet03](../projects/APIGet03)

```java
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Album> fetchAlbum() async {
  final url = 'https://jsonplaceholder.typicode.com/albums/1';
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return Album.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

Future<List<Album>> fetchAlbums() async {
  final url = 'https://jsonplaceholder.typicode.com/albums';
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    print('server returned response of 200 with fetchAlbums()');
    var jsonOutput = json.decode(response.body);
    List<Album> list;
    list = (jsonOutput as List).map((album) => Album.fromJson(album)).toList();
    var listLength = list.length;
    print('json received - $listLength items (printing first 5)');
    int counter = 0;
    for (var item in list) {
      print(' - ${item.title}');
      counter++;
      if (counter >= 5) {
        break;
      }
    }
    return list;
  } else {
    print('error');
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

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // holds one album
  Future<Album> futureAlbum;
  // holds list of albums
  Future<List<Album>> futureAlbums;
  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
    futureAlbums = fetchAlbums();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Text(
                'single api record',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    decoration: TextDecoration.underline),
              ),
            ),
            FutureBuilder<Album>(
              future: futureAlbum,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  String output = snapshot.data.title;
                  return Text(output);
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                // By default, show a loading spinner.
                return CircularProgressIndicator();
              },
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Text(
                'all records',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: FutureBuilder<List<Album>>(
                future: futureAlbums,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Album> dataList = snapshot.data;
                    return ListView.builder(
                      itemCount: dataList.length,
                      scrollDirection: Axis.vertical,
                      shrinkWrap:true,
                      itemBuilder: (context, index){
                        var album = dataList[index];
                        print(album.title);
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(album.id.toString() + ' ' + album.userId.toString() + ' ' + album.title)
                          ],
                        );
                      },
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

### http post with serialization

here is an http post example with serialization

[Serialization01](../projects/Serialization01)

```java
// ignore_for_file: prefer_final_fields

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class Post {
  int id;
  String title, body, userId;

  // default constructor
  Post()
      : id = 0,
        title = '',
        body = '',
        userId = '';

  // constructor with values
  Post.overloadedConstructor(this.id, this.title, this.body, this.userId);

  Map<String, dynamic> toJson() => {
        'title': title,
        'body': body,
        'userId': userId,
      };
}

class _AppState extends State<App> {
  final url = "https://jsonplaceholder.typicode.com/posts";
  final _postObject = {
    'title': 'A Post',
    'body': 'Post Data',
    'userId': "1001",
  };

  var _responseObject = Post();

  void _updatePostResponse(Map<String, dynamic> apiResponse) {
    setState(() {
      _responseObject.id = apiResponse['id'];
    });
  }

  void _postData() async {
    try {
      final response =
          await post(Uri.parse(url), body: jsonEncode(_postObject));
      print('\n\npost data - response is \n\n');
      Map<String, dynamic> apiResponse = jsonDecode(response.body);
      print('api response body = $apiResponse');
      _updatePostResponse(apiResponse);
    } catch (error) {
      print('error ' + error.toString());
    }
  }

  void _updateTitle(String title) {
    setState(() {
      _responseObject.title = title;
      print('title = $title');
    });
  }

  void _updateBody(String body) {
    setState(() {
      _responseObject.body = body;
      print('body = $body');
    });
  }

  void _updateUserId(String userId) {
    setState(() {
      _responseObject.userId = userId;
      print('userId = $userId');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: const Text('this is an app')),
          body: ListView(
            padding: const EdgeInsets.all(10),
            shrinkWrap: true,
            children: <Widget>[
              ElevatedButton(
                child: const Text('press to post API data'),
                onPressed: () {
                  _postData();
                },
              ),
              Text(
                  'id : ${_responseObject.id.toString()}, title: ${_responseObject.title}, body: ${_responseObject.body}, userId: ${_responseObject.userId}'),
              TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Title',
                  ),
                  onChanged: (title) {
                    _updateTitle(title);
                  }),
              TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Body',
                  ),
                  onChanged: (body) {
                    _updateBody(body);
                  }),
              TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'UserId',
                  ),
                  onChanged: (userId) {
                    _updateUserId(userId);
                  }),
            ],
          )),
    );
  }
}
```