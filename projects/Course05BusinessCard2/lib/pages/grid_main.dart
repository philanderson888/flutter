/// the goal of this app is to be an all-in-one demo app with as many features built into one app as possible
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import '../models/page_item.dart';
import '../models/test_class.dart';
import 'dart:io';
import '../main.dart';
import 'audio_player.dart';
import 'xylophone.dart';
import 'quiz01.dart';
import 'quiz02.dart';
import 'padding.dart';
import 'destini01.dart';
import 'destini02.dart';
import 'destini03.dart';
import 'bmiCalculator01.dart';
import 'bmiCalculator02.dart';
import 'bmiCalculator03.dart';
import 'themeDark.dart';
import 'themeLight.dart';
import 'themeCustom.dart';

class Grid2 extends StatelessWidget {
  const Grid2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const gridSize = 70;
    const columnCount = 10;
    const initialListLength = 0;
    const categoryButtonColor = Color(0xFFF2B64B);

    List<String> buttonTexts = [
      "this is some button text",
      "this is some more button text"
    ];

    doNothing() {
      print('doing nothing');
    }

    goToAskAnyQuestion() {
      print('going to "ask any question"');
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const AskAnyQuestion()));
    }

    goToBlankPageTemplate() {
      print('going to blank page template');
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const BlankPageTemplate()));
    }

    goToBmiCalculator01() {
      print('going to BMI Calculator');
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const BmiCalculator01()));
    }

    goToBmiCalculator02() {
      print('going to BMI Calculator');
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const BmiCalculator02()));
    }

    goToBmiCalculator03() {
      print('going to BMI Calculator');
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const BmiCalculator03()));
    }

    goToBusinessCard() {
      print('going to business card');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const BusinessCard()));
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

    goToDestini01() {
      print('going to destini app - early layout stages');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Destini01()));
    }

    goToDestini02() {
      print('going to destini app - containers linking into choices');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Destini02()));
    }

    goToDestini03() {
      print('going to destini app - responding to choices');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Destini03()));
    }

    goToEmpty() {
      print('going to empty page');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Empty()));
    }

    goToLayout01() {
      print('going to row/column layout example');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Quiz02()));
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

    goToXylophone() {
      print('going to app xylophone');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Xylophone()));
    }

    instantiateTestClass() {
      print(" ");
      print(" ");
      print("instantiating a test class");
      var instance01 = TestClass(a: 1, b: "hi", c: true, privateProperty: 2.2);
      print(instance01);
      print(instance01.a);
      print(instance01.b);
      print(instance01.c);
      // cannot print(instance01._privateProperty);
    }

    fileOperationsSynchronous() {
      // write access only is granted so I have to learn to ask for permissions to make this a write version
      // https://pub.dev/packages/permission/example

      Directory('myFolder').createSync();

      if (Directory('myFolder').existsSync()) {
        print('myFolder directory exists, deleting it now');
        Directory('myFolder').deleteSync();
      }

      if (File('testFile.txt').existsSync()) {
        File('testFile.txt').deleteSync();
      }

      if (File('testFileRenamed.txt').existsSync()) {
        File('testFileRenamed.txt').deleteSync();
      }

      File('testFile.txt').createSync();
      File('testFile.txt').renameSync('testFileRenamed.txt');

      File('testFileRenamed.txt').deleteSync();

      if (File('testFileRenamed.txt').existsSync()) {
        print('file still exists');
      } else {
        print('file renamed then deleted');
      }

      // asynchronous equivalent
      // var thisFileExists = await io.File('testFileRenamed.txt').exists();
      // if (thisFileExists) {}
      // var thisFileRenamedExists = await io.File('testFileRenamed.txt').exists();

      //stdout.writeln('this is a test output from dart.io library');
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
        buttonText: "Templates",
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
        functionName: goToBmiCalculator01,
        buttonText: "BMI Calculator 01",
      ),
      PageItem(
        functionName: goToBmiCalculator02,
        buttonText: "BMI Calculator 02",
      ),
      PageItem(
        functionName: goToBmiCalculator03,
        buttonText: "BMI Calculator 03",
      ),
      PageItem(
        functionName: goToBusinessCard,
        buttonText: "Business Card",
      ),
      PageItem(
        functionName: goToDestini01,
        buttonText: " Destini 01 ",
      ),
      PageItem(
        functionName: goToDestini02,
        buttonText: " Destini 02",
      ),
      PageItem(
        functionName: goToDestini03,
        buttonText: " Destini 03",
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
        buttonText: " Print ",
        buttonColor: categoryButtonColor,
      ),
      PageItem(
        functionName: fileOperationsSynchronous,
        buttonText: "file operations synchronous",
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
      PageItem(
        functionName: doNothing,
        buttonText: " OOP ",
        buttonColor: categoryButtonColor,
      ),
      PageItem(
        functionName: instantiateTestClass,
        buttonText: "instantiate test class",
      ),
    ];

    print("Page items count " + pageItems.length.toString());

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.3),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Layouts, Templates, Apps, Print Operations, OOP'),
        ),
        body: GridView.count(
          crossAxisCount: columnCount,
          children: List.generate(gridSize, (index) {
            if (index < pageItems.length) {
              return ElevatedButton(
                key: null,
                onPressed: pageItems[index - initialListLength].functionName,
                child: Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Center(
                      child: Text(
                          pageItems[index - initialListLength].buttonText)),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      pageItems[index - initialListLength].buttonColor),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              );
            } else {
              return Center(
                child: Text(
                  '', // '''Item $index',
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
