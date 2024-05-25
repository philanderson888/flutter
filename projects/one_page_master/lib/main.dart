// proper stateful app with

// 4 screens

// button counter

// back stack all working

// go from screen 4 to 2 as well

// all workign

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final textBackground = Color(0xFFC4F3E0);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StatefulHome(),
      theme: ThemeData(
        // applies to whole app if applied like this - fontFamily: 'Arial',
        colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: Colors.cyan[600]),
        textTheme: TextTheme(
          bodyText1: TextStyle(
            fontSize: 15,
            backgroundColor: textBackground,
            color: Color(0xFF2C0313),
          ),
        ),
      ),
    );
  }
}

class StatefulHome extends StatefulWidget {
  UpdateStatefulHome createState() => UpdateStatefulHome();
}

class UpdateStatefulHome extends State {
  String buttonText = 'some text';
  int counter = 0;
  clickButton() {
    counter++;
    setState(() => {
      if (counter % 2 == 0) {buttonText = 'Even'} else {buttonText = 'Odd'}
    });
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
        title: Center(child: Text("Home Screen")),
      ),
      body: Container(
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Container(
                child: Text(
                  'here is some text',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              Container(
                child: Text(
                  'here is some more text',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              Container(
                child: Text('here is a third line'),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: ElevatedButton(
                    key: null, onPressed: null, child: Text('a button')),
              ),
              Container(
                margin: EdgeInsets.all(5),
                child: Text('counter is $counter'),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.all(20),
                      child: Text(buttonText),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: ElevatedButton.icon(
                        autofocus: true,
                        clipBehavior: Clip.none,
                        onPressed: () => clickButton(),
                        icon: Icon(Icons.access_alarm),
                        label: Text(buttonText),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          padding: const EdgeInsets.all(30),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.lightBlue),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 15.0),
                      child: Text(counter.toString()),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                child: ElevatedButton(
                  autofocus: true,
                  clipBehavior: Clip.none,
                  onPressed: () => clickButton(),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFF5A9C6),
                    padding: const EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.lightBlue),
                    ),
                  ),
                  child: Text(
                    'go to next screen',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                child: ElevatedButton.icon(
                  onPressed: () => clickButton(),
                  icon: Icon(Icons.arrow_forward),
                  label: Text('a button'),
                ),
              ),
              Container(
                width: 250,
                child: ElevatedButton(
                  onPressed: () => goToPage2(),
                  child: Text("Click To Go To Page 2"),
                ),
              ),
              Tooltip(
                message: 'This is some help text to understand what to do ',
                child: const Text('This is some text without much explanation'),
                waitDuration: const Duration(seconds: 1),
                showDuration: const Duration(seconds: 4),
                height: 50,
                textStyle: const TextStyle(fontSize: 24),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: const LinearGradient(
                      colors: <Color>[Colors.amber, Colors.red]),
                ),
              ),
              Tooltip(
                message: 'Tooltip Help Text',
                child: Container(
                  width: 250,
                  child: ElevatedButton(
                    onPressed: () => goToPage2(),
                    child: Text("Click To Go To Page 2"),
                  ),
                ),
                waitDuration: const Duration(seconds: 1),
                showDuration: const Duration(seconds: 4),
                height: 50,
                textStyle: const TextStyle(fontSize: 24),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: const LinearGradient(
                      colors: <Color>[Colors.amber, Colors.red]),
                ),
              ),
            ],
          )),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    goToPage3() {
      Navigator.push(
        (context),
        MaterialPageRoute(builder: (context) => Page3()),
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('Page 2'),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Container(
                width: 250,
                child: ElevatedButton(
                  onPressed: () => goToPage3(),
                  child: Row(
                    children: <Widget>[
                      Text("Click To Go To Page 3"),
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    goToPage4() {
      Navigator.push(
        (context),
        MaterialPageRoute(builder: (context) => Page4()),
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('Page 3'),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Container(
                width: 250,
                child: ElevatedButton(
                  onPressed: () => goToPage4(),
                  child: Row(
                    children: <Widget>[
                      Text("Click To Go To Page 4"),
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class Page4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    goToPage2() {
      Navigator.pop(context);
      Navigator.pop(context);
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('Page 4'),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Container(
                width: 250,
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
            ],
          ),
        ));
  }
}
