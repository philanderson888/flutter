/// This illustrates use of lists with API material and building a `ListView` of `ListItem` components
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
void main() => runApp(const App());
class App extends StatelessWidget {
  const App({Key? key}): super(key:key);
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title:'An App',
      home: Home()
    );
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
extension StringExtension on String {
  String truncateTo(int maxLength) =>
      (this.length <= maxLength) ? this : '${this.substring(0, maxLength)}...';
}
class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    log(output){
      int width = (MediaQuery.of(context).size.width).round();
      int height = (MediaQuery.of(context).size.height).round();
      print('$output printed with width $width height $height');
    }
    return Scaffold(
      appBar:AppBar(title: const Text('A List containing tappable ListItems')),
      body: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Expanded(
            flex: 2,
            child: ListView(
              itemExtent: ((MediaQuery.of(context).size.height).round())/7,
              children: <Widget>[                
                ListTile(  
                  leading: Icon(Icons.map),  
                  title: Text('Map'),  
                  onTap: () => log('map'),
                  tileColor: Color(0xFFb7dced),
                  dense: true,
                ),  
                ListTile(  
                  leading: Icon(Icons.photo_album),  
                  title: Text('Album'),  
                  onTap: () => log('Album'),
                  tileColor: Color(0xFFb7dced),
                  dense: true,
                ),  
                ListTile(  
                  leading: Icon(Icons.phone),  
                  title: Text('Phone'),  
                  subtitle: Text('subtitle'),
                  onTap: () => log('Phone'),
                  tileColor: Color(0xFFb7dced),
                  dense: true,
                ),  
                ListTile(  
                  leading: Icon(Icons.contacts),  
                  title: Text('Contact'),  
                  subtitle: Text('A sufficiently long subtitle warrants three lines yes yes yes yes yes yes'),
                  onTap: () => log('Contact'),
                  tileColor: Color(0xFFb7dced),
                  dense: true,
                ),  
                ListTile( 
                  leading: Icon(Icons.contacts),  
                  title: Text('Contact'),  
                  subtitle: Expanded(
                    overflow: TextOverflow.ellipsis,
                    child: Text('A sufficiently long subtitle warrants three lines yes yes yes yes yes yes  A sufficiently long subtitle warrants three lines yes yes yes yes yes yes A sufficiently long subtitle warrants three lines yes yes yes yes yes yes A sufficiently long subtitle warrants three lines yes yes yes yes yes yes A sufficiently long subtitle warrants three lines yes yes yes yes yes yes A sufficiently long subtitle warrants three lines yes yes yes yes yes yes', 
                      softWrap: false, 
                      overflow: TextOverflow.ellipsis,                    
                    ),
                  ),
                  onTap: () => log('Contact'),
                  tileColor: Color(0xFFb7dced),
                  dense: true,
                ),                 
                ListTile(  
                  leading: Icon(Icons.settings),  
                  title: Text('Setting'),  
                  onTap: () => log('Setting'), 
                  tileColor: Color(0xFFb7dced),
                  dense: true,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(),
          ),
        ]
      ),
    );
  }
}
