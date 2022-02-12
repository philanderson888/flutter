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
   goBack(){
    print('going back');
    Navigator.pop(context);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Page4'),
      ),
      body: Center(
        child: ElevatedButton(
          key: null,
          onPressed: goBack,
          child: Text('go back'),
        ),
      ),
    );
  }
}
