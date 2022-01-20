/// Flex01 illustrates flexible use of space using ratios 1:2:3:4 for example
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
      double width = MediaQuery.of(context).size.width;
      print('$output printed with width $width');
    }

    return Scaffold(
      appBar:AppBar(title: const Text('Flex Ratios - use "flex" container with ratios eg 1:2:3:4 as here')),
      body: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(color: Colors.orange),
          ),
          Expanded(
            flex: 2,
            child: Container(color: Colors.green),
          ),
          Expanded(
            flex: 3,
            child: Container(color: Colors.purple),
          ),
          Expanded(
            flex: 4,
            child: Container(color: Colors.yellow),
          ),
        ]
      ),
    );
  }
}
