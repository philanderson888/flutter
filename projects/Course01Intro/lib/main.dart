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
  int num = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateful App Starter Code - Counter ' + num.toString()),
        backgroundColor: Colors.red,
      ),
      body: const Text('app body'),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState( () {
            num++;
          });
        },
        backgroundColor: Colors.red,
        child: Icon(Icons.add),
      ),
    );
  }
}
