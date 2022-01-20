/// List02 - expanded list of tappable items, bounded by flex containers
import 'package:flutter/material.dart';
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
class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    log(output){
      int width = (MediaQuery.of(context).size.width).round();
      int height = (MediaQuery.of(context).size.height).round();
      print('$output printed with width $width height $height');
    }
    return Scaffold(
      appBar:AppBar(title: const Text('List02 - expanded list of tappable items, bounded by flex containers')),
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
                SizedBox(
                  height: ((MediaQuery.of(context).size.height).round())/15,
                  child: ListTile( 
                    leading: Icon(Icons.contacts),  
                    title: Text('Contact'),  
                    subtitle: Text('A sufficiently long subtitle warrants three lines yes yes yes yes yes yes A sufficiently long subtitle warrants three lines yes yes yes yes yes yes A sufficiently long subtitle warrants three lines yes yes yes yes yes yes A sufficiently long subtitle warrants three lines yes yes yes yes yes yes A sufficiently long subtitle warrants three lines yes yes yes yes yes yes A sufficiently long subtitle warrants three lines yes yes yes yes yes yes'),
                    onTap: () => log('Contact'),
                    tileColor: Color(0xFFb7dced),
                    dense: true,
                  ),                 
                ),
                SizedBox(
                  height: ((MediaQuery.of(context).size.height).round())/15,
                  child: ListTile(  
                    leading: Icon(Icons.settings),  
                    title: Text('Setting'),  
                    onTap: () => log('Setting'), 
                    tileColor: Color(0xFFb7dced),
                    dense: true,
                  ),
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
