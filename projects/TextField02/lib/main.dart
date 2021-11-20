// #region import
import 'package:flutter/material.dart';
import 'dart:math' as math;

// #endregion
// #region main
void main() {
  runApp(const App());
}

// #endregion
// #region App => MaterialApp => Home page
class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(title: 'Flutter Card List View Demo'),
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
// #region _HomeState widget
class _HomeState extends State<Home> {
  // #region initialise variables
  int _counter = 0;
  bool _ok = false;
  bool _cancel = false;
  String dropdownValue = 'One';
  String _inputText = '';
  // #endregion
  // #region methods()
  // #region incrementCounter()
  void _incrementCounter() {
    setState(() {
      _counter++;
      print('you have clicked the counter $_counter times');
    });
  }

  // #endregion
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
  void _updateTextField(inputText) {
    setState(() {
      _inputText = inputText;
    });
    print('text field has been updated to $_inputText');
  }

  // #endregion
  // #region widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // #region app bar
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // #endregion
      // #region list view
      body: ListView(
          padding: const EdgeInsets.all(100),
          shrinkWrap: true,
          children: <Widget>[
            // #region columns and rows
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Text('Row 1'),
                ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Text('Row 2'),
                ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Text('Row 3'),
                ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Text('Row 4'),
                  Text('Item 1'),
                  Text('Item 2'),
                  Text('Item 3'),
                  Text('Item 4'),
                  Text('Item 5'),
                ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Text('Row 5'),
                  Card(child: Text('Card 1')),
                  Card(child: Text('Card 2')),
                  Card(child: Text('Card 3')),
                ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              const Text('Row 6 With Columns'),
              const Card(child: Text('Row 6 Card 1')),
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text('Row 6 Column '),
                    const Card(
                        color: Colors.yellow,
                        child: Text('Row 6 Column 1 Card 1')),
                    const Card(
                        color: Colors.blue,
                        child: Text('Row 6 Column 1 Card 2')),
                    const Card(
                      child: Text(
                        'Row 6 Column 1 Card 3',
                        style: TextStyle(color: Colors.green),
                      ),
                      color: Colors.red,
                    ),
                    const Card(
                      child: Text(
                        'Row 6 Column 1 Card 4 with Hex colour',
                        style: TextStyle(color: Colors.green),
                      ),
                      color: Color(0xffede49f),
                    ),
                    const Card(
                        child: Text(
                          'Row 6 Column 1 Card 5 with RGB colour',
                          style: TextStyle(color: Colors.green),
                        ),
                        color: Color.fromRGBO(100, 100, 100, 1.0)),
                    Card(
                      child: GestureDetector(
                          child: Card(
                            child: Text(
                              'clickable card - $_counter clicks',
                              style: const TextStyle(color: Color(0xffede49f)),
                            ),
                            color: const Color(0xffb25adb),
                          ),
                          onTap: () => {
                                print('you clicked $_counter times'),
                                _incrementCounter()
                              }),
                    ),
                  ]),
            ]),
            // #endregion
            // #region cards
            const Card(child: ListTile(title: Text('List Tile 1'))),
            const Card(child: ListTile(title: Text('List Tile 2'))),
            const Card(child: ListTile(title: Text('List Tile 3'))),
            const Card(child: ListTile(title: Text('List Tile 4'))),
            const Card(child: ListTile(title: Text('List Tile 5'))),
            const Card(
              child: ListTile(
                leading: FlutterLogo(),
                title: Text('One-line with flutter widgets'),
                trailing: FlutterLogo(),
              ),
            ),
            const Card(
              child: ListTile(
                leading: Icon(Icons.more_vert),
                title: Text('One line with icons'),
                trailing: Icon(Icons.more_vert),
              ),
            ),
            const Card(
              child: ListTile(
                title: Text('One-line dense ListTile'),
                dense: true,
              ),
            ),
            // #endregion
            // #region containers with gestures
            Container(
              child: GestureDetector(
                  child: Card(
                    child: Text(
                      'clickable card - $_counter clicks',
                      style: const TextStyle(color: Color(0xff000000)),
                    ),
                    color: const Color(0xffbbbbbb),
                  ),
                  onTap: () => {
                        print('you clicked $_counter times'),
                        _incrementCounter()
                      }),
              margin: const EdgeInsets.all(10),
              color: const Color(0xffb25adb),
              width: 48.0,
              height: 48.0,
            ),
            Container(
              child: GestureDetector(
                onTap: () =>
                    {print('you clicked $_counter times'), _incrementCounter()},
                child: Text('This is a clickable container $_counter clicks',
                    style: Theme.of(context).textTheme.headline4),
              ),
              margin: const EdgeInsets.all(10),
              color: const Color(0xffb25adb),
              width: 48.0,
              height: 48.0,
            ),
            Container(
              child: GestureDetector(
                onTap: () =>
                    {print('you clicked $_counter times'), _incrementCounter()},
                child: Text('This is a clickable container $_counter clicks',
                    style: Theme.of(context).textTheme.headline4),
              ),
              color: Colors.blue[600],
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              alignment: Alignment.center,
            ),
            Container(
              color: Colors.blue[600],
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              alignment: Alignment.center,
              transform: Matrix4.rotationZ(1 * math.pi / 180),
              child: GestureDetector(
                  child: Text('This is a clickable container $_counter clicks',
                      style: Theme.of(context).textTheme.headline4),
                  onTap: () => {
                        print('you clicked $_counter times'),
                        _incrementCounter()
                      }),
            ),
            // #endregion
            // #region card with list tile and images
            Card(
              child: ListTile(
                leading: ConstrainedBox(
                  constraints: const BoxConstraints(
                    minWidth: 100,
                    minHeight: 100,
                  ),
                  child:
                      Image.network('https://picsum.photos/100/100?random=1'),
                ),
                title: const Text('One-line with flutter widgets'),
                trailing: ConstrainedBox(
                    constraints: const BoxConstraints(
                      minWidth: 100,
                      minHeight: 100,
                    ),
                    child: Image.network(
                        'https://picsum.photos/100/100?random=2')),
              ),
            ),
            Container(
              child: GestureDetector(
                onTap: () =>
                    {print('you clicked $_counter times'), _incrementCounter()},
                child: Image.network('https://picsum.photos/300/100?random=3'),
              ),
              color: Colors.blue[600],
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              alignment: Alignment.center,
            ),
            // #region image row
            Row(crossAxisAlignment: CrossAxisAlignment.center, children: <
                Widget>[
              GestureDetector(
                onTap: () =>
                    {print('you clicked $_counter times'), _incrementCounter()},
                child: Image.network('https://picsum.photos/100/100?random=4'),
              ),
              Image.network('https://picsum.photos/100/100?random=5'),
              GestureDetector(
                onTap: () =>
                    {print('you clicked $_counter times'), _incrementCounter()},
                child: Image.network('https://picsum.photos/100/100?random=6'),
              ),
            ]),
            // #endregion
            //#region alert
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
            //#region visibility
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
            Visibility(
              child: GestureDetector(
                onTap: () =>
                    {print('you clicked $_counter times'), _incrementCounter()},
                child: Image.network(
                  'https://pbs.twimg.com/profile_images/1028914886879969282/5y9keC13_400x400.jpg',
                  width: 100,
                  height: 100,
                ),
              ),
              visible: _ok,
            ),
            Visibility(
              child: GestureDetector(
                onTap: () =>
                    {print('you clicked $_counter times'), _incrementCounter()},
                child: Image.network(
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7d/Crystal_Clear_action_button_cancel.svg/1200px-Crystal_Clear_action_button_cancel.svg.png',
                  width: 100,
                  height: 100,
                ),
              ),
              visible: _cancel,
            ),
            //#endregion
            //#region dropdown
            DropdownButton<String>(
              value: dropdownValue,
              onTap: () => print('about to make a dropdown box selection'),
              onChanged: (String? newValue) {
                print('you chose item $newValue (was $dropdownValue)');
                setState(() {
                  dropdownValue = newValue!;
                });
              },
              items: <String>['One', 'Two', 'Three']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                    value: value, child: Text(value));
              }).toList(),
            ),
            //#endregion
            //#region textfield
            TextField(
              decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter some text here'),
              onChanged: (inputText) => {
                _updateTextField(inputText)
              }
            ),
            //#region textlabel
            const Text(
              'This is a text field',
            ),
            Text(
              _inputText,
            ),
            //#endregion
            //#endregion
            //#endregion
          ]),
      // #endregion
      // #region action button
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
