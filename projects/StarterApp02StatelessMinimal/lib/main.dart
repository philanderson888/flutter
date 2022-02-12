import 'package:flutter/material.dart';
void main() => runApp(const App());
class App extends StatelessWidget {
    const App({Key? key}): super(key:key);
    @override
    Widget build(BuildContext context){
        return MaterialApp(
            title:'An App',
            home: Scaffold(
                appBar:AppBar(title: const Text('An App')),
                body: const Text('some text'),
            ),
        );
    }
}
