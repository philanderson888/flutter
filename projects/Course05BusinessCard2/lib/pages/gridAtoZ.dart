/// the goal of this app is to be an all-in-one demo app with as many features built into one app as possible
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import '../models/pageItem.dart';
import '../models/testClass.dart';
import 'dart:io';
import '../main.dart';
import 'audioPlayer.dart';
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

class GridAToZ extends StatelessWidget {
  const GridAToZ({Key? key}) : super(key: key);

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

    goToAlert() {
      print('going to rflutter alert');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Quiz02()));
    }

    goToAudioPlayer() {
      print('going to audio player');
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const AudioPlayerWidget()));
    }

    goToBackgroundImage() {
      print('going to background image');
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const BackgroundImage()));
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

    goToButtonTypes() {
      print('going to button types');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const ButtonTypes()));
    }

    goToClass() {
      print('displaying class details');
      print(
          'notice the special constructor which forces new instances to specify parameters by name');
      print('see PageItem class details below');
    }

    goToContainerLayout() {
      print('displaying container layout - rows and columns');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Destini01()));
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

    goToFontAwesomeIcons() {
      print('going to font awesome icons');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const BusinessCard()));
    }

    goToFonts() {
      print('going to font');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Fonts01()));
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

    goToThemeCustom() {
      print('going to theme - custom');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const ThemeCustom()));
    }

    goToThemeDark() {
      print('going to theme - dark');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const ThemeDark()));
    }

    goToThemeLight() {
      print('going to theme - light');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const ThemeLight()));
    }

    goToTypeDef() {
      print("TODO: type def");
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
        buttonText: "Components ",
        buttonColor: categoryButtonColor,
      ),
      PageItem(
        functionName: goToAlert,
        buttonText: "Alert",
      ),
      PageItem(
        functionName: goToAudioPlayer,
        buttonText: "Audio Player",
      ),
      PageItem(
        functionName: goToBackgroundImage,
        buttonText: "Background Image",
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
        functionName: goToButtonTypes,
        buttonText: "Button Types",
      ),
      PageItem(
        functionName: goToContainerLayout,
        buttonText: "Container Layout",
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
        functionName: goToThemeCustom,
        buttonText: "theme custom",
      ),
      PageItem(
        functionName: goToThemeLight,
        buttonText: "theme light",
      ),
      PageItem(
        functionName: goToThemeDark,
        buttonText: "theme dark",
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
          title: const Text('Main Index Gridview'),
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
