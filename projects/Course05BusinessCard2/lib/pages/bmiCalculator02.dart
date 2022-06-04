import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// based on https://dribbble.com/shots/4585382-Simple-BMI-Calculator
// two colour from this app are background #090C21 container #1D1E33

class BmiCalculator02 extends StatefulWidget {
  const BmiCalculator02({Key? key}) : super(key: key);

  @override
  State<BmiCalculator02> createState() => _BmiCalculator02State();
}

class _BmiCalculator02State extends State<BmiCalculator02> {
  @override
  Widget build(BuildContext context) {
    doNothing() {
      print('doing nothing');
    }

    // header, footer and main body (column)
    int headingHeight = 3;
    int bodyHeight = 30;
    int footerHeight = 3;
    // color: Color(0xff05060C),
    var headerAndFooterColor = const Color(0xff0D5411);
    var colorPadding = Colors.orange;
    var bodyPaddingColor = Colors.pink;

    // body row
    int containerBorder = 1;
    int bodyWidth = 30;

    // body column
    int bodyOuterPaddingHeight = 1;
    int bodyInnerPaddingHeight = 1;
    int bodyContainerHeight = 7;

    // container row
    int containerOuterPadding = 1;
    int containerInnerPadding = 1;
    int containerWidth = 20;
    var containerBorderRadius = 18.0;

    var cardColor = Colors.yellow;

    String textMale = "MALE";
    String textFemale = "FEMALE";
    String textHeight = "HEIGHT";
    String textWeight = "WEIGHT";
    String textAge = "AGE";

    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(
          backgroundColor: const Color(0xff4C2973),
          titleTextStyle: TextStyle(
            fontSize: 30,
            color: Colors.purple.shade400,
          ),
        ),
        scaffoldBackgroundColor: const Color(0xFF0a0d22),
        textTheme: const TextTheme(
          headline1: TextStyle(color: Colors.yellow),
          headline3: TextStyle(color: Colors.yellow),
          bodyText2: TextStyle(color: Colors.purple),
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color(0xff4C2973),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('BMI Calculator'),
        ),
        body: Column(
          children: [
            Header(
                headingHeight: headingHeight,
                headerAndFooterColor: headerAndFooterColor),
            Body(
                bodyHeight: bodyHeight,
                containerBorder: containerBorder,
                bodyWidth: bodyWidth,
                bodyOuterPaddingHeight: bodyOuterPaddingHeight,
                bodyContainerHeight: bodyContainerHeight,
                containerOuterPadding: containerOuterPadding,
                colorPadding: colorPadding,
                bodyPaddingColor: bodyPaddingColor,
                containerWidth: containerWidth,
                containerBorderRadius: containerBorderRadius,
                textMale: textMale,
                containerInnerPadding: containerInnerPadding,
                textFemale: textFemale,
                cardColor: cardColor,
                bodyInnerPaddingHeight: bodyInnerPaddingHeight,
                textHeight: textHeight,
                textWeight: textWeight,
                textAge: textAge),
            Footer(
                footerHeight: footerHeight,
                headerAndFooterColor: headerAndFooterColor),
          ],
        ),
        floatingActionButton: IconTheme(
          child: FloatingActionButton(
            onPressed: doNothing,
            child: const Icon(
              Icons.add,
              color: Color(0xffab47bc),
            ),
          ),
          data: const IconThemeData(color: Colors.purple),
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key? key,
    required this.headingHeight,
    required this.headerAndFooterColor,
  }) : super(key: key);

  final int headingHeight;
  final Color headerAndFooterColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: headingHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: headerAndFooterColor,
            ),
          ),
          const Expanded(
            flex: 7,
            child: Center(
              child: Text(
                'BMI CALCULATOR',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: headerAndFooterColor,
            ),
          ),
        ],
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.bodyHeight,
    required this.containerBorder,
    required this.bodyWidth,
    required this.bodyOuterPaddingHeight,
    required this.bodyContainerHeight,
    required this.containerOuterPadding,
    required this.colorPadding,
    required this.bodyPaddingColor,
    required this.containerWidth,
    required this.containerBorderRadius,
    required this.textMale,
    required this.containerInnerPadding,
    required this.textFemale,
    required this.cardColor,
    required this.bodyInnerPaddingHeight,
    required this.textHeight,
    required this.textWeight,
    required this.textAge,
  }) : super(key: key);

  final int bodyHeight;
  final int containerBorder;
  final int bodyWidth;
  final int bodyOuterPaddingHeight;
  final int bodyContainerHeight;
  final int containerOuterPadding;
  final MaterialColor colorPadding;
  final MaterialColor bodyPaddingColor;
  final int containerWidth;
  final double containerBorderRadius;
  final String textMale;
  final int containerInnerPadding;
  final String textFemale;
  final MaterialColor cardColor;
  final int bodyInnerPaddingHeight;
  final String textHeight;
  final String textWeight;
  final String textAge;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: bodyHeight,
      child: Row(
        children: [
          BodyRowBorder(containerBorder: containerBorder),
          BodyColumn(
              bodyWidth: bodyWidth,
              bodyOuterPaddingHeight: bodyOuterPaddingHeight,
              bodyContainerHeight: bodyContainerHeight,
              containerOuterPadding: containerOuterPadding,
              colorPadding: colorPadding,
              bodyPaddingColor: bodyPaddingColor,
              containerWidth: containerWidth,
              containerBorderRadius: containerBorderRadius,
              textMale: textMale,
              containerInnerPadding: containerInnerPadding,
              textFemale: textFemale,
              cardColor: cardColor,
              bodyInnerPaddingHeight: bodyInnerPaddingHeight,
              textHeight: textHeight,
              textWeight: textWeight,
              textAge: textAge),
          BodyRowBorder(containerBorder: containerBorder),
        ],
      ),
    );
  }
}

class BodyColumn extends StatelessWidget {
  const BodyColumn({
    Key? key,
    required this.bodyWidth,
    required this.bodyOuterPaddingHeight,
    required this.bodyPaddingColor,
    required this.bodyContainerHeight,
    required this.containerOuterPadding,
    required this.colorPadding,
    required this.containerWidth,
    required this.containerBorderRadius,
    required this.textMale,
    required this.containerInnerPadding,
    required this.textFemale,
    required this.cardColor,
    required this.bodyInnerPaddingHeight,
    required this.textHeight,
    required this.textWeight,
    required this.textAge,
  }) : super(key: key);

  final int bodyWidth;
  final int bodyOuterPaddingHeight;
  final MaterialColor bodyPaddingColor;
  final int bodyContainerHeight;
  final int containerOuterPadding;
  final MaterialColor colorPadding;
  final int containerWidth;
  final double containerBorderRadius;
  final String textMale;
  final int containerInnerPadding;
  final String textFemale;
  final MaterialColor cardColor;
  final int bodyInnerPaddingHeight;
  final String textHeight;
  final String textWeight;
  final String textAge;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: bodyWidth,
      child: Column(
        children: [
          BodyOuterPadding(
              bodyOuterPaddingHeight: bodyOuterPaddingHeight,
              bodyPaddingColor: bodyPaddingColor),
          BodyDoubleRow(
              bodyContainerHeight: bodyContainerHeight,
              containerOuterPadding: containerOuterPadding,
              colorPadding: colorPadding,
              bodyPaddingColor: bodyPaddingColor,
              containerWidth: containerWidth,
              containerBorderRadius: containerBorderRadius,
              textLeft: textMale,
              containerInnerPadding: containerInnerPadding,
              textRight: textFemale,
              cardColor: cardColor),
          BodyInnerPadding(
              bodyInnerPaddingHeight: bodyInnerPaddingHeight,
              bodyPaddingColor: bodyPaddingColor),
          BodySingleRow(
            bodyContainerHeight: bodyContainerHeight,
            containerOuterPadding: containerOuterPadding,
            colorPadding: colorPadding,
            containerWidth: containerWidth,
            containerBorderRadius: containerBorderRadius,
            textHeight: textHeight,
            cardColor: cardColor,
          ),
          BodyInnerPadding(
              bodyInnerPaddingHeight: bodyInnerPaddingHeight,
              bodyPaddingColor: bodyPaddingColor),
          BodyDoubleRow(
              bodyContainerHeight: bodyContainerHeight,
              containerOuterPadding: containerOuterPadding,
              colorPadding: colorPadding,
              bodyPaddingColor: bodyPaddingColor,
              containerWidth: containerWidth,
              containerBorderRadius: containerBorderRadius,
              textLeft: textWeight,
              containerInnerPadding: containerInnerPadding,
              textRight: textAge,
              cardColor: cardColor),
          BodyOuterPadding(
              bodyOuterPaddingHeight: bodyOuterPaddingHeight,
              bodyPaddingColor: bodyPaddingColor),
        ],
      ),
    );
  }
}

class Footer extends StatelessWidget {
  const Footer({
    Key? key,
    required this.footerHeight,
    required this.headerAndFooterColor,
  }) : super(key: key);

  final int footerHeight;
  final Color headerAndFooterColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: footerHeight,
      child: Container(
        color: headerAndFooterColor,
        child: const Center(
          child: Text(
            'CALCULATE YOUR BMI',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: Colors.white70,
            ),
          ),
        ),
      ),
    );
  }
}

class BodyRowBorder extends StatelessWidget {
  const BodyRowBorder({
    Key? key,
    required this.containerBorder,
  }) : super(key: key);

  final int containerBorder;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: containerBorder,
      child: Container(),
    );
  }
}

class BodySingleRow extends StatelessWidget {
  const BodySingleRow(
      {Key? key,
      required this.bodyContainerHeight,
      required this.containerOuterPadding,
      required this.colorPadding,
      required this.containerWidth,
      required this.containerBorderRadius,
      required this.textHeight,
      required this.cardColor})
      : super(key: key);

  final int bodyContainerHeight;
  final int containerOuterPadding;
  final MaterialColor colorPadding;
  final int containerWidth;
  final double containerBorderRadius;
  final String textHeight;
  final Color cardColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: bodyContainerHeight,
      child: Row(
        children: [
          Expanded(
            flex: containerOuterPadding,
            child: Container(color: colorPadding),
          ),
          ExpandingContainer(
            containerWidth: 2 * containerWidth,
            containerBorderRadius: containerBorderRadius,
            cardText: textHeight,
            cardColor: cardColor,
          ),
          Expanded(
            flex: containerOuterPadding,
            child: Container(color: colorPadding),
          ),
        ],
      ),
    );
  }
}

class BodyDoubleRow extends StatelessWidget {
  const BodyDoubleRow({
    Key? key,
    required this.bodyContainerHeight,
    required this.containerOuterPadding,
    required this.colorPadding,
    required this.bodyPaddingColor,
    required this.containerWidth,
    required this.containerBorderRadius,
    required this.textLeft,
    required this.containerInnerPadding,
    required this.textRight,
    required this.cardColor,
  }) : super(key: key);

  final int bodyContainerHeight;
  final int containerOuterPadding;
  final MaterialColor colorPadding;
  final MaterialColor bodyPaddingColor;
  final int containerWidth;
  final double containerBorderRadius;
  final String textLeft;
  final int containerInnerPadding;
  final String textRight;
  final Color cardColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: bodyContainerHeight,
      child: Row(
        children: [
          Expanded(
            flex: containerOuterPadding,
            child: Container(color: colorPadding),
          ),
          ExpandingContainer(
              containerWidth: containerWidth,
              containerBorderRadius: containerBorderRadius,
              cardText: textLeft,
              cardColor: cardColor),
          Expanded(
            flex: containerInnerPadding,
            child: Container(color: bodyPaddingColor),
          ),
          ExpandingContainer(
            containerWidth: containerWidth,
            containerBorderRadius: containerBorderRadius,
            cardText: textRight,
            cardColor: cardColor,
          ),
          Expanded(
            flex: containerOuterPadding,
            child: Container(color: colorPadding),
          ),
        ],
      ),
    );
  }
}

class BodyInnerPadding extends StatelessWidget {
  const BodyInnerPadding({
    Key? key,
    required this.bodyInnerPaddingHeight,
    required this.bodyPaddingColor,
  }) : super(key: key);

  final int bodyInnerPaddingHeight;
  final MaterialColor bodyPaddingColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: bodyInnerPaddingHeight,
      child: Container(color: bodyPaddingColor),
    );
  }
}

class BodyOuterPadding extends StatelessWidget {
  const BodyOuterPadding({
    Key? key,
    required this.bodyOuterPaddingHeight,
    required this.bodyPaddingColor,
  }) : super(key: key);

  final int bodyOuterPaddingHeight;
  final MaterialColor bodyPaddingColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: bodyOuterPaddingHeight,
      child: Container(color: bodyPaddingColor),
    );
  }
}

class ExpandingContainer extends StatelessWidget {
  const ExpandingContainer({
    Key? key,
    required this.containerWidth,
    required this.containerBorderRadius,
    required this.cardText,
    required this.cardColor,
  }) : super(key: key);

  final int containerWidth;
  final double containerBorderRadius;
  final String cardText;
  final Color cardColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: containerWidth,
      child: Container(
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(containerBorderRadius),
          ),
          child: Center(child: Text(cardText))),
    );
  }
}
