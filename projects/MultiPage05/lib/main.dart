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

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
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
    print('going to page 6 - printing "context"');
    print(context);
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => Page6(data: _data, album: album)),
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
    const duration = 4;
    print('sleeping for $duration seconds');
    await Future.delayed(Duration(seconds: duration));
    print('sleep over');
    print('going to page 6 now');
    goToPage6(index, album);
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
                onPressed: () => goToPage6(0,null),
                icon: Icon(Icons.arrow_forward),
                label: Text('go to page 6'),
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
  String data = "";
  Album album = null;
  Page6({Key key, this.data, this.album}) : super(key: key);

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
        title: Text('Page 6 $data = ${album.title}'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Container(
              width: 250,
              child: ElevatedButton(
                onPressed: null,
                child: Row(
                  children: <Widget>[
                    Text('pass data from previous screen'),
                  ],
                ),
              ),
            ),
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
          ],
        ),
      )
    );
  }
}