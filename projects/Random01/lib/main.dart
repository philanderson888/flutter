import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Generated App',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xFF2196f3),
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: const Color(0xFF2196f3)),
        canvasColor: const Color(0xFFfafafa),
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('App Name'),
      ),
      body: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Text(
              "qWerty1",
              style: new TextStyle(
                  fontSize: 12.0,
                  color: const Color(0xFF000000),
                  fontWeight: FontWeight.w200,
                  fontFamily: "Roboto"),
            ),
            Icon(Icons.insert_emoticon,
                color: const Color(0xFF000000), size: 48.0),
            ElevatedButton(
                key: null,
                onPressed: buttonPressed,
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFF5A9C6), 
                  padding: const EdgeInsets.all(15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.lightBlue),
                  ),
                ),
                child: new Text(
                  "BUTTON 2",
                  style: new TextStyle(
                      fontSize: 12.0,
                      color: const Color(0xFF000000),
                      fontWeight: FontWeight.w200,
                      fontFamily: "Roboto"),
                )),
            new Icon(Icons.insert_emoticon,
                color: const Color(0xFF000000), size: 48.0),
            new TextField(
              style: new TextStyle(
                  fontSize: 12.0,
                  color: const Color(0xFF000000),
                  fontWeight: FontWeight.w200,
                  fontFamily: "Roboto"),
            ),
            new Radio(
                key: null,
                groupValue: null,
                value: .5,
                onChanged: radioChanged),
            new Checkbox(key: null, onChanged: checkChanged, value: true),
            new Switch(onChanged: switchChanged, value: true),
            new Slider(
              key: null,
              onChanged: sliderChanged,
              value: 0.35,
            ),
          ]),
    );
  }

  void switchChanged(bool value) {}

  void sliderChanged(double value) {}

  void buttonPressed() {}

  void checkChanged(bool value) {}

  void radioChanged(double value) {}
}
