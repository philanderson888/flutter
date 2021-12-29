/// This is an application to demonstrate the ability of an app to create the base app as a stateless app, but add a stateful page as part of the app.
/// Pages Home, Page2, Page3, Page4 are stateless
/// Page5 is stateful and can be used to remember the state of a counter object which increments through clicking the button
import 'package:flutter/material.dart';
/// [main] just bootstraps and runs the app, that's all
void main() => runApp(MyApp());
/// Stateless [MyApp]
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
/// Stateless [Home] 
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

/// Stateless [Page2]
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

/// Stateless [Page3]
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

/// Stateless [Page4]
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

/// Stateful [Page5]
class Page5 extends StatefulWidget {
  Page5State createState() => Page5State();
}

/// State of [Page5] held in [Page5State]
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
