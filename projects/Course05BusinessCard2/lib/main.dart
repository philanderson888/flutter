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
    goToGridAToZ() {
      print('you clicked');
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const GridAToZ()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Amazing Flutter Teaching App"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(),
          ElevatedButton(
            key: null,
            onPressed: goToGridAToZ,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow),
            ),
            child: Text(
              'Teaching Grid A-Z',
              style: TextStyle(
                fontSize: 35,
                fontFamily: "SourceSansPro",
                color: Colors.teal.shade600,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GridAToZ extends StatelessWidget {
  const GridAToZ({Key? key}) : super(key: key);

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

    goToEmpty() {
      print('going to empty page');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Empty()));
    }

    goToListTile() {
      print('going to list tile');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const ListTile01()));
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

    printListOfStrings() {
      print(" ");
      print(" ");
      print("printing contents of a list<string>");
      for (var buttonText in buttonTexts) {
        print(buttonText);
      }
    }

    goToMaterialDesignColor() {
      print('going to material design color');
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const MaterialDesignColor()));
    }

    goToMediaQuery01() {
      print('going to material design color');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const MediaQuery01()));
    }

    List<PageItem> pageItems = [
      PageItem(
        functionName: doNothing,
        buttonText: "do nothing",
      ),
      PageItem(
        functionName: goToListTile,
        buttonText: "List Tile",
      ),
      PageItem(
        functionName: () {
          print('going to dice page 01 - basic page with container flex set');
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const Dice01()));
        },
        buttonText: "Dice 01",
      ),
      PageItem(
        functionName: () {
          print('going to dice page');
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const Dice02()));
        },
        buttonText: "Dice 02 ",
      ),
      PageItem(
        functionName: goToBusinessCard,
        buttonText: "Divider",
      ),
      PageItem(
        functionName: goToEmpty,
        buttonText: "Empty Page",
      ),
      PageItem(
        functionName: () {
          print('going to expanded 01');
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const Expanded01()));
        },
        buttonText: "Expand 01",
      ),
      PageItem(
        functionName: () {
          print('going to expanded 02');
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const Expanded02()));
        },
        buttonText: "Expand 02 Fixed Margins",
      ),
      PageItem(
        functionName: () {
          print('going to expanded 03');
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const Expanded03()));
        },
        buttonText: "Expand 03 Flex Ratios",
      ),
      PageItem(
        functionName: () {
          print('going to icons');
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const DisplayIcons()));
        },
        buttonText: "Icons",
      ),
      PageItem(
        functionName: () {
          print('going to font awesome icons');
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const BusinessCard()));
        },
        buttonText: "Icon Font Awesome",
      ),
      PageItem(
        functionName: goToMaterialDesignColor,
        buttonText: "Material Design Color",
      ),
      PageItem(
        functionName: goToMediaQuery01,
        buttonText: "Media Query",
      ),
      PageItem(
        functionName: () {
          print("TODO: sized box - fixed container sizes");
        },
        buttonText: "ToDo - Sized Box",
      ),
      PageItem(
        functionName: () {
          print('going to text scale factor');
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const TextScaleFactor01()));
        },
        buttonText: "text Scale Factor",
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
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.3),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Main Index Gridview'),
        ),
        body: GridView.count(
          crossAxisCount: 9,
          children: List.generate(33, (index) {
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
                onPressed: goToImageCircularAvatar,
                child: const Text("Image - Circular Avatar"),
              );
            } else if (index == 17) {
              return ElevatedButton(
                key: null,
                onPressed: gotoGridViewOfClickableImages,
                child: const Text("Images - Grid View Clickable"),
              );
            } else if (index == 18) {
              return ElevatedButton(
                key: null,
                onPressed: gotoPadding01,
                child: const Text("Padding"),
              );
            } else if ((index >= 19) && (index < 45)) {
              return ElevatedButton(
                key: null,
                onPressed: pageItems[index - 19].functionName,
                child: Text(pageItems[index - 19].buttonText),
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

class Dice01 extends StatelessWidget {
  const Dice01({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Course "Dicee" App'),
        backgroundColor: Colors.red,
      ),
      body: const DicePage01(),
    );
  }
}

class DicePage01 extends StatelessWidget {
  const DicePage01({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Expanded(
            flex: 4,
            child: Image.asset('images/dice1.png'),
          ),
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Expanded(
            flex: 4,
            child: Image.asset('images/dice2.png'),
          ),
          Expanded(
            flex: 1,
            child: Container(),
          ),
        ],
      ),
    );
  }
}

class Dice02 extends StatelessWidget {
  const Dice02({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Course "Dicee" App'),
        backgroundColor: Colors.red,
      ),
      body: const DicePage01(),
    );
  }
}

class DicePage02 extends StatelessWidget {
  const DicePage02({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Expanded(
            flex: 4,
            child: Image.asset('images/dice1.png'),
          ),
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Expanded(
            flex: 4,
            child: Image.asset('images/dice2.png'),
          ),
          Expanded(
            flex: 1,
            child: Container(),
          ),
        ],
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

class Empty extends StatelessWidget {
  const Empty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Empty Page'),
      ),
      body: const EmptyPage(),
    );
  }
}

class EmptyPage extends StatelessWidget {
  const EmptyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Expanded01 extends StatelessWidget {
  const Expanded01({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expanded 01'),
      ),
      body: Row(
        children: const <Widget>[
          Expanded(
            child: Image(
              width: 200,
              image: AssetImage('images/dice1.png'),
            ),
          ),
          Expanded(
            child: Image(
              width: 200,
              image: AssetImage('images/dice2.png'),
            ),
          ),
        ],
      ),
    );
  }
}

class Expanded02 extends StatelessWidget {
  const Expanded02({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expanded 02'),
      ),
      body: Row(
        children: <Widget>[
          Container(
            width: 10,
          ),
          Expanded(
            child: Image.network('https://picsum.photos/600?random=1'),
          ),
          Container(
            width: 10,
          ),
          Expanded(
            child: Image.network('https://picsum.photos/600?random=2'),
          ),
          Container(
            width: 10,
          ),
        ],
      ),
    );
  }
}

class Expanded03 extends StatelessWidget {
  const Expanded03({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expand 03 Using Flex Ratios'),
      ),
      body: Row(
        children: <Widget>[
          Expanded(
            child: Container(),
            flex: 1,
          ),
          const Expanded(
            flex: 5,
            child: Image(
              image: NetworkImage('https://picsum.photos/600?random=1'),
            ),
          ),
          Expanded(
            child: Container(),
            flex: 1,
          ),
          const Expanded(
            flex: 5,
            child: Image(
              image: NetworkImage('https://picsum.photos/600?random=2'),
            ),
          ),
          Expanded(
            child: Container(),
            flex: 1,
          ),
        ],
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
    goBack() {
      print('going back');
      Navigator.pop(context);
    }

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.5),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Set Font Size For Whole Page - textScaleFactor'),
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
                contentPadding: const EdgeInsets.symmetric(horizontal: 150),
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

class MaterialDesignColor extends StatelessWidget {
  const MaterialDesignColor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    doNothing() {
      print('doing nothing');
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Material Design Color'),
      ),
      body: ElevatedButton(
        key: null,
        onPressed: doNothing,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow),
        ),
        child: const Text('here is a button'),
      ),
    );
  }
}

class TextScaleFactor01 extends StatelessWidget {
  const TextScaleFactor01({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    goBack() {
      print('going back');
      Navigator.pop(context);
    }

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.5),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Set Font Size For Whole Page - textScaleFactor'),
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

class MediaQuery01 extends StatelessWidget {
  const MediaQuery01({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    goBack() {
      print('going back');
      Navigator.pop(context);
    }

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.5),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Set Font Size For Whole Page - textScaleFactor'),
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
