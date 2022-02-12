import 'package:flutter/material.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
    const App({Key? key}): super(key:key);
    @override
    Widget build(BuildContext context){
        return MaterialApp(
            home: MainPage(),
        );
    }
}

class MainPage extends StatefulWidget {
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateful App Starter Code')
      ),
      body: const Text('app body'),
    );
  }
}
