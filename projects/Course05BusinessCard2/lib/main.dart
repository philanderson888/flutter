/// the goal of this app is to be an all-in-one demo app with as many features built into one app as possible
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';
import 'routes/home.dart';
import 'routes/grid_main.dart';
import 'routes/apps.dart';
import 'constants.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const Home(),
          '/page4': (context) => const Page4(),
          '/page5': (context) => const Page5(),
          '/grid2': (context) => const Grid2(),
          '/apps': (context) => const Apps(),
        });
  }
}

class AskAnyQuestion extends StatefulWidget {
  const AskAnyQuestion({Key? key}) : super(key: key);

  @override
  State<AskAnyQuestion> createState() => _AskAnyQuestionState();
}

class _AskAnyQuestionState extends State<AskAnyQuestion> {
  static final _random = Random();
  int answer = _random.nextInt(5) + 1;

  getAnswer() {
    setState(
      () {
        answer = _random.nextInt(5) + 1;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ask Any Question'),
        backgroundColor: kPurple,
      ),
      body: SafeArea(
        child: Container(
          color: kPurple,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(),
              ),
              Expanded(
                flex: 4,
                child: TextButton(
                    onPressed: getAnswer,
                    child: Image.asset('images/ball$answer.png')),
              ),
              Expanded(
                flex: 1,
                child: Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BackgroundImage extends StatefulWidget {
  const BackgroundImage({Key? key}) : super(key: key);

  @override
  State<BackgroundImage> createState() => _BackgroundImageState();
}

class _BackgroundImageState extends State<BackgroundImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  'https://pngimg.com/uploads/mountain/mountain_PNG18.png'),
              fit: BoxFit.cover),
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
        backgroundColor: kDarkTeal,
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
        backgroundColor: kDarkTeal,
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
            CircleAvatar(
              radius: 75,
              backgroundColor: kColorLightPink01,
              backgroundImage: NetworkImage(
                  'https://raw.githubusercontent.com/philanderson888/data/master/images/2015-guessed-the-year-dad.png'),
            ),
            Text(
              'Phil Anderson',
              style: kPacifico55White,
            ),
            Text(
              'FLUTTER DEVELOPER',
              style: kSourceSansPro35Teal,
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
                      color: kDarkTeal,
                      size: 30,
                    ),
                    Container(
                      width: 10,
                    ),
                    Text(
                      '+447888849991',
                      style: kSourceSansPro30TealDark,
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
                    color: kDarkTeal,
                    size: 30,
                  ),
                  Container(
                    width: 20,
                  ),
                  Text(
                    'philanderson888@hotmail.com',
                    style: kSourceSansPro30TealDark,
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
                      color: kDarkTeal,
                      size: 30,
                    ),
                    Container(
                      width: 10,
                    ),
                    Text(
                      '@philanderson888',
                      style: kSourceSansPro30TealDark,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kDarkTeal,
        child: const Text("Back"),
        onPressed: goBack,
      ),
    );
  }
}

class ButtonTypes extends StatelessWidget {
  const ButtonTypes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
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
        backgroundColor: kDarkTeal,
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
        title: const Text('Roll The Dice'),
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
        title: const Text('Roll The Dice'),
        backgroundColor: Colors.red,
      ),
      body: const DicePage02(),
    );
  }
}

class DicePage02 extends StatelessWidget {
  const DicePage02({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int leftDiceNumber = 4;
    int rightDiceNumber = 5;

    onDiceRoll() {
      print('you rolled the dice');
      leftDiceNumber++;
      rightDiceNumber++;
      print('dice numbers $leftDiceNumber and $rightDiceNumber');
    }

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
            child: TextButton(
              onPressed: onDiceRoll,
              child: Image.asset('images/dice$leftDiceNumber.png'),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Expanded(
            flex: 4,
            child: TextButton(
              onPressed: onDiceRoll,
              child: Image.asset('images/dice$rightDiceNumber.png'),
            ),
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

class Dice03 extends StatefulWidget {
  const Dice03({Key? key}) : super(key: key);

  @override
  Dice03State createState() => Dice03State();
}

class Dice03State extends State {
  static final _random = Random();
  int leftDiceNumber = _random.nextInt(6) + 1;
  int rightDiceNumber = _random.nextInt(6) + 1;

  @override
  Widget build(BuildContext context) {
    onDiceRoll() {
      setState(
        () => {
          leftDiceNumber = _random.nextInt(6) + 1,
          rightDiceNumber = _random.nextInt(6) + 1,
          print(
              'you rolled the dice - new numbers are $leftDiceNumber and $rightDiceNumber'),
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dice Roll'),
        backgroundColor: Colors.red,
      ),
      body: SafeArea(
        child: Container(
          color: Colors.red,
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(),
              ),
              Expanded(
                flex: 4,
                child: TextButton(
                  onPressed: onDiceRoll,
                  child: Image.asset('images/dice$leftDiceNumber.png'),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(),
              ),
              Expanded(
                flex: 4,
                child: TextButton(
                  onPressed: onDiceRoll,
                  child: Image.asset('images/dice$rightDiceNumber.png'),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Fonts01 extends StatelessWidget {
  const Fonts01({Key? key}) : super(key: key);

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
            CircleAvatar(
              radius: 75,
              backgroundColor: kColorLightPink01,
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
              style: kSourceSansPro35Teal,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'source sans pro, color teal, size 35',
                  style: kSourceSansPro35Teal,
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kDarkTeal,
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
        backgroundColor: kDarkTeal,
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
            CircleAvatar(
              radius: 75,
              backgroundColor: kColorLightPink01,
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
              style: kSourceSansPro35Teal,
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
        backgroundColor: kDarkTeal,
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
          backgroundColor: kDarkTeal,
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
        backgroundColor: kDarkTeal,
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
            CircleAvatar(
              radius: 75,
              backgroundColor: kColorLightPink01,
              backgroundImage: NetworkImage(
                  'https://raw.githubusercontent.com/philanderson888/data/master/images/2015-guessed-the-year-dad.png'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kDarkTeal,
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
                  color: kDarkTeal,
                  size: 30,
                ),
                title: Text(
                  '@philanderson888 (card with list tile)',
                  style: kSourceSansPro30TealDark,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kDarkTeal,
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
          backgroundColor: kDarkTeal,
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
          backgroundColor: kDarkTeal,
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
