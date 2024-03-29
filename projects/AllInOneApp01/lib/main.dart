/// the goal of this app is to be an all-in-one demo app with as many features built into one app as possible
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
          child: Text('Page 2 With A GridView'),
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
        title: Text('Page 2 - Renders A GridView component with text inside each item'),
      ),
      body: GridView.count(
        crossAxisCount: 10,
        children: List.generate(20, (index) {
          if (index == 0) {
            return ElevatedButton(
              key:null, 
              onPressed: goToPage3,
              child: Text("Page 3 - Grid With Images")
            );
          } else if (index == 1){
            return ElevatedButton(
              key:null, 
              onPressed: goBack,
              child: Text("Back")
            );
          } else {
            return Center(
              child: Text(
                'Item $index',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            );
          }
        }),
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
        title: Text('Page 3 - renders a GridView component with images'),
      ),
      body: GridView.count(
        crossAxisCount: 10,
        children: List.generate(20, (index) {
          if (index == 0) {
            return ElevatedButton(
              key:null, 
              onPressed: goToPage4,
              child: Text("Page 4")
            );
          } else if (index == 1){
            return ElevatedButton(
              key:null, 
              onPressed: goBack,
              child: Text("Back")
            );
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Item $index',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Image(
                    image: NetworkImage('https://picsum.photos/120?random=$index'),
                  ),
                ]
              ),
            );
          }
        }),
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

    goToPage6(){
      print('going to stateful page 5');
      Navigator.of(context).push(
        MaterialPageRoute(builder:(context)=>Page5())
      );
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
              onPressed: goToPage6,
              child: Text("Page 6")
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


class Page6 extends StatelessWidget {
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
