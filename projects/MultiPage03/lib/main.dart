import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UpdateButton(),
    );
  }
}
class UpdateButton extends StatefulWidget{
  UpdateButtonState createState() => UpdateButtonState();
}
class UpdateButtonState extends State{
  String textHolder = 'Old Sample Text';
  changeText(){
    setState(() {
      textHolder = 'New Sample Text';
    });
  }

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: Center(
        child: new ElevatedButton(
          key:null, 
          onPressed: () => changeText(),
          child: Text('$textHolder')
        ),
      ),
    );
  }
}
class Page1 extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: AppBar(
        title: Text('Page 1'),
      ),
    );
  }
}