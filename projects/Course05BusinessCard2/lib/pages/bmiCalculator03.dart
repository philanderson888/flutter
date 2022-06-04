import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// based on https://dribbble.com/shots/4585382-Simple-BMI-Calculator
// colours
//        app  #090C21
//        card #1D1E33
//        text #8D8E98

class BmiCalculator03 extends StatefulWidget {
  const BmiCalculator03({Key? key}) : super(key: key);

  @override
  State<BmiCalculator03> createState() => _BmiCalculator03State();
}

class _BmiCalculator03State extends State<BmiCalculator03> {
  @override
  Widget build(BuildContext context) {
    doNothing() {
      print('doing nothing');
    }

    // header, footer and body flex ratios
    const headingHeight = 3;
    const bodyHeight = 30;
    const footerHeight = 3;

    // body row flex ratios
    const int bodyRowBorder = 0;
    const int bodyWidth = 1;

    // body column flex ratios
    const bodyOuterPaddingHeight = 1;
    const bodyInnerPaddingHeight = 1;
    const bodyContainerHeight = 7;

    // card row flex ratios and sizes
    const cardOuterPadding = 1;
    const cardInnerPadding = 1;
    const cardWidth = 20;
    const cardBorderRadius = 18.0;

    // app colors
    const backgroundColor = Color(0xFF29083B);
    const appColor = Color(0xff4C2973);
    const colorPadding = Color(0xFF29083B);
    const cardBackground = Color(0xFF1D1E33);
    const cardForeground = Color(0xFF8D8E98);

    // header colors
    var headerColor = backgroundColor;

    // footer colors
    var footerColor = const Color(0xFFE31D6B);
    footerColor = const Color(0xFFE31D6B);
    const footerTextColor = Colors.white;
    const footerFontWeight = FontWeight.w600;

    // text
    const containerTextSize = 30.0;
    const footerTextSize = 21.0;
    String appHeader = 'BMI Calculator';
    String headerText = 'BMI CALCULATOR';
    String footerText = 'CALCULATE YOUR BMI';
    String textMale = 'MALE';
    String textFemale = 'FEMALE';
    String textHeight = 'HEIGHT';
    String textWeight = 'WEIGHT';
    String textAge = "AGE";

    // icons
    const iconDataInstagram = FontAwesomeIcons.instagram;
    const iconMale = FontAwesomeIcons.mars;
    const iconFemale = FontAwesomeIcons.venus;
    const iconAge = FontAwesomeIcons.venus;
    const iconWeight = FontAwesomeIcons.venus;
    const iconSize = 80.0;

    // cards

    const cardMale = CardMaleFemale(
      iconVisible: true,
      iconData: iconMale,
      iconSize: iconSize,
      cardText: 'MALE',
      cardForeground: cardForeground,
    );

    const cardFemale = CardMaleFemale(
      iconVisible: true,
      iconData: iconFemale,
      iconSize: iconSize,
      cardText: 'FEMALE',
      cardForeground: cardForeground,
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(
          backgroundColor: appColor,
          titleTextStyle: TextStyle(
            fontSize: 30,
            color: Colors.purple.shade400,
          ),
        ),
        scaffoldBackgroundColor: backgroundColor,
        textTheme: const TextTheme(
          headline1: TextStyle(color: Colors.yellow),
          headline3: TextStyle(color: Colors.yellow),
          bodyText2:
              TextStyle(color: cardForeground, fontSize: containerTextSize),
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color(0xff4C2973),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(appHeader),
        ),
        body: Column(
          children: [
            Header(
                headingHeight: headingHeight,
                headerColor: headerColor,
                headerText: headerText),
            Body(
              bodyHeight: bodyHeight,
              bodyRowBorder: bodyRowBorder,
              bodyWidth: bodyWidth,
              bodyOuterPaddingHeight: bodyOuterPaddingHeight,
              bodyContainerHeight: bodyContainerHeight,
              cardOuterPadding: cardOuterPadding,
              colorPadding: colorPadding,
              cardWidth: cardWidth,
              cardBorderRadius: cardBorderRadius,
              textMale: textMale,
              cardInnerPadding: cardInnerPadding,
              textFemale: textFemale,
              cardBackground: cardBackground,
              cardForeground: cardForeground,
              bodyInnerPaddingHeight: bodyInnerPaddingHeight,
              textHeight: textHeight,
              textWeight: textWeight,
              textAge: textAge,
              iconMale: iconMale,
              iconFemale: iconFemale,
              iconWeight: iconWeight,
              iconAge: iconAge,
              iconSize: iconSize,
            ),
            Footer(
              footerHeight: footerHeight,
              footerTextSize: footerTextSize,
              footerColor: footerColor,
              footerTextColor: footerTextColor,
              footerFontWeight: footerFontWeight,
              footerText: footerText,
            ),
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
    required this.headerColor,
    required this.headerText,
  }) : super(key: key);

  final int headingHeight;
  final Color headerColor;
  final String headerText;

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
              color: headerColor,
            ),
          ),
          Expanded(
            flex: 7,
            child: Center(
              child: Text(
                headerText,
                style: const TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: headerColor,
            ),
          ),
        ],
      ),
    );
  }
}

class Footer extends StatelessWidget {
  const Footer({
    Key? key,
    required this.footerHeight,
    required this.footerTextSize,
    required this.footerColor,
    required this.footerFontWeight,
    required this.footerTextColor,
    required this.footerText,
  }) : super(key: key);

  final int footerHeight;
  final double footerTextSize;
  final FontWeight footerFontWeight;
  final Color footerColor;
  final Color footerTextColor;
  final String footerText;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: footerHeight,
      child: Container(
        color: footerColor,
        child: Center(
          child: Text(
            footerText,
            style: TextStyle(
              fontSize: footerTextSize,
              fontWeight: footerFontWeight,
              color: footerTextColor,
            ),
          ),
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.bodyHeight,
    required this.bodyRowBorder,
    required this.bodyWidth,
    required this.bodyOuterPaddingHeight,
    required this.bodyContainerHeight,
    required this.cardOuterPadding,
    required this.colorPadding,
    required this.cardWidth,
    required this.cardBorderRadius,
    required this.textMale,
    required this.cardInnerPadding,
    required this.textFemale,
    required this.cardBackground,
    required this.cardForeground,
    required this.bodyInnerPaddingHeight,
    required this.textHeight,
    required this.textWeight,
    required this.textAge,
    required this.iconMale,
    required this.iconFemale,
    required this.iconWeight,
    required this.iconAge,
    required this.iconSize,
  }) : super(key: key);

  final int bodyHeight;
  final int bodyRowBorder;
  final int bodyWidth;
  final int bodyOuterPaddingHeight;
  final int bodyContainerHeight;
  final int cardOuterPadding;
  final Color colorPadding;

  final int cardWidth;
  final double cardBorderRadius;
  final String textMale;
  final int cardInnerPadding;
  final String textFemale;
  final Color cardBackground;
  final Color cardForeground;
  final int bodyInnerPaddingHeight;
  final String textHeight;
  final String textWeight;
  final String textAge;
  final IconData iconMale;
  final IconData iconFemale;
  final IconData iconWeight;
  final IconData iconAge;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: bodyHeight,
      child: Row(
        children: [
          BodyRowBorder(bodyRowBorder: bodyRowBorder),
          BodyColumn(
            bodyWidth: bodyWidth,
            bodyOuterPaddingHeight: bodyOuterPaddingHeight,
            bodyContainerHeight: bodyContainerHeight,
            cardOuterPadding: cardOuterPadding,
            colorPadding: colorPadding,
            cardWidth: cardWidth,
            cardBorderRadius: cardBorderRadius,
            textMale: textMale,
            cardInnerPadding: cardInnerPadding,
            textFemale: textFemale,
            cardBackground: cardBackground,
            cardForeground: cardForeground,
            bodyInnerPaddingHeight: bodyInnerPaddingHeight,
            textHeight: textHeight,
            textWeight: textWeight,
            textAge: textAge,
            iconMale: iconMale,
            iconFemale: iconFemale,
            iconWeight: iconWeight,
            iconAge: iconAge,
            iconSize: iconSize,
          ),
          BodyRowBorder(bodyRowBorder: bodyRowBorder),
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
    required this.bodyContainerHeight,
    required this.cardOuterPadding,
    required this.colorPadding,
    required this.cardWidth,
    required this.cardBorderRadius,
    required this.textMale,
    required this.cardInnerPadding,
    required this.textFemale,
    required this.cardBackground,
    required this.bodyInnerPaddingHeight,
    required this.textHeight,
    required this.textWeight,
    required this.textAge,
    required this.iconMale,
    required this.iconFemale,
    required this.iconWeight,
    required this.iconAge,
    required this.iconSize,
    required this.cardForeground,
  }) : super(key: key);

  final int bodyWidth;
  final int bodyOuterPaddingHeight;

  final int bodyContainerHeight;
  final int cardOuterPadding;
  final Color colorPadding;
  final int cardWidth;
  final double cardBorderRadius;
  final String textMale;
  final int cardInnerPadding;
  final String textFemale;
  final Color cardBackground;
  final int bodyInnerPaddingHeight;
  final String textHeight;
  final String textWeight;
  final String textAge;
  final IconData iconMale;
  final IconData iconFemale;
  final IconData iconWeight;
  final IconData iconAge;
  final double iconSize;
  final Color cardForeground;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: bodyWidth,
      child: Column(
        children: [
          BodyOuterPadding(
              bodyOuterPaddingHeight: bodyOuterPaddingHeight,
              colorPadding: colorPadding),

          //
          // left right row
          //
          Expanded(
            flex: bodyContainerHeight,
            child: Row(
              children: [
                Expanded(
                  flex: cardOuterPadding,
                  child: Container(color: colorPadding),
                ),
                ExpandingCard(
                  cardWidth: cardWidth,
                  cardBorderRadius: cardBorderRadius,
                  cardBackground: cardBackground,
                  cardForeground: cardForeground,
                  cardText: 'LEFT',
                  iconData: FontAwesomeIcons.mars,
                  iconSize: iconSize,
                ),
                Expanded(
                  flex: cardInnerPadding,
                  child: Container(color: colorPadding),
                ),
                ExpandingCard(
                  cardWidth: cardWidth,
                  cardBorderRadius: cardBorderRadius,
                  cardText: 'RIGHT',
                  cardBackground: cardBackground,
                  cardForeground: cardForeground,
                  iconData: FontAwesomeIcons.venus,
                  iconSize: iconSize,
                ),
                Expanded(
                  flex: cardOuterPadding,
                  child: Container(color: colorPadding),
                ),
              ],
            ),
          ),
          BodyInnerPadding(
              bodyInnerPaddingHeight: bodyInnerPaddingHeight,
              colorPadding: colorPadding),

          //
          // height central row
          //
          Expanded(
            flex: bodyContainerHeight,
            child: Row(
              children: [
                Expanded(
                  flex: cardOuterPadding,
                  child: Container(color: colorPadding),
                ),
                Expanded(
                  flex: cardWidth * 2 + cardInnerPadding,
                  child: Container(
                    decoration: BoxDecoration(
                      color: cardBackground,
                      borderRadius: BorderRadius.circular(cardBorderRadius),
                    ),
                    child: Center(
                      child: Column(children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            color: Colors.green,
                          ),
                        ),
                        Expanded(
                          flex: 16,
                          child: Center(child: Text('HEIGHT')),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            color: Colors.green,
                          ),
                        ),
                      ]),
                    ),
                  ),
                ),
                Expanded(
                  flex: cardOuterPadding,
                  child: Container(color: colorPadding),
                ),
              ],
            ),
          ),
          BodyInnerPadding(
              bodyInnerPaddingHeight: bodyInnerPaddingHeight,
              colorPadding: colorPadding),
          //
          // weight and age row
          //
          Expanded(
            flex: bodyContainerHeight,
            child: Row(
              children: [
                Expanded(
                  flex: cardOuterPadding,
                  child: Container(color: colorPadding),
                ),
                Expanded(
                  flex: cardWidth,
                  child: Container(
                    decoration: BoxDecoration(
                      color: cardBackground,
                      borderRadius: BorderRadius.circular(cardBorderRadius),
                    ),
                    child: Center(
                      child: Column(children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            color: Colors.green,
                          ),
                        ),
                        Expanded(
                          flex: 24,
                          child: Center(
                            child: FaIcon(
                              FontAwesomeIcons.venus,
                              color: cardForeground,
                              size: iconSize,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            color: Colors.green,
                          ),
                        ),
                        Expanded(
                          flex: 16,
                          child: Center(child: Text('WEIGHT')),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            color: Colors.green,
                          ),
                        ),
                      ]),
                    ),
                  ),
                ),
                Expanded(
                  flex: cardInnerPadding,
                  child: Container(color: colorPadding),
                ),
                Expanded(
                  flex: cardWidth,
                  child: Container(
                    decoration: BoxDecoration(
                      color: cardBackground,
                      borderRadius: BorderRadius.circular(cardBorderRadius),
                    ),
                    child: Center(
                      child: Column(children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            color: Colors.green,
                          ),
                        ),
                        Expanded(
                          flex: 24,
                          child: Center(
                            child: FaIcon(
                              FontAwesomeIcons.venus,
                              color: cardForeground,
                              size: iconSize,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            color: Colors.green,
                          ),
                        ),
                        Expanded(
                          flex: 16,
                          child: Center(child: Text('AGE')),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            color: Colors.green,
                          ),
                        ),
                      ]),
                    ),
                  ),
                ),
                Expanded(
                  flex: cardOuterPadding,
                  child: Container(color: colorPadding),
                ),
              ],
            ),
          ),
          BodyOuterPadding(
              bodyOuterPaddingHeight: bodyOuterPaddingHeight,
              colorPadding: colorPadding),
        ],
      ),
    );
  }
}

// ignore from here on down for now

class BodyRowBorder extends StatelessWidget {
  const BodyRowBorder({
    Key? key,
    required this.bodyRowBorder,
  }) : super(key: key);

  final int bodyRowBorder;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: bodyRowBorder,
      child: Container(),
    );
  }
}

class BodySingleRow extends StatelessWidget {
  const BodySingleRow({
    Key? key,
    required this.bodyContainerHeight,
    required this.cardOuterPadding,
    required this.colorPadding,
    required this.cardWidth,
    required this.cardBorderRadius,
    required this.textHeight,
    required this.cardBackground,
    required this.cardForeground,
    required this.iconSize,
  }) : super(key: key);

  final int bodyContainerHeight;
  final int cardOuterPadding;
  final Color colorPadding;
  final int cardWidth;
  final double cardBorderRadius;
  final String textHeight;
  final Color cardBackground;
  final Color cardForeground;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: bodyContainerHeight,
      child: Row(
        children: [
          Expanded(
            flex: cardOuterPadding,
            child: Container(color: colorPadding),
          ),
          ExpandingCard(
            cardWidth: 2 * cardWidth,
            cardBorderRadius: cardBorderRadius,
            cardText: textHeight,
            cardBackground: cardBackground,
            cardForeground: cardForeground,
            iconSize: iconSize,
          ),
          Expanded(
            flex: cardOuterPadding,
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
    required this.cardOuterPadding,
    required this.colorPadding,
    required this.cardWidth,
    required this.cardBorderRadius,
    required this.textLeft,
    required this.cardInnerPadding,
    required this.textRight,
    required this.cardBackground,
    required this.cardForeground,
    required this.iconLeft,
    required this.iconRight,
    required this.iconSize,
  }) : super(key: key);

  final int bodyContainerHeight;
  final int cardOuterPadding;
  final Color colorPadding;

  final int cardWidth;
  final double cardBorderRadius;
  final String textLeft;
  final int cardInnerPadding;
  final String textRight;
  final Color cardBackground;
  final Color cardForeground;
  final IconData iconLeft;
  final IconData iconRight;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: bodyContainerHeight,
      child: Row(
        children: [
          Expanded(
            flex: cardOuterPadding,
            child: Container(color: colorPadding),
          ),
          ExpandingCard(
            cardWidth: cardWidth,
            cardBorderRadius: cardBorderRadius,
            cardText: textLeft,
            cardBackground: cardBackground,
            cardForeground: cardForeground,
            iconData: iconLeft,
            iconSize: iconSize,
          ),
          Expanded(
            flex: cardInnerPadding,
            child: Container(color: colorPadding),
          ),
          ExpandingCard(
            cardWidth: cardWidth,
            cardBorderRadius: cardBorderRadius,
            cardText: textRight,
            cardBackground: cardBackground,
            cardForeground: cardForeground,
            iconData: iconRight,
            iconSize: iconSize,
          ),
          Expanded(
            flex: cardOuterPadding,
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
    required this.colorPadding,
  }) : super(key: key);

  final int bodyInnerPaddingHeight;
  final Color colorPadding;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: bodyInnerPaddingHeight,
      child: Container(color: colorPadding),
    );
  }
}

class BodyOuterPadding extends StatelessWidget {
  const BodyOuterPadding({
    Key? key,
    required this.bodyOuterPaddingHeight,
    required this.colorPadding,
  }) : super(key: key);

  final int bodyOuterPaddingHeight;
  final Color colorPadding;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: bodyOuterPaddingHeight,
      child: Container(color: colorPadding),
    );
  }
}

class ExpandingCard extends StatelessWidget {
  ExpandingCard({
    Key? key,
    required this.cardWidth,
    required this.cardBorderRadius,
    required this.cardText,
    required this.cardBackground,
    required this.cardForeground,
    this.iconData = FontAwesomeIcons.instagram,
    required this.iconSize,
  }) : super(key: key);

  final int cardWidth;
  final double cardBorderRadius;
  final String cardText;
  final Color cardBackground;
  final Color cardForeground;
  final IconData iconData;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    var iconVisible = true;
    if (iconData == FontAwesomeIcons.instagram) {
      iconVisible = false;
    }
    return Expanded(
      flex: cardWidth,
      child: Container(
        decoration: BoxDecoration(
          color: cardBackground,
          borderRadius: BorderRadius.circular(cardBorderRadius),
        ),
        child: Center(
          child: Column(children: [
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.green,
              ),
            ),
            Visibility(
              visible: iconVisible,
              child: Expanded(
                flex: 24,
                child: Center(
                  child: FaIcon(
                    iconData,
                    color: cardForeground,
                    size: iconSize,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.green,
              ),
            ),
            Expanded(
              flex: 16,
              child: Center(child: Text(cardText)),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.green,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class CardMaleFemale extends StatelessWidget {
  const CardMaleFemale({
    Key? key,
    required this.iconVisible,
    required this.iconData,
    required this.iconSize,
    required this.cardText,
    required this.cardForeground,
  }) : super(key: key);

  final bool iconVisible;
  final IconData iconData;
  final double iconSize;
  final String cardText;
  final Color cardForeground;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.green,
          ),
        ),
        Visibility(
          visible: iconVisible,
          child: Expanded(
            flex: 24,
            child: Center(
              child: FaIcon(
                iconData,
                color: cardForeground,
                size: iconSize,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.green,
          ),
        ),
        Expanded(
          flex: 16,
          child: Center(child: Text(cardText)),
        ),
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.green,
          ),
        ),
      ]),
    );
  }
}
