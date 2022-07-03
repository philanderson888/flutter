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
    - [http crud app with serialization](#http-crud-app-with-serialization)
  - [secrets](#secrets)
    - [.env file](#env-file)
    - [read .env file](#read-env-file)

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


### http crud app with serialization

please see [projects/MultiPage05](../projects/MultiPage05) for some clear examples of how to serialize data to and from JSON

```java
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final textBackground = Color(0xFFC4F3E0);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StatefulHome(),
      theme: ThemeData(
        // applies to whole app if applied like this - fontFamily: 'Arial',
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: Colors.cyan[600]),
        textTheme: TextTheme(
          bodyText1: TextStyle(
            fontSize: 15,
            backgroundColor: textBackground,
            color: Color(0xFF2C0313),
          ),
        ),
      ),
    );
  }
}

class StatefulHome extends StatefulWidget {
  UpdateStatefulHome createState() => UpdateStatefulHome();
}

class UpdateStatefulHome extends State {
  String buttonText = 'some text';
  int counter = 0;
  clickButton() {
    counter++;
    setState(() => {
          if (counter % 2 == 0) {buttonText = 'Even'} else {buttonText = 'Odd'}
        });
  }

  goToPage2() {
    Navigator.push(
      (context),
      MaterialPageRoute(builder: (context) => Page2()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Home Screen")),
      ),
      body: Container(
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Container(
                child: Text(
                  'here is some text',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              Container(
                child: Text(
                  'here is some more text',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              Container(
                child: Text('here is a third line'),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: ElevatedButton(
                    key: null, onPressed: null, child: Text('a button')),
              ),
              Container(
                margin: EdgeInsets.all(5),
                child: Text('counter is $counter'),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.all(20),
                      child: Text(buttonText),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: ElevatedButton.icon(
                        autofocus: true,
                        clipBehavior: Clip.none,
                        onPressed: () => clickButton(),
                        icon: Icon(Icons.access_alarm),
                        label: Text(buttonText),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          padding: const EdgeInsets.all(30),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.lightBlue),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 15.0),
                      child: Text(counter.toString()),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                child: ElevatedButton(
                  autofocus: true,
                  clipBehavior: Clip.none,
                  onPressed: () => clickButton(),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFF5A9C6),
                    padding: const EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.lightBlue),
                    ),
                  ),
                  child: Text(
                    'go to next screen',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                child: ElevatedButton.icon(
                  onPressed: () => clickButton(),
                  icon: Icon(Icons.arrow_forward),
                  label: Text('a button'),
                ),
              ),
              Container(
                width: 250,
                child: ElevatedButton(
                  onPressed: () => goToPage2(),
                  child: Text("Click To Go To Page 2"),
                ),
              ),
              Tooltip(
                message: 'This is some help text to understand what to do ',
                child: const Text('This is some text without much explanation'),
                waitDuration: const Duration(seconds: 1),
                showDuration: const Duration(seconds: 4),
                height: 50,
                textStyle: const TextStyle(fontSize: 24),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: const LinearGradient(
                      colors: <Color>[Colors.amber, Colors.red]),
                ),
              ),
              Tooltip(
                message: 'Tooltip Help Text',
                child: Container(
                  width: 250,
                  child: ElevatedButton(
                    onPressed: () => goToPage2(),
                    child: Text("Click To Go To Page 2"),
                  ),
                ),
                waitDuration: const Duration(seconds: 1),
                showDuration: const Duration(seconds: 4),
                height: 50,
                textStyle: const TextStyle(fontSize: 24),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: const LinearGradient(
                      colors: <Color>[Colors.amber, Colors.red]),
                ),
              ),
            ],
          )),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    goToPage3() {
      Navigator.push(
        (context),
        MaterialPageRoute(builder: (context) => Page3()),
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('Page 2'),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Container(
                width: 250,
                child: ElevatedButton(
                  onPressed: () => goToPage3(),
                  child: Row(
                    children: <Widget>[
                      Text("Click To Go To Page 3"),
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    goToPage4() {
      Navigator.push(
        (context),
        MaterialPageRoute(builder: (context) => Page4()),
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('Page 3'),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Container(
                width: 250,
                child: ElevatedButton(
                  onPressed: () => goToPage4(),
                  child: Row(
                    children: <Widget>[
                      Text("Click To Go To Page 4"),
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class Page4 extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    goToPage2() {
      Navigator.pop(context);
      Navigator.pop(context);
    }

    goToPage5() {
      Navigator.push(
        (context),
        MaterialPageRoute(builder: (context) => Page5()),
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('Page 4'),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Container(
                width: 250,
                child: ElevatedButton(
                  onPressed: () => goToPage2(),
                  child: Row(
                    children: <Widget>[
                      Text("Click To Go To Page 2"),
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                ),
              ),
              Container(
                width: 250,
                child: ElevatedButton(
                  onPressed: () => goToPage5(),
                  child: Row(
                    children: <Widget>[
                      Text("Click To Go To Page 5"),
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class Page5 extends StatefulWidget {
  UpdatePage5State createState() => UpdatePage5State();
}

class Album {
  final int userId;
  final int id;
  final String title;

  Album({this.userId, this.id, this.title});

  Album.createPostObject(userId, title)
      : id = 0,
        userId = userId,
        title = title;
        
  Map<String, dynamic> toJson() => {
      'id': id,
      'userId': userId,
      'title': title,
    };

  Album.fromJson(Map<String, dynamic> json)
    : id = json['id'], 
      userId = json['userId'],
      title = json['title'];

  void set setAlbumTitle(String title){
    title = title;
  }

  set albumId(int id){
    id = id;
  }

}

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

class UpdatePage5State extends State {
  bool _isHover = false;
  List<Color> cardColors = [];
  String cardColorString = "blue";
  String buttonText = 'some text';
  int counter = 0;
  Color oddEvenToggleColor = Colors.white;
  String _data = 'here is some data';

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

  goToPage6(int index, Album album) {
    setState((){
      _data = 'index ${index.toString()} content "${album.title}"';
    });
    print('going to page 6');
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => Page6(index: index, album: album)),
    );
  }

  goToPage7WithFixedDetails() {
    int index = 5;
    var album = Album(userId: 10, id: 1, title: 'a title');
    print('going to page 7');
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => Page7(index: index, album: album)),
    );
  }

  goToPage7(index, album) {
    print('going to page 7');
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => Page7(index: index, album: album)),
    );
  }
  
  void _toggleCardColor(index, album) async {
    setState(() {
      if (cardColors[index] == Colors.blue){
        print('toggling blue card to yellow');
        cardColors[index] = Colors.yellow;
      } else {
        print('toggle yellow card to blue');
        cardColors[index] = Colors.blue;
      }
    });
    const duration = 2;
    print('sleeping for $duration seconds');
    await Future.delayed(Duration(seconds: duration));
    print('sleep duration has completed');
    if (index <= 1){
      goToPage6(index, album);
    } else {
      goToPage7(index, album);
    }
  }

  clickButton() {
    counter++;
    setState(() => {
        if (counter % 2 == 0) {
          buttonText = 'Even'
        } else {
          buttonText = 'Odd'
        }
      }
    );
    setState(() => {
        if (counter % 2 == 0) {
          oddEvenToggleColor = Colors.blue
        } else {
          oddEvenToggleColor = Colors.yellow
        }
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Stateful Page 5 With Counter " + counter.toString())),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Container(
              child: Text(
                'here is stateful page 5',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Container(
              child: ElevatedButton.icon(
                onPressed: () => goToPage6(1,Album(userId: 10, id: 2, title: 'this is a title')),
                icon: Icon(Icons.arrow_forward),
                label: Text('go to page 6'),
              ),
            ),
            Container(
              child: ElevatedButton.icon(
                onPressed: () => goToPage7WithFixedDetails(),
                icon: Icon(Icons.arrow_forward),
                label: Text('go to page 7'),
              ),
            ),
            Container(
              child: ElevatedButton.icon(
                onPressed: () => clickButton(),
                icon: Icon(Icons.arrow_forward),
                label: Text('a button'),
              ),
            ),
            Container(
              child: Text(
                buttonText,

              ),
              color: oddEvenToggleColor,
            ),
            Container(
              child: Text(
                counter.toString(),
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            FutureBuilder<Album>(
              future: futureAlbum,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  String output = snapshot.data.title;
                  return Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Text(output),
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                // By default, show a loading spinner.
                return CircularProgressIndicator();
              },
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: FutureBuilder<List<Album>>(
                future: futureAlbums,
                builder: (context, snapshot) {
                  assert(debugCheckHasMaterial(context));
                  if (snapshot.hasData) {
                    List<Album> dataList = snapshot.data;
                    for (var i = 0; i< dataList.length - 1; i++){
                      cardColors.add(Colors.blue);
                    }
                    return ListView.builder(
                      itemCount: dataList.length,
                      scrollDirection: Axis.vertical,
                      shrinkWrap:true,
                      itemBuilder: (context, index){
                        var album = dataList[index];
                        String output = album.id.toString() + ' ' + album.userId.toString() + ' ' + album.title;
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            GestureDetector(
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                  minWidth: 600.0
                                ),
                                child: Card(
                                  child: Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: Text(output),
                                  ),
                                  color: cardColors[index],                                
                                ),
                              ),
                              onTap: (){ 
                                _toggleCardColor(index, album);
                                print('you clicked on this card with content $output');
                              }
                            ),
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
        )
      ),
    );
  }
}

class Page6 extends StatelessWidget {
  int index = 0;
  Album album = null;
  final textController = TextEditingController();
  String _inputText = '';
  Page6({Key key, this.index, this.album}) : super(key: key);
  
  void _updateTextField(inputText){
    _inputText = inputText;
    print('text field has been updated to $_inputText');
    print('album.title ${album.title}');
  }

  void _submitForm(){
    print('form is being submitted');
  }

  @override
  Widget build(BuildContext context) {
    goToPage2() {
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.pop(context);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 6 - Stateless Page So Cannot Update Details'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Container(
              width: 500,
              child: ElevatedButton(
                onPressed: null,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('card index ${index.toString()}'),
                  ],
                ),
              ),
            ),
            Container(
              width:500,
              child: ElevatedButton(
                onPressed: null,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('album title - ${album.title}'),
                  ],
                ),
              ),
            ),
            Container(
              width: 500,
              child: ElevatedButton(
                onPressed: null,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('album id - ${album.id.toString()}'),
                  ],
                ),
              ),
            ),
            Container(
              width: 500,
              child: ElevatedButton(
                onPressed: null,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('album userId - ${album.userId.toString()}'),
                  ],
                ),
              ),
            ),
            Container(
              width: 500,
              child: ElevatedButton(
                onPressed: () => goToPage2(),
                child: Row(
                  children: <Widget>[
                    Text("Click To Go To Page 2"),
                    Icon(Icons.arrow_forward),
                  ],
                ),
              ),
            ),
            Container(
              width: 500,
              child: TextFormField(
                initialValue: album.id.toString(),
                decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'album id'),
                onChanged: (inputText) => {
                  _updateTextField(inputText)
                },
              ),
            ),
            Container(
              width: 500,
              child: TextFormField(
                initialValue: album.userId.toString(),
                decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'album userid'),
                onChanged: (inputText) => {
                  _updateTextField(inputText)
                },
              ),
            ),
            Container(
              width: 500,
              child: TextFormField(
                initialValue: album.title,
                decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'album title'),
                onChanged: (inputText) => {
                  _updateTextField(inputText)
                },
              ),
            ),
            Container(
              width: 500,
              child: ElevatedButton(
                onPressed: () => _submitForm(),
                child: Row(
                  children: <Widget>[
                    Text("Submit"),
                    Icon(Icons.arrow_forward),
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}

class Page7 extends StatefulWidget {
  int index;
  Album album;
  Page7({Key key, this.index, this.album}) : super(key: key);
  Page7State createState() => Page7State(key, this.index, this.album);
}


class Page7State extends State {
  
  Key key;
  int index;
  Album album;
  Album _postObject;
  final textController = TextEditingController();
  final url = "https://jsonplaceholder.typicode.com/albums";

  Page7State(Key key, this.index, this.album);

  void _updateUserId(userId){
    setState(() => {
      album = Album(userId: int.parse(userId), id: album.id, title: album.title)
    });
    print('user id has been updated to ${album.userId}');
  }
  
  void _updateTitle(title){
    setState(() => {
      album = Album(userId: album.userId, id: album.id, title: title)
    });
    print('title has been updated to ${album.title}');
  }
  
  void _submitFormAsPost() async {
    print('form is being submitted');
    try{
      final response = 
        await http.post(Uri.parse(url), body: jsonEncode(album));
      Map<String, dynamic> apiResponse = jsonDecode(response.body);
      print('post data - response is $apiResponse');
      
      setState(() => {
        _postObject = Album(id: apiResponse['id'], userId: album.userId, title: album.title)
      });
      print('post object is ' + jsonEncode(_postObject));
    } catch (error) {
      print('error ' + error.toString());
    }
  }

  void   _submitFormAsPut() async {
    print('form is being submitted as a PUT request');
    try{
      final response = 
        await http.put(Uri.parse(url + '/' + album.id.toString()), body: jsonEncode(album));
      Map<String, dynamic> apiResponse = jsonDecode(response.body);
      print('put data - request object is ' + jsonEncode(album));
      print('put data - response is $apiResponse');
    } catch (error) {
      print('error ' + error.toString());
    }
  }

  void _submitFormAsDelete() async {
    print('form is being submitted as a DELETE request');
    try{
      final response = 
        await http.delete(Uri.parse(url + '/' + album.id.toString()));
      Map<String, dynamic> apiResponse = jsonDecode(response.body);
      print('delete request - record index ${album.id.toString()} - response is $apiResponse');
    } catch (error) {
      print('error ' + error.toString());
    }
  }

  goToPage2() {
    Navigator.push(
      (context),
      MaterialPageRoute(builder: (context) => Page2()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Stateful Page 7 - Form Which Can Be Updated")),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Container(
              child: Text(
                'here is stateful page 7',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Container(
              child: Text(
                'index: $index',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Container(
              child: Text(
                'id: ${album.id}',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Container(
              child: Text(
                'userId: ${album.userId}',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Container(
              child: Text(
                'title: ${album.title}',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Container(
              width: 500,
              child: ElevatedButton(
                onPressed: null,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('card index ${index.toString()}'),
                  ],
                ),
              ),
            ),
            Container(
              width: 500,
              child: ElevatedButton(
                onPressed: null,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('album id - ${album.id.toString()}'),
                  ],
                ),
              ),
            ),
            Container(
              width: 500,
              child: ElevatedButton(
                onPressed: null,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('album userId - ${album.userId.toString()}'),
                  ],
                ),
              ),
            ),
            Container(
              width:500,
              child: ElevatedButton(
                onPressed: null,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('album title - ${album.title}'),
                  ],
                ),
              ),
            ),
            Container(
              width: 500,
              child: ElevatedButton(
                onPressed: () => goToPage2(),
                child: Row(
                  children: <Widget>[
                    Text("Click To Go To Page 2"),
                    Icon(Icons.arrow_forward),
                  ],
                ),
              ),
            ),
            Container(
              width: 500,
              child: TextFormField(
                enabled: false,
                initialValue: album.id.toString(),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'album id'
                ),
              ),
            ),
            Container(
              width: 500,
              child: TextFormField(
                initialValue: album.userId.toString(),
                decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'album userid'),
                onChanged: (userId) => {
                  _updateUserId(userId)
                },
              ),
            ),
            Container(
              width: 500,
              child: TextFormField(
                initialValue: album.title,
                decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'album title'),
                onChanged: (title) => {
                  _updateTitle(title)
                },
              ),
            ),
            Container(
              width: 500,
              child: ElevatedButton(
                onPressed: () => _submitFormAsPost(),
                child: Row(
                  children: <Widget>[
                    Text("Submit Form As Post ie Create New Record"),
                    Icon(Icons.arrow_forward),
                  ],
                ),
              ),
            ),
            Container(
              width: 500,
              child: ElevatedButton(
                onPressed: () => _submitFormAsPut(),
                child: Row(
                  children: <Widget>[
                    Text("Submit Form As Put ie Update Existing Record"),
                    Icon(Icons.arrow_forward),
                  ],
                ),
              ),
            ),
            Container(
              width: 500,
              child: ElevatedButton(
                onPressed: () => _submitFormAsDelete(),
                child: Row(
                  children: <Widget>[
                    Text("Submit Form As Delete ie Delete Existing Record"),
                    Icon(Icons.arrow_forward),
                  ],
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}
```

## secrets

to store api secret keys without pushing them to github see `weather_service.dart` for a worked example

### .env file

create `.env` file in the project root

```yaml
MY_API_KEY=1234
```

### read .env file

to read the file use this worked example

```java
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

var apiKey = 'invalid_api_key';

class WeatherService {
  Future<String> getApiKey() async {
    await dotenv.load(fileName: "../.env");
    apiKey = dotenv.env['WEATHER_SERVICE'] ?? 'invalid_api_key';
    print('weather service api key from .env file $apiKey');
    return apiKey;
  }

  Future<Weather> getWeather() async {
    print('getting weather');
    var url =
        'https://api.openweathermap.org/data/2.5/weather?lat=20&lon=20&appid=$apiKey';
    final response = await http.get(Uri.parse(url));
    print('response status ${response.statusCode}');
    if (response.statusCode == 200) {
      var weatherAsResponseBody = response.body;

      var weatherAsJson = json.decode(weatherAsResponseBody);
      print('weatherAsJson is $weatherAsJson');
      var weatherSubObject = weatherAsJson['weather'];
      print('weatherSubObject is $weatherSubObject');
      return Weather.fromJson(weatherSubObject[0]);
    } else {
      throw Exception('Failed to load weather');
    }
  }
}

class Weather {
  final int? id;
  final String? main;
  final String? description;
  final String? icon;

  Weather(
      {required this.id,
      required this.main,
      required this.description,
      required this.icon});

  Weather.createPostObject(id, main, description, icon)
      : id = id,
        main = main,
        description = description,
        icon = icon;

  Map<String, dynamic> toJson() =>
      {'id': id, 'main': main, 'description': description, 'icon': icon};

  Weather.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        main = json['main'],
        description = json['description'],
        icon = json['icon'];
}
```

then in our app we call the weather service using

```java
  getWeather() async {
    print('getWeather()');
    var weather = await weatherApi.getWeather();
    setState(() {
      var description = weather.description;
      print('the current weather is $description}');
      weatherToday = 'the weather today is .... $description';
    });
  }
```
