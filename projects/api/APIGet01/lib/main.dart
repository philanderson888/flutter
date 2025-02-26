import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Album> fetchAlbum() async {
  final url = 'https://jsonplaceholder.typicode.com/albums/1';
  final response = await http.get(Uri.parse(url));
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
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print('server returned response of 200 with fetchAlbums()');
    var jsonOutput = json.decode(response.body);

    List<Album> list;
    list = (jsonOutput as List).map((album) => Album.fromJson(album)).toList();
    // // List<Album>.from(jsonOutput)
    // //   .map((Map model) => Album.fromJson(model)).toList();
    // final List<Album> list = json.decode(response.body)['result']
    //   .map((data) => Album.fromJson(data))
    //   .toList();
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
    //return Album.fromJson(json.decode(response.body));
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
        body: Center(
          child: Column(
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
