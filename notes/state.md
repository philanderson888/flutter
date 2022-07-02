# state

## contents

- [state](#state)
  - [contents](#contents)
  - [introduction](#introduction)
  - [reference](#reference)
  - [creating a stateful widget](#creating-a-stateful-widget)
  - [worked example](#worked-example)
  - [template - stateless and stateful multipage](#template---stateless-and-stateful-multipage)
  - [stateful methods](#stateful-methods)
  - [`getx` state management](#getx-state-management)

## introduction

stateless widgets cannot be altered - they are `immutable` so a new instance has to be created from scratch, we cannot alter an existing instance.

stateful widgets can have their values altered.

## reference

- Stateful - When To Use Keys https://www.youtube.com/watch?v=kn0EOS-ZiIc

## creating a stateful widget

a stateful widget needs to implement two classes

- State
- StatefulWidget

when we change the state we do this calling

- setState()

we have our first class which extends `StatefulWidget` and overrides `createState()` and this builds an instance of our `_AppState` which overrides the `build()` method to build our state objects which hold stateful which can change.

```java
/// Stateful [App] overrides [createState()] to create its own state
class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

/// [_AppState] holds the actual state so extends [State<App>] and also has an overridden [build()] method
class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: const Text('this is an app')),
      ),
    );
  }
}
```






## worked example

in [MultiPage05](../projects/MultiPage05) we see that in `Page6` this is a stateless widget but we convert this into a stateful widget in `Page7`.  Clicking on the index 0 or 1 in `Page5` sends us to `Page6` (stateless) and clicking on any other index sends us to `Page7` where we can edit the form fields.

```java
class Page6 extends StatelessWidget {
  int index = 0;
  Album album = null;
  final textController = TextEditingController();
  String _inputText = '';
  Page6({Key key, this.index, this.album}) : super(key: key);
  
  void _updateTextField(inputText){
    _inputText = inputText;
    print('text field has been updated to $_inputText');
    print('album.title ${album.title}');
  }

  void _submitForm(){
    print('form is being submitted');
  }

  @override
  Widget build(BuildContext context) {
    goToPage2() {
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.pop(context);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 6 - Stateless Page So Cannot Update Details'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Container(
              width: 500,
              child: ElevatedButton(
                onPressed: null,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('card index ${index.toString()}'),
                  ],
                ),
              ),
            ),
            Container(
              width:500,
              child: ElevatedButton(
                onPressed: null,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('album title - ${album.title}'),
                  ],
                ),
              ),
            ),
            Container(
              width: 500,
              child: ElevatedButton(
                onPressed: null,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('album id - ${album.id.toString()}'),
                  ],
                ),
              ),
            ),
            Container(
              width: 500,
              child: ElevatedButton(
                onPressed: null,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('album userId - ${album.userId.toString()}'),
                  ],
                ),
              ),
            ),
            Container(
              width: 500,
              child: ElevatedButton(
                onPressed: () => goToPage2(),
                child: Row(
                  children: <Widget>[
                    Text("Click To Go To Page 2"),
                    Icon(Icons.arrow_forward),
                  ],
                ),
              ),
            ),
            Container(
              width: 500,
              child: TextFormField(
                initialValue: album.id.toString(),
                decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'album id'),
                onChanged: (inputText) => {
                  _updateTextField(inputText)
                },
              ),
            ),
            Container(
              width: 500,
              child: TextFormField(
                initialValue: album.userId.toString(),
                decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'album userid'),
                onChanged: (inputText) => {
                  _updateTextField(inputText)
                },
              ),
            ),
            Container(
              width: 500,
              child: TextFormField(
                initialValue: album.title,
                decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'album title'),
                onChanged: (inputText) => {
                  _updateTextField(inputText)
                },
              ),
            ),
            Container(
              width: 500,
              child: ElevatedButton(
                onPressed: () => _submitForm(),
                child: Row(
                  children: <Widget>[
                    Text("Submit"),
                    Icon(Icons.arrow_forward),
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
```

this is fine if we just wish to deal with static data, but what if we wish to update the values of the instance `album` as we type text into the text fields?

Let us convert this widget into a stateful widget.

```java
class Page7 extends StatefulWidget {
  int index;
  Album album;
  Page7({Key key, this.index, this.album}) : super(key: key);
  Page7State createState() => Page7State(key, this.index, this.album);
}


class Page7State extends State {
  
  Key key;
  int index;
  Album album;
  final textController = TextEditingController();

  Page7State(Key key, this.index, this.album);

  void _updateUserId(userId){
    setState(() => {
      album = Album(userId: int.parse(userId), id: album.id, title: album.title)
    });
    print('user id has been updated to ${album.userId}');
  }
  
  void _updateTitle(title){
    setState(() => {
      album = Album(userId: album.userId, id: album.id, title: title)
    });
    print('title has been updated to ${album.title}');
  }
  
  void _submitForm(){
    print('form is being submitted');
  }

  goToPage2() {
    Navigator.push(
      (context),
      MaterialPageRoute(builder: (context) => Page2()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Stateful Page 7 - Form Which Can Be Updated")),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Container(
              child: Text(
                'here is stateful page 7',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Container(
              child: Text(
                'index: $index',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Container(
              child: Text(
                'id: ${album.id}',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Container(
              child: Text(
                'userId: ${album.userId}',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Container(
              child: Text(
                'title: ${album.title}',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Container(
              width: 500,
              child: ElevatedButton(
                onPressed: null,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('card index ${index.toString()}'),
                  ],
                ),
              ),
            ),
            Container(
              width: 500,
              child: ElevatedButton(
                onPressed: null,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('album id - ${album.id.toString()}'),
                  ],
                ),
              ),
            ),
            Container(
              width: 500,
              child: ElevatedButton(
                onPressed: null,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('album userId - ${album.userId.toString()}'),
                  ],
                ),
              ),
            ),
            Container(
              width:500,
              child: ElevatedButton(
                onPressed: null,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('album title - ${album.title}'),
                  ],
                ),
              ),
            ),
            Container(
              width: 500,
              child: ElevatedButton(
                onPressed: () => goToPage2(),
                child: Row(
                  children: <Widget>[
                    Text("Click To Go To Page 2"),
                    Icon(Icons.arrow_forward),
                  ],
                ),
              ),
            ),
            Container(
              width: 500,
              child: TextFormField(
                enabled: false,
                initialValue: album.id.toString(),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'album id'
                ),
              ),
            ),
            Container(
              width: 500,
              child: TextFormField(
                initialValue: album.userId.toString(),
                decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'album userid'),
                onChanged: (userId) => {
                  _updateUserId(userId)
                },
              ),
            ),
            Container(
              width: 500,
              child: TextFormField(
                initialValue: album.title,
                decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'album title'),
                onChanged: (title) => {
                  _updateTitle(title)
                },
              ),
            ),
            Container(
              width: 500,
              child: ElevatedButton(
                onPressed: () => _submitForm(),
                child: Row(
                  children: <Widget>[
                    Text("Submit"),
                    Icon(Icons.arrow_forward),
                  ],
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}
```

## template - stateless and stateful multipage

Please see [Stateless03](../projects/Stateless03) or [StarterApp06MultipageStatefulAndStateless](../projects/StarterApp06MultipageStatefulAndStateless) or see the code below for an example of a stateless app with a stateful page inside the app

```java
import 'package:flutter/material.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    ); 
  }
}
class Home extends StatelessWidget {
  @override  
  Widget build (BuildContext context) {
    goToPage2(){
      print('you clicked');
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => Page2()),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: ElevatedButton(
          key: null,
          onPressed: goToPage2,
          child: Text('Page 2'),
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    goToPage3(){
      print('going to page 3');
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => Page3()),
      );
    }
    goBack(){
      print('going back');
      Navigator.pop(context);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Page2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            ElevatedButton(
              key:null, 
              onPressed: goToPage3,
              child: Text("Page 3")
            ),
            ElevatedButton(
              key:null, 
              onPressed: goBack,
              child: Text("Back")
            ),
          ],
        ),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context){
     goToPage4(){
      print('going to page 4');
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => Page4()),
      );
    }
    goBack(){
      print('going back');
      Navigator.pop(context);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Page3'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            ElevatedButton(
              key:null, 
              onPressed: goToPage4,
              child: Text("Page 4")
            ),
            ElevatedButton(
              key:null, 
              onPressed: goBack,
              child: Text("Back")
            ),
          ],
        ),
      ),
    );
  }
}

class Page4 extends StatelessWidget {
  @override
  Widget build(BuildContext context){
   goToPage5(){
      print('going to stateful page 5');
      Navigator.of(context).push(
        MaterialPageRoute(builder:(context)=>Page5())
      );
   }
   goBack(){
    print('going back');
    Navigator.pop(context);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Page4'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            ElevatedButton(
              key:null, 
              onPressed: goToPage5,
              child: Text("Page 5")
            ),
            ElevatedButton(
              key:null, 
              onPressed: goBack,
              child: Text("Back")
            ),
          ],
        ),
      ),
    );
  }
}

class Page5 extends StatefulWidget {
  Page5State createState() => Page5State();
}

class Page5State extends State {
  int counter = 0;

  @override
  Widget build(BuildContext context){

    incrementCounter(){
      setState(() => {
        counter++
      });
      print('incrementing counter to $counter');
    }

    goBack(){
      print('going back');
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Stateful Page 5 - State Held In Counter - Value $counter')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            ElevatedButton(
              key:null, 
              onPressed: incrementCounter,
              child: Text("Increment Counter $counter")
            ),
            ElevatedButton(
              key:null, 
              onPressed: goBack,
              child: Text("Back")
            ),
          ],
        ),
      ),
    );
  }
}
```

## stateful methods

```java
void initState(){}
Widget build(BuildContext context) {   return null; }
void deactivate(){}
```

## `getx` state management

see this example for using the `getx` library to manage complex state https://www.kindacode.com/article/using-getx-get-for-state-management-in-flutter/