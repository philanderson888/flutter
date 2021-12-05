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
    body: jsonEncode(<String, String>{'title': title, 'userId': '4'}),
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
