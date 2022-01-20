/// This demonstrates 3 containers expanded to fill all of the available space equally
import 'package:flutter/material.dart';
void main() => runApp(const App());
class App extends StatelessWidget {
    const App({Key? key}): super(key:key);
    @override
    Widget build(BuildContext context){
        return MaterialApp(
            title:'An App',
            home: Scaffold(
                appBar:AppBar(title: const Text('Expanded Container')),
                body: Container(
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    children: [
                      Expanded(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(minWidth: double.infinity),
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xFFe0e0e0),
                            ),
                            child: Center(
                              child: const Text('This is a container'),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(vertical: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xFFd0d0d0),
                          ),
                          child: Center(
                            child: const Text('This is a container'),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(vertical: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xFFc0c0c0),
                          ),
                          child: Center(
                            child: const Text('This is a container'),
                          ),
                        ),
                      ),
                    ]
                  ),
                ),
            ),
        );
    }
}

