import 'package:flutter/material.dart';
import '../models/page_item.dart';
import '../main.dart';
import '../apps/xylophone.dart';
import '../apps/quiz01.dart';
import '../apps/quiz02.dart';
import '../apps/destini01.dart';
import '../apps/destini02.dart';
import '../apps/destini03.dart';
import '../apps/bmi_calculator_01.dart';
import '../apps/bmi_calculator_02.dart';
import '../apps/bmi_calculator_03.dart';
import '../apps/bmi_calculator_04.dart';
import '../apps/weather_01.dart';
import '../apps/weather_02.dart';
import '../apps/weather_03.dart';
import '../apps/weather_04.dart';
import '../apps/bitcoin_01.dart';
import '../apps/bitcoin_02.dart';

class Apps extends StatelessWidget {
  const Apps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const gridSize = 56;
    const columnCount = 8;
    const initialListLength = 0;
    const textScaleFactor = 1.4;

    goToAskAnyQuestion() {
      print('going to "ask any question"');
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const AskAnyQuestion()));
    }

    goToBitCoin01() {
      print('going to bitcoin 01');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Bitcoin01()));
    }

    goToBitCoin02() {
      print('going to bitcoin 02');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Bitcoin02()));
    }

    goToBmi01() {
      print('going to BMI Calculator 01');
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const BmiCalculator01()));
    }

    goToBmi02() {
      print('going to BMI Calculator 02');
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const BmiCalculator02()));
    }

    goToBmi03() {
      print('going to BMI Calculator 03');
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const BmiCalculator03()));
    }

    goToBmi04() {
      print('going to BMI Calculator 04');
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const BmiCalculator04()));
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

    goToWeather01() {
      print('going to weather_01 app');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Weather01()));
    }

    goToWeather02() {
      print('going to weather_02 app');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Weather02()));
    }

    goToWeather03() {
      print('going to weather_03 app');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Weather03()));
    }

    goToWeather04() {
      print('going to weather_04 app');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Weather04()));
    }

    goToXylophone() {
      print('going to app xylophone');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Xylophone()));
    }

    List<PageItem> pageItems = [
      PageItem(
        functionName: goToAskAnyQuestion,
        buttonText: "Ask Any Question",
      ),
      PageItem(
        functionName: goToBitCoin01,
        buttonText: "Bitcoin 01",
      ),
      PageItem(
        functionName: goToBitCoin02,
        buttonText: "Bitcoin 02",
      ),
      PageItem(
        functionName: goToBmi01,
        buttonText: "BMI 01",
      ),
      PageItem(
        functionName: goToBmi02,
        buttonText: "BMI 02",
      ),
      PageItem(
        functionName: goToBmi03,
        buttonText: "BMI 03",
      ),
      PageItem(
        functionName: goToBmi04,
        buttonText: "BMI 04",
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
        buttonText: "Quiz 01",
      ),
      PageItem(
        functionName: goToQuiz02,
        buttonText: "Quiz 02",
      ),
      PageItem(
        functionName: goToWeather01,
        buttonText: "Weather 01",
      ),
      PageItem(
        functionName: goToWeather02,
        buttonText: "Weather 02",
      ),
      PageItem(
        functionName: goToWeather03,
        buttonText: "Weather 03",
      ),
      PageItem(
        functionName: goToWeather04,
        buttonText: "Weather 04",
      ),
      PageItem(
        functionName: goToXylophone,
        buttonText: "Xylophone",
      ),
    ];

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: textScaleFactor),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Apps'),
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
