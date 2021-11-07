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
