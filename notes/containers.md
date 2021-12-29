# containers and layout

## contents

- [containers and layout](#containers-and-layout)
  - [contents](#contents)
  - [introduction](#introduction)
    - [Body Is A Single Container](#body-is-a-single-container)
    - [body: Center( child:Container()  )  will fill the screen](#body-center-childcontainer----will-fill-the-screen)
    - [Container With Shadow](#container-with-shadow)
    - [animated container](#animated-container)
  - [flexible](#flexible)
  - [sizedbox](#sizedbox)

## introduction

Container must have a parent which is
- Center
- Padding
- Column
- Row
- Scaffold

By default container will fill the screen 

If it has a child the container will take up the width and height of the child



### Body Is A Single Container

```java
class Home extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Home Screen")),
      ),
      body: Container
        (
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('some text'),
              Text('some more text').
            ],
          )
        ),
    );
  }
}
```

### body: Center( child:Container()  )  will fill the screen

*Note: container with a parent of Center by default will fill the screen*

```java
Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Home Screen")),
      ),   
      body: Center(
        child:Container(
          color: Colors.green,
        ),
      ),
    );
  }
```

### Container With Shadow

*Note : a button cannot have a shadow but must be put in a container which has a shadow*


```java
Container(
  decoration: BoxDecoration(
    boxShadow:[
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 5,
        blurRadius: 7,
        offset: Offset(0, 3), // changes position of shadow
      ),
    ],
  ),
  child: ElevatedButton(
    autofocus: true,
    clipBehavior: Clip.none,
    onPressed: () => clickButton(),
    color: Colors.blue,
    padding: const EdgeInsets.all(30),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18.0),
      side: BorderSide(color: Colors.lightBlue),
    ),
    child: Text(buttonText, 
        style: TextStyle(
          color: Colors.white,
          backgroundColor: Colors.blue,
        ),
      ),
  ),
),
```

### animated container

see [AllFeatures02](../projects/AllFeatures02)

```java
Container(
  margin: EdgeInsets.symmetric(vertical: 10.0),
  child: AnimatedContainer(
    height: sideLength,
    width: sideLength,
    duration: const Duration(seconds: 2),
    curve: Curves.easeIn,
    child: Material(
      color: Colors.yellow,
      child: InkWell(
        onTap: () {
          setState(() {
            sideLength == 50 ? sideLength = 100 : sideLength = 50;
          });
        },
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Animated Container', 
              style: TextStyle(fontSize:22),
            ),
          ),
        ),
      ),
    ),
  ),
),
```

## flexible

flexible allows a component which may have unlimited size to fit inside a given region on the screen.  So, for example, we might have a scrolling list of objects on the screen and only display and render a few of them at a time.  But the containing object is held in fixed size on the screen for the user as a bounding box for the scrolling content

see [Flexible01](../projects/Flexible01)

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
  bool _isHover = false;
  Color cardColor = Colors.blue;
  String cardColorString = "blue";
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

  void _toggleColor(){
    setState(() {
      print('setting color state');
      if (cardColor == Colors.blue){
        print('card is blue');
        cardColor = Colors.yellow;
      } else {
        print('card is yellow - toggling to blue');
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
                    List<Album> dataList = snapshot.data;
                    return ListView.builder(
                      itemCount: dataList.length,
                      scrollDirection: Axis.vertical,
                      shrinkWrap:true,
                      itemBuilder: (context, index){
                        var album = dataList[index];
                        String output = album.id.toString() + ' ' + album.userId.toString() + ' ' + album.title;
                        print(output);
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
```

## sizedbox

here is an example of laying out a row with a fixed size given to one of the items using a `sizedbox` component

```java
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
    SizedBox(
      width: 200,
      child: TextFormField(
        controller: _controller02,
        keyboardType: TextInputType.numberWithOptions(decimal: true,signed: false),
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        ],
        decoration: const InputDecoration(
          hintText: 'number',
          labelText: 'number',
        ),
      ),
    ),
    Flexible(
      child: IconButton(
        icon: Icon(
          Icons.add,
        ),
        iconSize: 16.0,
        onPressed: incrementCounter02,
      ),
    ),
    Flexible(
      child: IconButton(
        icon: Icon(
          Icons.remove,
        ),
        iconSize: 16.0,
        onPressed: decrementCounter02,
      ),  
    ),
  ]
),
```