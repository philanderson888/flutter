/// the goal of this app is to be an all-in-one demo app with as many features built into one app as possible
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:english_words/english_words.dart';
import 'dart:math';
import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:meta/meta.dart';

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
    const gridSize = 70;
    const columnCount = 10;
    const initialListLength = 0;
    const categoryButtonColor = Color(0xFFF2B64B);

    doNothing() {
      print('doing nothing');
    }

    goBack() {
      print('going back');
      Navigator.pop(context);
    }

    goToAskAnyQuestion() {
      print('going to "ask any question"');
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const AskAnyQuestion()));
    }

    goToAudioPlayer() {
      print('going to audio player');
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const AudioPlayerWidget()));
    }

    goToBlankPageTemplate() {
      print('going to blank page template');
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const BlankPageTemplate()));
    }

    goToBorderRadius() {
      print('going to border radius');
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const AudioPlayerWidget()));
    }

    goToBusinessCard() {
      print('going to business card');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const BusinessCard()));
    }

    goToClass() {
      print('displaying class details');
      print(
          'notice the special constructor which forces new instances to specify parameters by name');
      print('see PageItem class details below');
    }

    goToCourseLayoutExercise() {
      print('TODO: fix this name as it is vague');
      print('going to course layout exercise');
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const CourseLayoutExercise()));
    }

    goToDice01() {
      print('going to Dice01');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Dice01()));
    }

    goToDice02() {
      print('going to Dice02');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Dice02()));
    }

    goToDice03() {
      print('going to Dice03');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Dice03()));
    }

    goToFonts() {
      print('going to font');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Fonts01()));
    }

    goToFullScreen() {
      print('going to full screen app');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Quiz01()));
    }

    goToFunctionReturnsComponent() {
      print(
          'viewing a function which returns a component - in this case, the Expanded component.  See the Xylophone example for its use here .. ');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Xylophone()));
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

    goToExpanded01() {
      print('going to expanded 01');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Expanded01()));
    }

    goToExpanded02() {
      print('going to expanded 02');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Expanded02()));
    }

    goToExpanded03() {
      print('going to expanded 03');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Expanded03()));
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

    goToFontAwesomeIcons() {
      print('going to font awesome icons');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const BusinessCard()));
    }

    gotoGridViewOfClickableImages() {
      print('going to grid view of clickable images');
      Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) => const GridViewOfClickableImages()),
      );
    }

    goToIcons() {
      print('going to icons');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const DisplayIcons()));
    }

    goToImageCircularAvatar() {
      print('going to avatar circular image');
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const ImageCircularAvatar()));
    }

    goToInkwell() {
      print('going to inkwell example inside Xylophone');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Xylophone()));
    }

    goToListTile() {
      print('going to list tile');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const ListTile01()));
    }

    goToLayout01() {
      print('going to row/column layout example');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Quiz02()));
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

    gotoPadding01() {
      print('going to icons');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Padding01()));
    }

    goToQuiz01() {
      print('going to quiz app');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Quiz01()));
    }

    goToQuiz02() {
      print('going to quiz02 app');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Quiz02()));
    }

    goToRandom() {
      print('going to randomise function - ');
      print('note - need the `import dart:math` library');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Dice03()));
    }

    goToSafeArea() {
      print(
          "going to safe area in business card.  Safe area avoids screen items generated by screen hardware");
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const BusinessCard()));
    }

    goToSizedBox() {
      print("TODO: sized box - fixed container sizes");
    }

    goToStatefulWidget() {
      print('going to blank stateful widget template');
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const BlankStatefulWidget()));
    }

    goToStringInterpolationInVariable() {
      print(
          'going to string interpolation in variable - see note numbers as variable in string');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Xylophone()));
    }

    goToTextStyle() {
      print('going to text style example');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Quiz01()));
    }

    goToTextScaleFactor() {
      print('going to text scale factor');
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const TextScaleFactor01()));
    }

    goToXylophone() {
      print('going to app xylophone');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Xylophone()));
    }

    goToTypeDef() {
      print("TODO: type def");
    }

    List<PageItem> pageItems2 = [
      PageItem(
        functionName: doNothing,
        buttonText: "do nothing",
      ),
      PageItem(
        functionName: doNothing,
        buttonText: "do somethings",
      ),
    ];

    printEnglishWords() {
      int numberOfWords = 2;
      String wordString = "";
      nouns.take(numberOfWords).forEach((item) => wordString += ' ' + item);
      print(numberOfWords.toString() + ' top nouns - ' + wordString);
      wordString = "";
      adjectives
          .take(numberOfWords)
          .forEach((item) => wordString += ' ' + item);
      print(numberOfWords.toString() + ' top adjectives - ' + wordString);
      print('syllables - beautiful has ' + syllables('beautiful').toString());
      String wordPairs = "";
      generateWordPairs()
          .take(numberOfWords)
          .forEach((item) => wordPairs += ' ' + item.toString());
      print(numberOfWords.toString() + ' word pairs - ' + wordPairs);
    }

    printListOfInstances() {
      print(" ");
      print(" ");
      print("printing a list of sample page items");
      for (var pageItem in pageItems2) {
        print('pageItem: { ' +
            pageItem.functionName +
            '(), "' +
            pageItem.buttonText +
            '" }');
      }
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
        buttonText: "Temp- lates ",
        buttonColor: categoryButtonColor,
      ),
      PageItem(
        functionName: goToBlankPageTemplate,
        buttonText: "Blank Page Template",
      ),
      PageItem(
        functionName: goToEmpty,
        buttonText: "Empty Page",
      ),
      PageItem(
        functionName: doNothing,
        buttonText: "Comp onents ",
        buttonColor: categoryButtonColor,
      ),
      PageItem(
        functionName: goToAudioPlayer,
        buttonText: "Audio Player",
      ),
      PageItem(
        functionName: goToBorderRadius,
        buttonText: "Border Radius",
      ),
      PageItem(
        functionName: goToBusinessCard,
        buttonText: "Divider",
      ),
      PageItem(
        functionName: goToCourseLayoutExercise,
        buttonText: "Course Layout Exercise",
      ),
      PageItem(
        functionName: goToClass,
        buttonText: "Class / Constructor",
      ),
      PageItem(
        functionName: goToDivider,
        buttonText: "Class / Constructor",
      ),
      PageItem(
        functionName: goToExpanded01,
        buttonText: "Expand 01",
      ),
      PageItem(
        functionName: goToExpanded02,
        buttonText: "Expand 02",
      ),
      PageItem(
        functionName: goToExpanded03,
        buttonText: "Expand 03",
      ),
      PageItem(
        functionName: goToFonts,
        buttonText: "Fonts",
      ),
      PageItem(
        functionName: goToFontSize,
        buttonText: "Font Size",
      ),
      PageItem(
        functionName: goToFontSizeWholePage,
        buttonText: "Font Size Whole Page",
      ),
      PageItem(
        functionName: goToFullScreen,
        buttonText: "Full Screen App",
      ),
      PageItem(
        functionName: goToFunctionReturnsComponent,
        buttonText: "Function returns a component",
      ),
      PageItem(
        functionName: gotoGridViewOfClickableImages,
        buttonText: "Grid View - Images Clickable",
      ),
      PageItem(
        functionName: goToIcons,
        buttonText: "Icons",
      ),
      PageItem(
        functionName: goToImageCircularAvatar,
        buttonText: "Image Avatar",
      ),
      PageItem(
        functionName: goToInkwell,
        buttonText: "Inkwell",
      ),
      PageItem(
        functionName: gotoGridViewOfClickableImages,
        buttonText: "Image - Grid View",
      ),
      PageItem(
        functionName: goToFontAwesomeIcons,
        buttonText: "Icon Font Awesome",
      ),
      PageItem(
        functionName: goToListTile,
        buttonText: "List Tile",
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
        functionName: gotoPadding01,
        buttonText: "Padding",
      ),
      PageItem(
        functionName: goToRandom,
        buttonText: "Random",
      ),
      PageItem(
        functionName: goToSafeArea,
        buttonText: "Safe Area",
      ),
      PageItem(
        functionName: goToSizedBox,
        buttonText: "ToDo - Sized Box",
      ),
      PageItem(
        functionName: goToStatefulWidget,
        buttonText: "Stateful Widget",
      ),
      PageItem(
        functionName: goToStringInterpolationInVariable,
        buttonText: "String Interpolation In Variable",
      ),
      PageItem(
        functionName: goToTextScaleFactor,
        buttonText: "text Scale Factor",
      ),
      PageItem(
        functionName: goToTextStyle,
        buttonText: "text style",
      ),
      PageItem(
        functionName: goToTypeDef,
        buttonText: "typedef",
      ),
      PageItem(
        functionName: doNothing,
        buttonText: " Layout ",
        buttonColor: categoryButtonColor,
      ),
      PageItem(
        functionName: goToLayout01,
        buttonText: "Layout Row/Column",
      ),
      PageItem(
        functionName: doNothing,
        buttonText: " Apps ",
        buttonColor: categoryButtonColor,
      ),
      PageItem(
        functionName: goToAskAnyQuestion,
        buttonText: "Ask Any Question",
      ),
      PageItem(
        functionName: goToBusinessCard,
        buttonText: "Business Card",
      ),
      PageItem(
        functionName: goToDice01,
        buttonText: "Dice 01 ",
      ),
      PageItem(
        functionName: goToDice02,
        buttonText: "Dice 02 ",
      ),
      PageItem(
        functionName: goToDice03,
        buttonText: "Dice 03 ",
      ),
      PageItem(
        functionName: goToQuiz01,
        buttonText: "Quiz01 App",
      ),
      PageItem(
        functionName: goToQuiz02,
        buttonText: "Quiz02 App",
      ),
      PageItem(
        functionName: goToXylophone,
        buttonText: "Xylophone",
      ),
      PageItem(
        functionName: doNothing,
        buttonText: " . ",
      ),
      PageItem(
        functionName: doNothing,
        buttonText: " Print ",
        buttonColor: categoryButtonColor,
      ),
      PageItem(
        functionName: printEnglishWords,
        buttonText: "English Words",
      ),
      PageItem(
        functionName: printListOfInstances,
        buttonText: "print <Page Item> list",
      ),
      PageItem(
        functionName: printListOfStrings,
        buttonText: "print list of strings",
      ),
    ];

    print("Page items count " + pageItems.length.toString());

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.3),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Main Index Gridview'),
        ),
        body: GridView.count(
          crossAxisCount: columnCount,
          children: List.generate(gridSize, (index) {
            if (index < pageItems.length) {
              return ElevatedButton(
                key: null,
                onPressed: pageItems[index - initialListLength].functionName,
                child: Center(
                    child:
                        Text(pageItems[index - initialListLength].buttonText)),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      pageItems[index - initialListLength].buttonColor),
                ),
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

class AskAnyQuestion extends StatefulWidget {
  const AskAnyQuestion({Key? key}) : super(key: key);

  @override
  State<AskAnyQuestion> createState() => _AskAnyQuestionState();
}

class _AskAnyQuestionState extends State<AskAnyQuestion> {
  static final _random = new Random();
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
        backgroundColor: Colors.purple,
      ),
      body: SafeArea(
        child: Container(
          color: Colors.purple,
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

class AudioPlayerWidget extends StatefulWidget {
  const AudioPlayerWidget({Key? key}) : super(key: key);

  @override
  State<AudioPlayerWidget> createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  final player = AudioCache();
  @override
  Widget build(BuildContext context) {
    var audioPlayer = AudioPlayer(
      mode: PlayerMode.LOW_LATENCY,
    );

    var audioFileUrl =
        'https://file-examples.com/storage/fe66818077626db7798c5e8/2017/11/file_example_MP3_700KB.mp3';
    var localFileUrl = 'note2.wav';

    playAudio() async {
      audioPlayer = await player.play(
        localFileUrl,
      );
    }

    playRemoteAudio() async {
      audioPlayer = await player.play(audioFileUrl);
    }

    loopAudio() async {
      audioPlayer = await player.loop(localFileUrl);
    }

    pauseAudio() {
      print(audioPlayer.state);
      if (audioPlayer.state == PlayerState.PLAYING) {
        audioPlayer.pause();
      } else if (audioPlayer.state == PlayerState.PAUSED) {
        audioPlayer.resume();
      }
    }

    fastForwardAudio() {
      if ((audioPlayer.state == PlayerState.PLAYING) |
          (audioPlayer.state == PlayerState.PAUSED)) {
        audioPlayer.seek(const Duration(milliseconds: 1200));
      }
    }

    rewindAudio() {
      if ((audioPlayer.state == PlayerState.PLAYING) |
          (audioPlayer.state == PlayerState.PAUSED)) {
        audioPlayer.seek(const Duration(milliseconds: -1200));
      }
    }

    stopLoopAudio() {
      audioPlayer.stop();
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Audio Player')),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  "Audio Player",
                  style: TextStyle(
                    fontSize: 55,
                    fontFamily: "SourceSansPro",
                    color: Color(0xFF5395d4),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(),
            ),
            Expanded(
              flex: 2,
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(),
                  ),
                  Expanded(
                    flex: 8,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF85cfe6),
                        borderRadius: BorderRadius.all(
                          Radius.circular(40),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Container(),
                          ),
                          Expanded(
                            flex: 1,
                            child: TextButton(
                              onPressed: playAudio,
                              child: Image(
                                image: NetworkImage(
                                    'https://cdn.pixabay.com/photo/2013/07/13/11/42/audio-158489_1280.png'),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(),
                          ),
                          Expanded(
                            flex: 1,
                            child: TextButton(
                              onPressed: loopAudio,
                              child: Image(
                                image: NetworkImage(
                                    'https://c8.alamy.com/comp/K95095/flat-loop-icon-repeat-sign-reload-interface-button-multimedia-audio-K95095.jpg'),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(),
                          ),
                          Expanded(
                            flex: 1,
                            child: TextButton(
                              onPressed: pauseAudio,
                              child: Image(
                                image: NetworkImage(
                                    'https://cdn-icons-png.flaticon.com/512/189/189639.png'),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(),
                          ),
                          Expanded(
                            flex: 1,
                            child: TextButton(
                              onPressed: rewindAudio,
                              child: Image(
                                image: NetworkImage(
                                    'https://icons.iconarchive.com/icons/hopstarter/button/256/Button-Rewind-icon.png'),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(),
                          ),
                          Expanded(
                            flex: 1,
                            child: TextButton(
                              onPressed: fastForwardAudio,
                              child: Image(
                                image: NetworkImage(
                                    'https://icons.iconarchive.com/icons/custom-icon-design/pretty-office-8/256/Fast-forward-icon.png'),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(),
                          ),
                          Expanded(
                            flex: 1,
                            child: TextButton(
                              onPressed: stopLoopAudio,
                              child: Image(
                                image: NetworkImage(
                                    'https://cdn.pixabay.com/photo/2013/07/12/12/22/stop-145678_960_720.png'),
                              ),
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
                  Expanded(
                    flex: 1,
                    child: Container(),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  "Remote Audio",
                  style: TextStyle(
                    fontSize: 55,
                    fontFamily: "SourceSansPro",
                    color: Color(0xFF5395d4),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(),
            ),
            Expanded(
              flex: 2,
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(),
                  ),
                  Expanded(
                    flex: 8,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF85cfe6),
                        borderRadius: BorderRadius.all(
                          Radius.circular(40),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            flex: 10,
                            child: Container(),
                          ),
                          Expanded(
                            flex: 3,
                            child: TextButton(
                              onPressed: playRemoteAudio,
                              child: Image(
                                image: NetworkImage(
                                    'https://cdn.pixabay.com/photo/2013/07/13/11/42/audio-158489_1280.png'),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 10,
                            child: Container(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(),
            ),
          ],
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

class Quiz01 extends StatelessWidget {
  const Quiz01({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Quiz01Page(),
        ),
      ),
    );
  }
}

class Quiz01Page extends StatefulWidget {
  const Quiz01Page({Key? key}) : super(key: key);

  @override
  State<Quiz01Page> createState() => _Quiz01PageState();
}

class _Quiz01PageState extends State<Quiz01Page> {
  doNothing() {
    print('doing nothing');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Text(
                'This is a question - true or false?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              ),
              onPressed: () {
                print('you chose true');
              },
              child: Text(
                'True',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              onPressed: () {
                print('you chose false');
              },
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Quiz02 extends StatefulWidget {
  const Quiz02({Key? key}) : super(key: key);

  @override
  State<Quiz02> createState() => _Quiz02State();
}

class _Quiz02State extends State<Quiz02> {
  doNothing() {
    print('doing nothing');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF46016E),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(),
              ),
              Expanded(
                flex: 10,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(),
                    ),
                    Expanded(
                      flex: 10,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Center(
                          child: Text(
                            'this is a question - true or false',
                            style: TextStyle(
                              fontSize: 50,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 10,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Color(0xFF10FA91),
                            ),
                          ),
                          onPressed: () {
                            print('you chose true');
                          },
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(),
                              ),
                              Expanded(
                                flex: 1,
                                child: Center(
                                  child: Text(
                                    'True',
                                    style: TextStyle(
                                      fontSize: 50,
                                      color: Colors.white,
                                    ),
                                  ),
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
                    ),
                    Expanded(
                      flex: 10,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Color(0xFFC7024F),
                            ),
                          ),
                          onPressed: () {
                            print('you chose true');
                          },
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(),
                              ),
                              Expanded(
                                flex: 1,
                                child: Center(
                                  child: Text(
                                    'True',
                                    style: TextStyle(
                                      fontSize: 50,
                                      color: Colors.white,
                                    ),
                                  ),
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
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(),
                    ),
                  ],
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

class Xylophone extends StatefulWidget {
  const Xylophone({Key? key}) : super(key: key);

  @override
  State<Xylophone> createState() => _XylophoneState();
}

class _XylophoneState extends State<Xylophone> {
  final player = AudioCache();

  @override
  Widget build(BuildContext context) {
    var audioPlayer = AudioPlayer(
      mode: PlayerMode.LOW_LATENCY,
    );

    playNote(int noteNumber) async {
      audioPlayer = await player.play(
        'note$noteNumber.wav',
      );
    }

    Expanded buildXylophoneNote({
      int note = 0,
      Color color = Colors.white,
    }) {
      return Expanded(
        flex: 10,
        child: InkWell(
          onTap: () => playNote(note),
          child: Container(
            color: color,
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Xylophone'),
        backgroundColor: Colors.amberAccent,
      ),
      body: SafeArea(
        child: Container(
          color: Colors.amberAccent,
          child: Row(children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(),
            ),
            Expanded(
              flex: 3,
              child: Column(children: <Widget>[
                Expanded(
                  flex: 7,
                  child: Container(),
                ),
                Expanded(
                  flex: 10,
                  child: InkWell(
                    onTap: () => playNote(1),
                    child: Container(
                      color: Color(0xFFCA1E51),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(),
                ),
                buildXylophoneNote(
                  note: 2,
                  color: Color(0xFFd62b20),
                ),
                Expanded(
                  flex: 1,
                  child: Container(),
                ),
                buildXylophoneNote(
                  note: 3,
                  color: Color(0xFFda791f),
                ),
                Expanded(
                  flex: 1,
                  child: Container(),
                ),
                buildXylophoneNote(
                  note: 4,
                  color: Color(0xFFc29020),
                ),
                Expanded(
                  flex: 1,
                  child: Container(),
                ),
                Expanded(
                  flex: 10,
                  child: InkWell(
                    onTap: () {
                      playNote(5);
                    },
                    child: Container(
                      color: Color(0xFF6b974f),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(),
                ),
                Expanded(
                  flex: 10,
                  child: InkWell(
                    onTap: () {
                      playNote(6);
                    },
                    child: Container(
                      color: Color(0xFF83c196),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(),
                ),
                Expanded(
                  flex: 10,
                  child: InkWell(
                    onTap: () {
                      playNote(7);
                    },
                    child: Container(
                      color: Color(0xFF77b7bb),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(),
                ),
                Expanded(
                  flex: 10,
                  child: InkWell(
                    onTap: () {
                      playNote(1);
                    },
                    child: Container(
                      color: Color(0xFFa99aab),
                    ),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Container(),
                ),
              ]),
            ),
            Expanded(
              flex: 1,
              child: Container(),
            ),
          ]),
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
  Color buttonColor = Colors.transparent;
  // special constructor forces named parameters to be passed
  PageItem({
    this.functionName,
    this.buttonText = "",
    this.buttonColor = const Color(0xFF417EFF),
  }) {
    // ensure parameters are not null
    assert(functionName != "", "A function name is required");
    assert(buttonText != "", "Button Text is required");
  }
}

nullFunction() {}
