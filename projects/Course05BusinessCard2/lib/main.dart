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
    gotoGridViewOfClickableImages() {
      print('going to grid view of clickable images');
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => GridViewOfClickableImages()),
      );
    }

    goToBlankPageTemplate() {
      print('going to blank page template');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => BlankPageTemplate()));
    }

    goToBlankStatefulWidget() {
      print('going to blank stateful widget template');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => BlankStatefulWidget()));
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

    goToFontSize() {
      print('going to font size');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => FontSize()));
    }

    goToFontSizeWholePage() {
      print('going to font size whole page');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => FontSizeWholePage()));
    }

    goToIcons() {
      print('going to icons');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => DisplayIcons()));
    }

    goBack() {
      print('going back');
      Navigator.pop(context);
    }

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 2),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Main Index Gridview'),
        ),
        body: GridView.count(
          crossAxisCount: 7,
          children: List.generate(28, (index) {
            if (index == 0) {
              return ElevatedButton(
                key: null,
                onPressed: gotoGridViewOfClickableImages,
                child: Text("Grid View Of Clickable Images"),
              );
            } else if (index == 1) {
              return ElevatedButton(
                key: null,
                onPressed: goBack,
                child: Text("Back"),
              );
            } else if (index == 3) {
              return ElevatedButton(
                key: null,
                onPressed: goToBlankPageTemplate,
                child: Text("Blank Page Template"),
              );
            } else if (index == 4) {
              return ElevatedButton(
                key: null,
                onPressed: goToBlankStatefulWidget,
                child: Text("Blank Stateful Widget"),
              );
            } else if (index == 7) {
              return ElevatedButton(
                key: null,
                onPressed: goToCourseLayoutExercise,
                child: Text("Course Layout Exercise"),
              );
            } else if (index == 8) {
              return ElevatedButton(
                key: null,
                onPressed: goToCourseBusinessCard01,
                child: Text("Course Business Card"),
              );
            } else if (index == 9) {
              return ElevatedButton(
                key: null,
                onPressed: goToFontSize,
                child: Text("Font Size"),
              );
            } else if (index == 10) {
              return ElevatedButton(
                key: null,
                onPressed: goToFontSizeWholePage,
                child: Text("Font Size Whole Page"),
              );
            } else if (index == 11) {
              return ElevatedButton(
                key: null,
                onPressed: goToIcons,
                child: Text("Icons"),
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
      ),
    );
  }
}

class GridViewOfClickableImages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    printYouTapped(index) {
      print('you tapped picture ' + index.toString());
    }

    goBack() {
      print('going back');
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('GridView with clickable images'),
      ),
      body: GridView.count(
        crossAxisCount: 7,
        children: List.generate(28, (index) {
          return Center(
            child: GestureDetector(
              onTap: () => printYouTapped(index),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Image $index',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Image(
                      image: NetworkImage(
                          'https://picsum.photos/130?random=$index'),
                    ),
                  ]),
            ),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal.shade800,
        child: Text("Back"),
        onPressed: goBack,
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

class BlankStatefulWidget extends StatefulWidget {
  BlankStatefulWidgetState createState() => BlankStatefulWidgetState();
}

class BlankStatefulWidgetState extends State {
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
          child: Text('Blank Stateful Widget - counter $counter'),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
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
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'here is some text',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Container(
                    width: 10,
                  ),
                ],
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

class FontSize extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    goBack() {
      print('going back');
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Font Size'),
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
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'this text is size 10',
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                  Container(
                    width: 10,
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'this text is size 20',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Container(
                    width: 10,
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'this text is size 30',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Container(
                    width: 10,
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'this text is size 40',
                    style: TextStyle(
                      fontSize: 40,
                    ),
                  ),
                  Container(
                    width: 10,
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'this text is size 50',
                    style: TextStyle(
                      fontSize: 50,
                    ),
                  ),
                  Container(
                    width: 10,
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'this text is size 60',
                    style: TextStyle(
                      fontSize: 60,
                    ),
                  ),
                  Container(
                    width: 10,
                  ),
                ],
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

class FontSizeWholePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    gotoGridViewOfClickableImages() {
      print('going to grid view of clickable images');
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => GridViewOfClickableImages()),
      );
    }

    goToBlankPageTemplate() {
      print('going to blank page template');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => BlankPageTemplate()));
    }

    goToBlankStatefulWidget() {
      print('going to blank stateful widget template');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => BlankStatefulWidget()));
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

    goToFontSize() {
      print('going to font size');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => FontSize()));
    }

    goToIcons() {
      print('going to icons');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => DisplayIcons()));
    }

    goBack() {
      print('going back');
      Navigator.pop(context);
    }

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 2),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Set Font Size For Whole Page'),
        ),
        body: GridView.count(
          crossAxisCount: 7,
          children: List.generate(28, (index) {
            if (index == 0) {
              return ElevatedButton(
                key: null,
                onPressed: gotoGridViewOfClickableImages,
                child: Text("Page 3 - Grid With Images"),
              );
            } else if (index == 1) {
              return ElevatedButton(
                key: null,
                onPressed: goBack,
                child: Text("Back"),
              );
            } else if (index == 3) {
              return ElevatedButton(
                key: null,
                onPressed: goToBlankPageTemplate,
                child: Text("Blank Page Template"),
              );
            } else if (index == 4) {
              return ElevatedButton(
                key: null,
                onPressed: goToBlankStatefulWidget,
                child: Text("Blank Stateful Widget"),
              );
            } else if (index == 7) {
              return ElevatedButton(
                key: null,
                onPressed: goToCourseLayoutExercise,
                child: Text("Course Layout Exercise"),
              );
            } else if (index == 8) {
              return ElevatedButton(
                key: null,
                onPressed: goToCourseBusinessCard01,
                child: Text("Course Business Card"),
              );
            } else if (index == 9) {
              return ElevatedButton(
                key: null,
                onPressed: goToFontSize,
                child: Text("Font Size"),
              );
            } else if (index == 10) {
              return ElevatedButton(
                key: null,
                onPressed: goToIcons,
                child: Text("Icons"),
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
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.teal.shade800,
          child: Text(
            'back',
            style: TextStyle(fontSize: 8),
          ),
          onPressed: goBack,
        ),
      ),
    );
  }
}

class DisplayIcons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    goBack() {
      print('going back');
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Icons'),
      ),
      backgroundColor: Colors.teal.shade600,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 0,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'add',
                    style: TextStyle(
                      fontSize: 40,
                      color: Color(0xFFFFC107),
                    ),
                  ),
                  Icon(
                    Icons.add,
                    color: Color(0xFFFFC107),
                    size: 80,
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'back',
                    style: TextStyle(
                      fontSize: 40,
                      color: Color(0xFFFFC107),
                    ),
                  ),
                  Icon(
                    Icons.arrow_back,
                    color: Color(0xFFFFC107),
                    size: 80,
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'pool',
                    style: TextStyle(
                      fontSize: 40,
                      color: Color(0xFFFFC107),
                    ),
                  ),
                  Icon(
                    Icons.pool,
                    color: Color(0xFFFFC107),
                    size: 80,
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'shopping',
                    style: TextStyle(
                      fontSize: 40,
                      color: Color(0xFFFFC107),
                    ),
                  ),
                  Icon(
                    Icons.add_shopping_cart,
                    color: Color(0xFFFFC107),
                    size: 80,
                  ),
                ],
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
