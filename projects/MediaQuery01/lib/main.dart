import 'package:flutter/material.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      home: Home() 
    );
  }
}

class Home extends StatelessWidget{
  int fraction = 5;
  _printMediaQuery(width, height){
    print('screen width $width height $height of type ${height.runtimeType}');
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
          body: Container( 
            width: MediaQuery.of(context).size.width / fraction,
            height: MediaQuery.of(context).size.height / fraction, 
            child: ElevatedButton(
              onPressed: () => _printMediaQuery(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height),
              child: Text('this button is a fraction 1/$fraction of the screen size height and width'),
            ),
          )
       );
  }
}