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
  Widget build(BuildContext context) {
    goToPage2() {
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
  Widget build(BuildContext context) {
    goToPage3() {
      print('going to page 3');
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => Page3()),
      );
    }

    goToBlankPageTemplate() {
      print('going to blank page template');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => BlankPageTemplate()));
    }

    goToCourseLayoutExercise() {
      print('going to course layout exercise');
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => CourseLayoutExercise()));
    }

    goToCourseBusinessCard01() {
      print('going to course layout exercise');
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => CourseBusinessCard01()));
    }

    goBack() {
      print('going back');
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Main Index Gridview'),
      ),
      body: GridView.count(
        crossAxisCount: 10,
        children: List.generate(20, (index) {
          if (index == 0) {
            return ElevatedButton(
                key: null,
                onPressed: goToPage3,
                child: Text("Page 3 - Grid With Images"));
          } else if (index == 1) {
            return ElevatedButton(
                key: null, onPressed: goBack, child: Text("Back"));
          } else if (index == 6) {
            return ElevatedButton(
                key: null,
                onPressed: goToBlankPageTemplate,
                child: Text("Blank Page Template"));
          } else if (index == 7) {
            return ElevatedButton(
                key: null,
                onPressed: goToCourseLayoutExercise,
                child: Text("Course Layout Exercise"));
          } else if (index == 8) {
            return ElevatedButton(
                key: null,
                onPressed: goToCourseBusinessCard01,
                child: Text("Course Business Card"));
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
  Widget build(BuildContext context) {
    goToPage4() {
      print('going to page 4');
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => Page4()),
      );
    }

    goBack() {
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
                key: null, onPressed: goToPage4, child: Text("Page 4"));
          } else if (index == 1) {
            return ElevatedButton(
                key: null, onPressed: goBack, child: Text("Back"));
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
                      image: NetworkImage(
                          'https://picsum.photos/120?random=$index'),
                    ),
                  ]),
            );
          }
        }),
      ),
    );
  }
}

class Page4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    goToPage5() {
      print('going to stateful page 5');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Page5()));
    }

    goBack() {
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
          children: <Widget>[
            ElevatedButton(
                key: null, onPressed: goToPage5, child: Text("Page 5")),
            ElevatedButton(key: null, onPressed: goBack, child: Text("Back")),
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
  Widget build(BuildContext context) {
    incrementCounter() {
      setState(() => {counter++});
      print('incrementing counter to $counter');
    }

    goBack() {
      print('going back');
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child:
              Text('Stateful Page 5 - State Held In Counter - Value $counter'),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              key: null,
              onPressed: incrementCounter,
              child: Text("Increment Counter $counter"),
            ),
            ElevatedButton(
              key: null,
              onPressed: goBack,
              child: Text("Back"),
            ),
          ],
        ),
      ),
    );
  }
}

class BlankPageTemplate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    goBack() {
      print('going back');
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Blank Page Template'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal.shade800,
        child: Text("Back"),
        onPressed: goBack,
      ),
    );
  }
}

class CourseLayoutExercise extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    goBack() {
      print('going back');
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Course Layout Exercise - Column / Row Layout'),
      ),
      body: SafeArea(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              color: Colors.red,
              width: 100,
              height: double.infinity,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Colors.yellow,
                  height: 100,
                  width: 100,
                ),
                Container(
                  color: Colors.green.shade300,
                  height: 100,
                  width: 100,
                ),
              ],
            ),
            Container(
                color: Colors.lightBlue, width: 100, height: double.infinity),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal.shade800,
        child: Text("Back"),
        onPressed: goBack,
      ),
    );
  }
}

class CourseBusinessCard01 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    goBack() {
      print('going back');
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Course Business Card'),
      ),
      backgroundColor: Colors.teal.shade600,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 0,
            ),
            CircleAvatar(
              radius: 75,
              backgroundColor: Colors.black12,
              backgroundImage: NetworkImage(
                  'https://raw.githubusercontent.com/philanderson888/data/master/images/2015-guessed-the-year-dad.png'),
            ),
            Text(
              'Phil Anderson',
              style: TextStyle(
                fontSize: 55,
                fontWeight: FontWeight.w400,
                fontFamily: "Pacifico",
                color: Colors.white,
              ),
            ),
            Text(
              'FLUTTER DEVELOPER',
              style: TextStyle(
                fontSize: 35,
                fontFamily: "SourceSansPro",
                color: Colors.teal.shade100,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal.shade800,
        child: Text("Back"),
        onPressed: goBack,
      ),
    );
  }
}
