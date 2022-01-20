import 'package:flutter/material.dart';
void main() => runApp(const App());
class App extends StatelessWidget {
  const App({Key? key}): super(key:key);
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title:'An App',
      home: Scaffold(
        appBar:AppBar(title: const Text('A List containing tappable ListItems')),
        body: ListView(
          children: <Widget>[
            ListTile(  
              leading: Icon(Icons.map),  
              title: Text('Map'),  
              onTap: () => print('map'),
            ),  
            ListTile(  
              leading: Icon(Icons.photo_album),  
              title: Text('Album'),  
              onTap: () => print('Album'),
            ),  
            ListTile(  
              leading: Icon(Icons.phone),  
              title: Text('Phone'),  
              onTap: () => print('Phone'),
            ),  
            ListTile(  
              leading: Icon(Icons.contacts),  
              title: Text('Contact'),  
              onTap: () => print('Contact'),
            ),  
            ListTile(  
              leading: Icon(Icons.settings),  
              title: Text('Setting'),  
              onTap: () => print('Setting'), 
            ),  
          ],
        ),
      ),
    );
  }
}
