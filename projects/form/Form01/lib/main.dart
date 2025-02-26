/// Form01 simply lays the ground work for creating a very simple form app.  This is the core and is just basically a stateless widget empty app
import 'package:flutter/material.dart';
/// [main] just runs the [App]
void main() => runApp(const App());
/// [App] is Stateless
class App extends StatelessWidget {
    const App({Key? key}): super(key:key);
    @override
    /// [build()] builds the stateless app and returns a Material App with [AppBar] and [Text]
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

