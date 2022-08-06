/// the goal of this app is to be an all-in-one demo app with as many features built into one app as possible
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:english_words/english_words.dart';
import 'package:flutter_teaching_app/constants.dart';
import 'package:flutter_teaching_app/templates/app_template_01.dart';
import 'package:flutter_teaching_app/models/mixin.dart';
import '../models/page_item.dart';
import '../models/test_class.dart';
import '../main.dart';
import '../apps/quiz02.dart';
import '../templates/blank_page_template_01.dart';

class Grid2 extends StatelessWidget {
  const Grid2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const gridSize = 56;
    const columnCount = 8;
    const initialListLength = 0;
    const textScaleFactor = 1.4;

    List<String> buttonTexts = [
      "this is some button text",
      "this is some more button text"
    ];

    doNothing() {
      print('doing nothing');
    }

    //
    // Templates
    //

    goToAppTemplate01() {
      print('going to app template 01');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const AppTemplate01()));
    }

    goToBlankPageTemplate() {
      print('going to blank page template');
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const BlankPageTemplate()));
    }

    goToEmpty() {
      print('going to empty page');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Empty()));
    }

    //
    // Layouts
    //

    goToLayout01() {
      print('going to row/column layout example');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Quiz02()));
    }

    //
    // Examples With Text Output Only
    //

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

    printNumberToStringWithPrecisionSignificantDigits() {
      print(" ");
      print(" ");
      print(
          'printing a number to a given degree of precision ie significant digits');
      double number = 1.234567;
      print("number $number precision 2 ${number.toStringAsPrecision(2)}");
      print("number $number precision 3 ${number.toStringAsPrecision(3)}");
      print("number $number precision 4 ${number.toStringAsPrecision(4)}");
    }

    printNumberToStringWithFixedNumberOfDecimalPlaces() {
      print(" ");
      print(" ");
      print(
          'printing a number as a truncated string to a fixed number of decimal places ** note - this is no good as it is only truncating and we must have the number rounded properly before printing to string ...');
      double number = 1.234567;
      print("number $number to 2 decimal places ${number.toStringAsFixed(2)}");
      print("number $number to 3 decimal places ${number.toStringAsFixed(3)}");
      print("number $number to 4 decimal places ${number.toStringAsFixed(4)}");
    }

    //
    // OOP
    //

    goToPageClass() {
      print('displaying class details');
      print('see PageItem class');
      print('constructor specifies parameters by name');
    }

    goToInstantiation() {
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

    goToMixins() {
      print('mixin demo');
      print(' ');
      var mixinParent = MixinParent();
      var mixinChild01 = MixinChild01();
      var mixinChild02 = MixinChild02();
      var mixinChild03 = MixinChild03();
      mixinParent.parentBehaviour();
      mixinChild01.parentBehaviour();
      mixinChild02.parentBehaviour();
      mixinChild03.parentBehaviour();
      mixinChild03.uniqueBehaviour01();
      mixinChild03.uniqueBehaviour02();
    }

    List<PageItem> pageItems = [
      PageItem(
        functionName: doNothing,
        buttonText: "Templates",
        buttonColor: kGold,
      ),
      PageItem(
        functionName: goToAppTemplate01,
        buttonText: "App Template 01",
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
        buttonColor: kGold,
      ),
      PageItem(
        functionName: goToLayout01,
        buttonText: "Layout Row/Column",
      ),
      PageItem(
        functionName: doNothing,
        buttonText: " Print ",
        buttonColor: kGold,
      ),
      PageItem(
        functionName: fileOperationsSynchronous,
        buttonText: " Files ",
      ),
      PageItem(
        functionName: printEnglishWords,
        buttonText: " Create English Words",
      ),
      PageItem(
        functionName: printListOfInstances,
        buttonText: " List<T> ",
      ),
      PageItem(
        functionName: printListOfStrings,
        buttonText: " List<String>",
      ),
      PageItem(
        functionName: printNumberToStringWithPrecisionSignificantDigits,
        buttonText: " Numbers - Precision",
      ),
      PageItem(
        functionName: printNumberToStringWithFixedNumberOfDecimalPlaces,
        buttonText: " Number - Decimal Place",
      ),
      PageItem(
        functionName: doNothing,
        buttonText: " OOP ",
        buttonColor: kGold,
      ),
      PageItem(
        functionName: goToPageClass,
        buttonText: " Constructor",
      ),
      PageItem(
        functionName: goToInstantiation,
        buttonText: " Instantiation",
      ),
      PageItem(
        functionName: goToMixins,
        buttonText: " Mixin ",
      ),
    ];

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: textScaleFactor),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Layouts, Templates, Print Operations, OOP'),
        ),
        body: GridView.count(
          crossAxisCount: columnCount,
          children: List.generate(gridSize, (index) {
            if (index < pageItems.length) {
              return ElevatedButton(
                key: null,
                onPressed: pageItems[index - initialListLength].functionName,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
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
