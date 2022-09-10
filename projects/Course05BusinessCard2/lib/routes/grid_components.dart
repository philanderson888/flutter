import 'package:flutter/material.dart';
import 'package:flutter_teaching_app/apps/bitcoin_02.dart';
import 'package:flutter_teaching_app/apps/bmi_calculator_04.dart';
import 'package:flutter_teaching_app/pages/containers_centred.dart';
import 'package:flutter_teaching_app/pages/loading_animation_01.dart';
import 'package:flutter_teaching_app/apps/weather_02.dart';
import 'package:flutter_teaching_app/pages/passing_data_screen_1.dart';
import '../models/page_item.dart';
import '../main.dart';
import '../pages/audio_player.dart';
import '../apps/xylophone.dart';
import '../apps/quiz01.dart';
import '../apps/quiz02.dart';
import '../pages/padding.dart';
import '../apps/destini01.dart';
import '../apps/bmi_calculator_03.dart';
import '../pages/theme_dark.dart';
import '../pages/theme_light.dart';
import '../pages/theme_custom.dart';
import '../pages/geolocation.dart';
import '../pages/spinner_01.dart';
import '../pages/passing_data_screen_1.dart';
import 'package:flutter_teaching_app/constants.dart';
import '../forms/drop_down_01.dart';

class GridAToZ extends StatelessWidget {
  const GridAToZ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int screenWidth = (MediaQuery.of(context).size.width).round();
    int screenHeight = (MediaQuery.of(context).size.height).round();
    print('width $screenWidth height $screenHeight');

    const initialListLength = 0;
    double textScaleFactor = 1.4;

    int gridSize = 70;
    int columnCount = 6;

    if (screenWidth < 700) {
      columnCount = 4;
      textScaleFactor = 1.0;
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

    goToContainerLayout() {
      print('displaying container layout - rows and columns');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Destini01()));
    }

    goToContainersCentred() {
      print('container layout with row/column, all centred');
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const ContainersCentered()));
    }

    goToContainersRounded() {
      print('rounded container');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Bitcoin02()));
    }

    goToCourseLayoutExercise() {
      print('TODO: fix this name as it is vague');
      print('going to course layout exercise');
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const CourseLayoutExercise()));
    }

    goToDivider() {
      print('going to divider');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const BusinessCard()));
    }

    goToDropDown() {
      print('go to dropdown');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const DropDown01()));
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

    goToGeolocation() {
      print('show geolocation services in action');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Geolocation()));
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

    goToLifeCycleMethods() {
      print('going to lifecycle methods');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Weather02()));
    }

    goToListTile() {
      print('going to list tile');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const ListTile01()));
    }

    goToLoadingAnimation01() {
      print('going to loading animation 01');
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const LoadingAnimation01()));
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

    goToStatefulWidgetPassDataIn() {
      print('widget - pass data on push/pop');
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const StatefulWidgetPassDataIn01()));
    }

    goToRandom() {
      print('going to randomise function - ');
      print('note - need the `import dart:math` library');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Dice03()));
    }

    goToRowBaseline() {
      print(
          'going to row baseline alignment (aligns text of different size to a common baseline horizontally)');
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const BmiCalculator03()));
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

    goToSlider() {
      print('going to slider');
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const BmiCalculator03()));
    }

    goToSpinner01() {
      print('going to spinner 01');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Spinner01()));
    }

    goToStatelessWidgetWithParameters() {
      print('goint to stateless widget passing parameters');
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const BmiCalculator04()));
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

    List<PageItem> pageItems = [
      PageItem(
        functionName: goToAlert,
        buttonText: "Alert",
      ),
      PageItem(
        functionName: goToLoadingAnimation01,
        buttonText: "Async Await",
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
        functionName: goToContainersCentred,
        buttonText: "Containers Centred",
      ),
      PageItem(
        functionName: goToContainersRounded,
        buttonText: "Containers Rounded",
      ),
      PageItem(
        functionName: goToCourseLayoutExercise,
        buttonText: "Course Layout Exercise",
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
        buttonText: "Function returns component",
      ),
      PageItem(
        functionName: goToGeolocation,
        buttonText: "Geolocation",
      ),
      PageItem(
        functionName: gotoGridViewOfClickableImages,
        buttonText: "Grid Images Clickable",
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
        functionName: goToLifeCycleMethods,
        buttonText: "Lifecycle Methods",
      ),
      PageItem(
        functionName: goToLoadingAnimation01,
        buttonText: "Loading Animation",
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
        functionName: goToRowBaseline,
        buttonText: "Row Baseline",
      ),
      PageItem(
        functionName: goToSafeArea,
        buttonText: "Safe Area",
      ),
      PageItem(
        functionName: goToSizedBox,
        buttonText: "Sized Box (TODO)",
      ),
      PageItem(
        functionName: goToSlider,
        buttonText: "Slider",
      ),
      PageItem(
        functionName: goToSpinner01,
        buttonText: "Spinner",
      ),
      PageItem(
          functionName: goToStatelessWidgetWithParameters,
          buttonText: "Stateless Widget Params"),
      PageItem(
        functionName: goToStatefulWidget,
        buttonText: "Stateful Widget",
      ),
      PageItem(
        functionName: goToStatefulWidgetPassDataIn,
        buttonText: "Widget - Pass Data On Push/Pop",
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
        buttonText: " Form Features ",
        buttonColor: kGold,
      ),
      PageItem(
        functionName: goToDropDown,
        buttonText: "DropDown",
      ),
    ];

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: textScaleFactor),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Features By Name'),
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
                  '', //'''Item $index',
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
