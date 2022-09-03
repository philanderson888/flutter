import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants.dart';

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

enum Gender { male, female }

enum Counters { weight, age }

class _BmiCalculator03State extends State<BmiCalculator03> {
  final kCardBackgroundInactive = const Color(0xFF111328);
  final kCardBackgroundActive = const Color(0xFF1D1E33);

  var cardMaleBackground = const Color(0xFF111328);
  var cardFemaleBackground = const Color(0xFF111328);

  // slider
  int height = 160;

  // variables
  int weight = 70;
  int age = 30;

  doNothing() {
    print('doing nothing');
  }

  setCardMaleBackgroundColor() {
    setState(() {
      cardMaleBackground = kCardBackgroundActive;
      cardFemaleBackground = kCardBackgroundInactive;
    });
  }

  setCardFemaleBackgroundColor() {
    setState(() {
      cardFemaleBackground = kCardBackgroundActive;
      cardMaleBackground = kCardBackgroundInactive;
    });
  }

  setSliderState(double newValue) {
    setState(() {
      height = newValue.round();
      print('slider new value ${height.toString()}');
    });
  }

  incrementCounter(Counters counter, int increment) {
    print('counter = $counter');
    setState(() {
      if (counter == Counters.weight) {
        print('incrementing weight from $weight to ${weight + increment}');
        weight += increment;
      } else if (counter == Counters.age) {
        print('incrementing age from $age to ${age + increment}');
        age += increment;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
    var appColor = kDeepPurple;
    const colorPadding = Color(0xFF29083B);

    const cardForeground = Color(0xFF8D8E98);

    // header colors
    var headerColor = backgroundColor;

    // footer colors
    const footerTextColor = Colors.white;
    const footerFontWeight = FontWeight.w600;

    // text
    const containerTextSize = 30.0;
    const footerTextSize = 21.0;
    String appHeader = 'BMI Calculator';
    String headerText = 'BMI CALCULATOR';
    String textMale = 'MALE';
    String textFemale = 'FEMALE';
    String textHeight = 'HEIGHT';
    String textWeight = 'WEIGHT (kg)';
    String textAge = "AGE";

    // icons
    const iconSize = 80.0;
    const iconMale = FontAwesomeIcons.mars;
    const iconFemale = FontAwesomeIcons.venus;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(
          backgroundColor: appColor,
          titleTextStyle: TextStyle(
            fontSize: 30,
            color: kPurple400,
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
          secondary: kDeepPurple,
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
            //
            //
            Expanded(
              flex: bodyHeight,
              child: Row(
                children: [
                  Expanded(
                    flex: bodyRowBorder,
                    child: Container(),
                  ),
                  Expanded(
                    flex: bodyWidth,
                    child: Column(
                      children: [
                        Expanded(
                          flex: bodyOuterPaddingHeight,
                          child: Container(color: colorPadding),
                        ),

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
                              //
                              // card male
                              //
                              Expanded(
                                flex: cardWidth,
                                child: GestureDetector(
                                  onTap: setCardMaleBackgroundColor,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: cardMaleBackground,
                                      borderRadius: BorderRadius.circular(
                                          cardBorderRadius),
                                    ),
                                    child: Center(
                                      child: Column(children: [
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            color: Colors.green,
                                          ),
                                        ),
                                        const Expanded(
                                          flex: 24,
                                          child: Center(
                                            child: FaIcon(
                                              iconMale,
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
                                          child: Center(child: Text(textMale)),
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
                              ),
                              Expanded(
                                flex: cardInnerPadding,
                                child: Container(color: colorPadding),
                              ),
                              //
                              // card female
                              //

                              Expanded(
                                flex: cardWidth,
                                child: GestureDetector(
                                  onTap: setCardFemaleBackgroundColor,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: cardFemaleBackground,
                                      borderRadius: BorderRadius.circular(
                                          cardBorderRadius),
                                    ),
                                    child: Center(
                                      child: Column(children: [
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            color: Colors.green,
                                          ),
                                        ),
                                        const Expanded(
                                          flex: 24,
                                          child: Center(
                                            child: FaIcon(
                                              iconFemale,
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
                                          child:
                                              Center(child: Text(textFemale)),
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
                              ),
                              Expanded(
                                flex: cardOuterPadding,
                                child: Container(color: colorPadding),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: bodyInnerPaddingHeight,
                          child: Container(color: colorPadding),
                        ),

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
                                    color: kCardBackgroundInactive,
                                    borderRadius:
                                        BorderRadius.circular(cardBorderRadius),
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
                                        child: Column(
                                          children: [
                                            Expanded(
                                              flex: 3,
                                              child: Container(),
                                            ),
                                            Expanded(
                                              flex: 6,
                                              child: Center(
                                                child: Text(textHeight),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(),
                                            ),
                                            Expanded(
                                              flex: 10,
                                              child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .baseline,
                                                  textBaseline:
                                                      TextBaseline.alphabetic,
                                                  children: [
                                                    Expanded(
                                                      flex: 80,
                                                      child: Container(),
                                                    ),
                                                    Expanded(
                                                      flex: 20,
                                                      child: Text(
                                                        height.toString(),
                                                        style:
                                                            kBmiHugeTextStyle,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 15,
                                                      child: Text('cm',
                                                          style:
                                                              kBmiLargeTextStyle),
                                                    ),
                                                    Expanded(
                                                      flex: 80,
                                                      child: Container(),
                                                    ),
                                                  ]),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(),
                                            ),
                                            Expanded(
                                              flex: 5,
                                              child: SliderTheme(
                                                data: SliderTheme.of(context)
                                                    .copyWith(
                                                  activeTrackColor:
                                                      kBmiSliderColor,
                                                  inactiveTrackColor:
                                                      kBmiSliderColor,
                                                  thumbColor:
                                                      const Color(0xFFEB1555),
                                                  overlayColor:
                                                      const Color(0xCCEB1555),
                                                  thumbShape:
                                                      const RoundSliderThumbShape(
                                                          enabledThumbRadius:
                                                              15.0),
                                                  overlayShape:
                                                      const RoundSliderOverlayShape(
                                                          overlayRadius: 50.0),
                                                ),
                                                child: Slider(
                                                  value: height.toDouble(),
                                                  min: kBmiSliderMin,
                                                  max: kBmiSliderMax,
                                                  divisions: 100,
                                                  label: height.toString(),
                                                  onChanged: (double newValue) {
                                                    setSliderState(newValue);
                                                  },
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 3,
                                              child: Container(),
                                            ),
                                          ],
                                        ),
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
                        Expanded(
                          flex: bodyInnerPaddingHeight,
                          child: Container(color: colorPadding),
                        ),
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
                              //
                              // weight
                              //
                              Expanded(
                                flex: cardWidth,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: kCardBackgroundInactive,
                                    borderRadius:
                                        BorderRadius.circular(cardBorderRadius),
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
                                        child: Center(child: Text(textWeight)),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          color: Colors.green,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 16,
                                        child: Row(
                                          children: [
                                            Expanded(
                                                flex: 1, child: Container()),
                                            Expanded(
                                                flex: 16,
                                                child: Center(
                                                  child: Text(weight.toString(),
                                                      style:
                                                          kBmiLargeTextStyle),
                                                )),
                                            Expanded(
                                                flex: 1, child: Container()),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                          flex: 1,
                                          child:
                                              Container(color: Colors.green)),
                                      Expanded(
                                        flex: 16,
                                        child: Row(
                                          children: [
                                            Expanded(
                                                flex: 14, child: Container()),
                                            Expanded(
                                                flex: 5,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    incrementCounter(
                                                        Counters.weight, 1);
                                                  },
                                                  child: Center(
                                                      child: Text('+',
                                                          style:
                                                              kBmiLargeTextStyle)),
                                                )),
                                            Expanded(
                                                flex: 1, child: Container()),
                                            Expanded(
                                                flex: 5,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    incrementCounter(
                                                        Counters.weight, -1);
                                                  },
                                                  child: Center(
                                                      child: Text('-',
                                                          style:
                                                              kBmiLargeTextStyle)),
                                                )),
                                            Expanded(
                                                flex: 14, child: Container()),
                                          ],
                                        ),
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
                              //
                              // age
                              //
                              Expanded(
                                flex: cardWidth,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: kCardBackgroundInactive,
                                    borderRadius:
                                        BorderRadius.circular(cardBorderRadius),
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
                                        child: Center(child: Text(textAge)),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          color: Colors.green,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 16,
                                        child: Row(
                                          children: [
                                            Expanded(
                                                flex: 1, child: Container()),
                                            Expanded(
                                                flex: 16,
                                                child: Center(
                                                  child: Text(age.toString(),
                                                      style:
                                                          kBmiLargeTextStyle),
                                                )),
                                            Expanded(
                                                flex: 1, child: Container()),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                          flex: 1,
                                          child:
                                              Container(color: Colors.green)),
                                      Expanded(
                                        flex: 16,
                                        child: Row(
                                          children: [
                                            Expanded(
                                                flex: 14, child: Container()),
                                            Expanded(
                                                flex: 5,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    incrementCounter(
                                                        Counters.age, 1);
                                                  },
                                                  child: Center(
                                                      child: Text('+',
                                                          style:
                                                              kBmiLargeTextStyle)),
                                                )),
                                            Expanded(
                                                flex: 1, child: Container()),
                                            Expanded(
                                                flex: 5,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    incrementCounter(
                                                        Counters.age, -1);
                                                  },
                                                  child: Center(
                                                      child: Text('-',
                                                          style:
                                                              kBmiLargeTextStyle)),
                                                )),
                                            Expanded(
                                                flex: 14, child: Container()),
                                          ],
                                        ),
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
                        Expanded(
                          flex: bodyOuterPaddingHeight,
                          child: Container(color: colorPadding),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: bodyRowBorder,
                    child: Container(),
                  ),
                ],
              ),
            ),
            //
            //
            Footer(
              footerHeight: footerHeight,
              footerTextSize: footerTextSize,
              footerColor: kCerise,
              footerTextColor: footerTextColor,
              footerFontWeight: footerFontWeight,
              footerText: kBmiCalculateText,
            ),
          ],
        ),
        floatingActionButton: IconTheme(
          child: FloatingActionButton(
            onPressed: doNothing,
            child: Icon(
              Icons.add,
              color: kLightPurple,
            ),
          ),
          data: IconThemeData(color: kPurple),
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
