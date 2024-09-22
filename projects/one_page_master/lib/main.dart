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

  Album({this.userId = -1, this.id = -1, this.title = " "});

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
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color cardColor = Colors.blue;
  String cardColorString = "blue";
  // holds one album
  late Future<Album> futureAlbum;
  // holds list of albums
  late Future<List<Album>> futureAlbums;
  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
    futureAlbums = fetchAlbums();
  }

  void _toggleColor(){
    setState(() {
      if (cardColor == Colors.blue){
        print('toggling blue card to yellow');
        cardColor = Colors.yellow;
      } else {
        print('toggle yellow card to blue');
        cardColor = Colors.blue;
      }
    });
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
          children: <Widget>[
            Container(
              alignment: Alignment.center,
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
                  String output = snapshot.data?.title ?? "";
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
            Container(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Text(
                'all records',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            GestureDetector(
              child: Text('gesture detector'),
              onTap: (){ print('you tapped');},
            ),

            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: FutureBuilder<List<Album>>(
                  future: futureAlbums,
                  builder: (context, snapshot) {
                    assert(debugCheckHasMaterial(context));
                    if (snapshot.hasData) {
                      List<Album> dataList = snapshot.data ?? [];
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
                                      color: cardColor,
                                    ),
                                  ),
                                  onTap: (){
                                    _toggleColor();
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
        ),
      ),
    );
  }
}
