// alert_02

// #region import
import 'package:flutter/material.dart';

// #endregion
// #region main
void main() {
  runApp(const App());
}

// #endregion
// #region App => MaterialApp => Home page
class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  static const String _title = 'Flutter';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(title: _title),
    );
  }
}

// #endregion
// #region Home state => _HomeState
class Home extends StatefulWidget {
  const Home({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<Home> createState() => _HomeState();
}

// #endregion
// #region _HomeState extends state
class _HomeState extends State<Home> {
  // #region initialise variables
  int _counter = 0;
  bool _ok = false;
  bool _cancel = false;
  // #endregion
  // #region incrementCounter()
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _registerAlertOK() {
    setState(() {
      _ok = true;
      _cancel = false;
      _counter++;
    });
    print('ok set to $_ok');
  }

  void _registerAlertCancel() {
    setState(() {
      _ok = false;
      _cancel = true;
      _counter++;
    });
    print('_cancel set to $_cancel');
  }

  // #endregion
  // #region widget builder
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // #region app bar
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // #endregion
      // #region body
      body: Center(
        // #region column
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            TextButton(
              style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(16.0),
                  primary: Colors.orange,
                  textStyle: const TextStyle(fontSize: 20)),
              onPressed: () => {
                _incrementCounter(),
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('This is an alert'),
                    content: const Text('This is an alert description.'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => {
                          print('You pressed "cancel"'),
                          _registerAlertCancel(),
                          Navigator.pop(context, 'Cancel')
                        },
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () => {
                          _registerAlertOK(),
                          print('You pressed "OK"'),
                          Navigator.pop(context, 'OK')
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                ),
              },
              child: const Text('Show Dialog'),
            ),
            Visibility(
              child: const Text(
                'You pressed OK button - well done',
              ),
              visible: _ok,
            ),
            Visibility(
              child: const Text(
                'You pressed the cancel button this time to cancel the dialog',
              ),
              visible: _cancel,
            ),
          ],
        ),
        // #endregion
      ),
      // #endregion
      // #region floating action button
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      // #endregion
    );
  }
// #endregion
}
// #endregion