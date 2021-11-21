//#region imports
import 'package:flutter/material.dart';
//#endregion imports
//#region main
void main() {
  print('running main app');
  runApp(App());
}
//#endregion main
//#region app
class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  static const String _title = 'Hello World';
  @override
  //#region widget builder
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(title: _title),
    );
  }
  //#endregion
}
//#endregion app
//#region home widget
class Home extends StatelessWidget {
  const Home({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text(title)),
    );
  }
}
//#endregion widget