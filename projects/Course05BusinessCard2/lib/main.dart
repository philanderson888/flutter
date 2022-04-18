/// the goal of this app is to be an all-in-one demo app with as many features built into one app as possible
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    goToPage2() {
      print('you clicked');
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const Page2()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Learning App"),
      ),
      body: Center(
        child: ElevatedButton(
          key: null,
          onPressed: goToPage2,
          child: const Text('Page 2 With A GridView....'),
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    gotoGridViewOfClickableImages() {
      print('going to grid view of clickable images');
      Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) => const GridViewOfClickableImages()),
      );
    }

    goBack() {
      print('going back');
      Navigator.pop(context);
    }

    doNothing() {
      print('doing nothing');
    }

    goToImageCircularAvatar() {
      print('going to avatar circular image');
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const ImageCircularAvatar()));
    }

    goToBlankPageTemplate() {
      print('going to blank page template');
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const BlankPageTemplate()));
    }

    goToBlankStatefulWidget() {
      print('going to blank stateful widget template');
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const BlankStatefulWidget()));
    }

    goToClass() {
      print('displaying class details');
      print(
          'notice the special constructor which forces new instances to specify parameters by name');
      print('see PageItem class details below');
    }

    goToCourseLayoutExercise() {
      print('going to course layout exercise');
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const CourseLayoutExercise()));
    }

    goToBusinessCard() {
      print('going to business card');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const BusinessCard()));
    }

    goToListTile() {
      print('going to list tile');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const ListTile01()));
    }

    goToDisplayFonts() {
      print('going to font');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const DisplayFonts()));
    }

    goToDivider() {
      print('going to divider');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const BusinessCard()));
    }

    goToFontSize() {
      print('going to font size');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const FontSize()));
    }

    goToFontSizeWholePage() {
      print('going to font size whole page');
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const FontSizeWholePage()));
    }

    goToIcons() {
      print('going to icons');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const DisplayIcons()));
    }

    goToIconsFontAwesome() {
      print('going to icons');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const BusinessCard()));
    }

    printListOfStrings() {
      print(" ");
      print(" ");
      print("printing contents of a list<string>");
      for (var buttonText in buttonTexts) {
        print(buttonText);
      }
    }

    List<PageItem> pageItems = [
      PageItem(
        functionName: doNothing,
        buttonText: "do nothing 1",
      ),
      PageItem(
        functionName: goToListTile,
        buttonText: "List Tile",
      ),
      PageItem(
        functionName: goToBusinessCard,
        buttonText: "Divider",
      ),
      PageItem(
        functionName: () {
          print(
              "TODO: sized box can allow for fixed size containers in your app");
        },
        buttonText: "Sized Box",
      ),
      PageItem(
          functionName: () {
            print("TODO: typedef can be used to declare a custom type");
            print("typedef myListOfItems = List<SomeClass>");
          },
          buttonText: "typedef"),
    ];

    printListOfInstances() {
      print(" ");
      print(" ");
      print("printing a List<PageItem>");
      for (var pageItem in pageItems) {
        print('pageItem: { ' +
            pageItem.functionName +
            '(), "' +
            pageItem.buttonText +
            '" }');
      }
    }

    gotoPadding01() {
      print('going to icons');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Padding01()));
    }

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 2),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Main Index Gridview'),
        ),
        body: GridView.count(
          crossAxisCount: 7,
          children: List.generate(28, (index) {
            if (index == 0) {
              return ElevatedButton(
                key: null,
                onPressed: goBack,
                child: const Text("Back"),
              );
            } else if (index == 1) {
              return ElevatedButton(
                key: null,
                onPressed: doNothing,
                child: const Text(" "),
              );
            } else if (index == 2) {
              return ElevatedButton(
                key: null,
                onPressed: doNothing,
                child: const Text(" "),
              );
            } else if (index == 3) {
              return ElevatedButton(
                key: null,
                onPressed: goToBlankPageTemplate,
                child: const Text("Blank Page Template"),
              );
            } else if (index == 4) {
              return ElevatedButton(
                key: null,
                onPressed: goToClass,
                child: const Text("Class / Constructor"),
              );
            } else if (index == 5) {
              return ElevatedButton(
                key: null,
                onPressed: printListOfStrings,
                child: const Text("List Of Strings"),
              );
            } else if (index == 6) {
              return ElevatedButton(
                key: null,
                onPressed: printListOfInstances,
                child: const Text("List Of Instances"),
              );
            } else if (index == 7) {
              return ElevatedButton(
                key: null,
                onPressed: goToDivider,
                child: const Text("Class / Constructor"),
              );
            } else if (index == 8) {
              return ElevatedButton(
                key: null,
                onPressed: goToBlankStatefulWidget,
                child: const Text("Template - Stateful Widget"),
              );
            } else if (index == 9) {
              return ElevatedButton(
                key: null,
                onPressed: goToCourseLayoutExercise,
                child: const Text("Course Layout Exercise"),
              );
            } else if (index == 10) {
              return ElevatedButton(
                key: null,
                onPressed: goToBusinessCard,
                child: const Text("Business Card"),
              );
            } else if (index == 11) {
              return ElevatedButton(
                key: null,
                onPressed: doNothing,
                child: const Text(" . "),
              );
            } else if (index == 12) {
              return ElevatedButton(
                key: null,
                onPressed: goToDisplayFonts,
                child: const Text("Fonts"),
              );
            } else if (index == 13) {
              return ElevatedButton(
                key: null,
                onPressed: goToFontSize,
                child: const Text("Font Size"),
              );
            } else if (index == 14) {
              return ElevatedButton(
                key: null,
                onPressed: goToFontSizeWholePage,
                child: const Text("Font Size Whole Page"),
              );
            } else if (index == 15) {
              return ElevatedButton(
                key: null,
                onPressed: gotoGridViewOfClickableImages,
                child: const Text("Grid View - Images Clickable"),
              );
            } else if (index == 16) {
              return ElevatedButton(
                key: null,
                onPressed: goToIcons,
                child: const Text("Icons"),
              );
            } else if (index == 17) {
              return ElevatedButton(
                key: null,
                onPressed: goToIconsFontAwesome,
                child: const Text("Icon - Font Awesome"),
              );
            } else if (index == 18) {
              return ElevatedButton(
                key: null,
                onPressed: goToImageCircularAvatar,
                child: const Text("Image - Circular Avatar"),
              );
            } else if (index == 19) {
              return ElevatedButton(
                key: null,
                onPressed: gotoGridViewOfClickableImages,
                child: const Text("Images - Grid View Clickable"),
              );
            } else if (index == 20) {
              return ElevatedButton(
                key: null,
                onPressed: gotoPadding01,
                child: const Text("Padding"),
              );
            } else if ((index >= 21) && (index < 25)) {
              return ElevatedButton(
                key: null,
                onPressed: pageItems[index - 21].functionName,
                child: Text(pageItems[index - 21].buttonText),
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

class BlankPageTemplate extends StatelessWidget {
  const BlankPageTemplate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    goBack() {
      print('going back');
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Blank Page Template'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal.shade800,
        child: const Text("Back"),
        onPressed: goBack,
      ),
    );
  }
}

class BlankStatefulWidget extends StatefulWidget {
  const BlankStatefulWidget({Key? key}) : super(key: key);

  @override
  BlankStatefulWidgetState createState() => BlankStatefulWidgetState();
}

class BlankStatefulWidgetState extends State {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
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
          children: const <Widget>[],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal.shade800,
        child: const Text("Back"),
        onPressed: goBack,
      ),
    );
  }
}

class BusinessCard extends StatelessWidget {
  const BusinessCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    goBack() {
      print('going back');
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Business Card'),
      ),
      backgroundColor: Colors.teal.shade600,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 0,
            ),
            const CircleAvatar(
              radius: 75,
              backgroundColor: Colors.black12,
              backgroundImage: NetworkImage(
                  'https://raw.githubusercontent.com/philanderson888/data/master/images/2015-guessed-the-year-dad.png'),
            ),
            const Text(
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
              height: 5,
              margin: const EdgeInsets.symmetric(horizontal: 100.0),
              child: Divider(
                color: Colors.teal.shade100,
              ),
            ),
            Card(
              color: Colors.white,
              margin:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 100.0),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.phone,
                      color: Colors.teal.shade800,
                      size: 30,
                    ),
                    Container(
                      width: 10,
                    ),
                    Text(
                      '+447888849991',
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: "SourceSansPro",
                        color: Colors.teal.shade900,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 5,
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              margin:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 100.0),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.email,
                    color: Colors.teal.shade800,
                    size: 30,
                  ),
                  Container(
                    width: 20,
                  ),
                  Text(
                    'philanderson888@hotmail.com',
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: "SourceSansPro",
                      color: Colors.teal.shade900,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Card(
              color: Colors.white,
              margin:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 100.0),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.instagram,
                      color: Colors.teal.shade800,
                      size: 30,
                    ),
                    Container(
                      width: 10,
                    ),
                    Text(
                      '@philanderson888',
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: "SourceSansPro",
                        color: Colors.teal.shade900,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal.shade800,
        child: const Text("Back"),
        onPressed: goBack,
      ),
    );
  }
}

class CourseLayoutExercise extends StatelessWidget {
  const CourseLayoutExercise({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    goBack() {
      print('going back');
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Course Layout Exercise - Column / Row Layout'),
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
        child: const Text("Back"),
        onPressed: goBack,
      ),
    );
  }
}

class DisplayFonts extends StatelessWidget {
  const DisplayFonts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    goBack() {
      print('going back');
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Fonts'),
      ),
      backgroundColor: Colors.teal.shade600,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 0,
            ),
            const CircleAvatar(
              radius: 75,
              backgroundColor: Colors.black12,
              backgroundImage: NetworkImage(
                  'https://raw.githubusercontent.com/philanderson888/data/master/images/2015-guessed-the-year-dad.png'),
            ),
            const Text(
              'Phil Anderson - Pacifico Font',
              style: TextStyle(
                fontSize: 55,
                fontWeight: FontWeight.w400,
                fontFamily: "Pacifico",
                color: Colors.white,
              ),
            ),
            Text(
              'FLUTTER DEVELOPER - Source Sans Pro',
              style: TextStyle(
                fontSize: 35,
                fontFamily: "SourceSansPro",
                color: Colors.teal.shade100,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'source sans pro, color teal, size 35',
                  style: TextStyle(
                    fontSize: 35,
                    fontFamily: "SourceSansPro",
                    color: Colors.teal.shade100,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal.shade800,
        child: const Text("Back"),
        onPressed: goBack,
      ),
    );
  }
}

class DisplayIcons extends StatelessWidget {
  const DisplayIcons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    goBack() {
      print('going back');
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Icons'),
      ),
      backgroundColor: Colors.teal.shade600,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
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
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal.shade800,
        child: const Text("Back"),
        onPressed: goBack,
      ),
    );
  }
}

class FontSize extends StatelessWidget {
  const FontSize({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    goBack() {
      print('going back');
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Font Size'),
      ),
      backgroundColor: Colors.teal.shade600,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 0,
            ),
            const CircleAvatar(
              radius: 75,
              backgroundColor: Colors.black12,
              backgroundImage: NetworkImage(
                  'https://raw.githubusercontent.com/philanderson888/data/master/images/2015-guessed-the-year-dad.png'),
            ),
            const Text(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
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
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal.shade800,
        child: const Text("Back"),
        onPressed: goBack,
      ),
    );
  }
}

class FontSizeWholePage extends StatelessWidget {
  const FontSizeWholePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    gotoGridViewOfClickableImages() {
      print('going to grid view of clickable images');
      Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) => const GridViewOfClickableImages()),
      );
    }

    goToBlankPageTemplate() {
      print('going to blank page template');
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const BlankPageTemplate()));
    }

    goToBlankStatefulWidget() {
      print('going to blank stateful widget template');
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const BlankStatefulWidget()));
    }

    goToCourseLayoutExercise() {
      print('going to course layout exercise');
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const CourseLayoutExercise()));
    }

    goToBusinessCard() {
      print('going to business card');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const BusinessCard()));
    }

    goToFontSize() {
      print('going to font size');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const FontSize()));
    }

    goToIcons() {
      print('going to icons');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const DisplayIcons()));
    }

    goBack() {
      print('going back');
      Navigator.pop(context);
    }

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 2),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Set Font Size For Whole Page'),
        ),
        body: GridView.count(
          crossAxisCount: 7,
          children: List.generate(28, (index) {
            if (index == 0) {
              return ElevatedButton(
                key: null,
                onPressed: gotoGridViewOfClickableImages,
                child: const Text("Page 3 - Grid With Images"),
              );
            } else if (index == 1) {
              return ElevatedButton(
                key: null,
                onPressed: goBack,
                child: const Text("Back"),
              );
            } else if (index == 3) {
              return ElevatedButton(
                key: null,
                onPressed: goToBlankPageTemplate,
                child: const Text("Blank Page Template"),
              );
            } else if (index == 4) {
              return ElevatedButton(
                key: null,
                onPressed: goToBlankStatefulWidget,
                child: const Text("Blank Stateful Widget"),
              );
            } else if (index == 7) {
              return ElevatedButton(
                key: null,
                onPressed: goToCourseLayoutExercise,
                child: const Text("Course Layout Exercise"),
              );
            } else if (index == 8) {
              return ElevatedButton(
                key: null,
                onPressed: goToBusinessCard,
                child: const Text("Course Business Card"),
              );
            } else if (index == 9) {
              return ElevatedButton(
                key: null,
                onPressed: goToFontSize,
                child: const Text("Font Size"),
              );
            } else if (index == 10) {
              return ElevatedButton(
                key: null,
                onPressed: goToIcons,
                child: const Text("Material Icons"),
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
          child: const Text(
            'back',
            style: TextStyle(fontSize: 8),
          ),
          onPressed: goBack,
        ),
      ),
    );
  }
}

class GridViewOfClickableImages extends StatelessWidget {
  const GridViewOfClickableImages({Key? key}) : super(key: key);

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
        title: const Text('GridView with clickable images'),
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
        child: const Text("Back"),
        onPressed: goBack,
      ),
    );
  }
}

class ImageCircularAvatar extends StatelessWidget {
  const ImageCircularAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    goBack() {
      print('going back');
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Circular Avatar Image'),
      ),
      backgroundColor: Colors.teal.shade600,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 0,
            ),
            const CircleAvatar(
              radius: 75,
              backgroundColor: Colors.black12,
              backgroundImage: NetworkImage(
                  'https://raw.githubusercontent.com/philanderson888/data/master/images/2015-guessed-the-year-dad.png'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal.shade800,
        child: const Text("Back"),
        onPressed: goBack,
      ),
    );
  }
}

class ListTile01 extends StatelessWidget {
  const ListTile01({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    goBack() {
      print('going back');
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('List Tile'),
      ),
      backgroundColor: Colors.teal.shade600,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 0,
            ),
            Card(
              margin:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 100.0),
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 150),
                leading: FaIcon(
                  FontAwesomeIcons.instagram,
                  color: Colors.teal.shade800,
                  size: 30,
                ),
                title: Text(
                  '@philanderson888 (card with list tile)',
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: "SourceSansPro",
                    color: Colors.teal.shade900,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal.shade800,
        child: const Text("Back"),
        onPressed: goBack,
      ),
    );
  }
}

class Padding01 extends StatelessWidget {
  const Padding01({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    goBack() {
      print('going back');
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Business Card'),
      ),
      backgroundColor: Colors.teal.shade600,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 0,
            ),
            const CircleAvatar(
              radius: 75,
              backgroundColor: Colors.black12,
              backgroundImage: NetworkImage(
                  'https://raw.githubusercontent.com/philanderson888/data/master/images/2015-guessed-the-year-dad.png'),
            ),
            const Text(
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
              height: 5,
            ),
            Card(
              color: Colors.white,
              margin:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 100.0),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.phone,
                      color: Colors.teal.shade800,
                      size: 30,
                    ),
                    Container(
                      width: 10,
                    ),
                    Text(
                      '+447888849991',
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: "SourceSansPro",
                        color: Colors.teal.shade900,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 5,
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              margin:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 100.0),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.email,
                    color: Colors.teal.shade800,
                    size: 30,
                  ),
                  Container(
                    width: 20,
                  ),
                  Text(
                    'philanderson888@hotmail.com',
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: "SourceSansPro",
                      color: Colors.teal.shade900,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal.shade800,
        child: const Text("Back"),
        onPressed: goBack,
      ),
    );
  }
}

class Page4 extends StatelessWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    goToPage5() {
      print('going to stateful page 5');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Page5()));
    }

    goBack() {
      print('going back');
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Page4'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                key: null, onPressed: goToPage5, child: const Text("Page 5")),
            ElevatedButton(
                key: null, onPressed: goBack, child: const Text("Back")),
          ],
        ),
      ),
    );
  }
}

class Page5 extends StatefulWidget {
  const Page5({Key? key}) : super(key: key);

  @override
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
              child: const Text("Back"),
            ),
          ],
        ),
      ),
    );
  }
}

List<String> buttonTexts = [
  "this is some button text",
  "this is some more button text"
];

// Page Item
class PageItem {
  dynamic functionName = () {};
  String buttonText = "";
  // special constructor forces named parameters to be passed
  PageItem({this.functionName, this.buttonText = ""}) {
    // ensure parameters are not null
    assert(functionName != "", "A function name is required");
    assert(buttonText != "", "Button Text is required");
  }
}

nullFunction() {}
