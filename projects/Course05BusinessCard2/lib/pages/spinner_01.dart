import 'package:flutter/material.dart';
import 'package:flutter_teaching_app/models/page_item.dart';
import '../constants.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const spinKitRotatingCircle = SpinKitRotatingCircle(
  color: Colors.white,
  size: 50.0,
);

final spinKitFadingCircle = SpinKitFadingCircle(
  itemBuilder: (BuildContext context, int index) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: index.isEven ? kColorDarkGrey01 : kColorLightGrey02,
      ),
    );
  },
);

class Spinner01 extends StatefulWidget {
  const Spinner01({Key? key}) : super(key: key);

  @override
  State<Spinner01> createState() => _Spinner01();
}

class _Spinner01 extends State<Spinner01> {
  doNothing() {
    print('doing nothing');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: SafeArea(
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(color: kColorLightPink01),
            ),
            Expanded(
              flex: 20,
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(color: kColorLightPink01),
                  ),
                  Expanded(
                    flex: 20,
                    child: SpinnerScreen01(),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(color: kColorLightPink01),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(color: kColorLightPink01),
            ),
          ],
        ),
      ),
    );
  }
}

class SpinnerScreen01 extends StatefulWidget {
  @override
  _SpinnerScreen01State createState() => _SpinnerScreen01State();
}

class _SpinnerScreen01State extends State<SpinnerScreen01>
    with SingleTickerProviderStateMixin {
  var positionAsString = '... ';
  late AnimationController _controller;
  late SpinKitSquareCircle spinKitSquareCircle;

  @override
  initState() {
    print('Spinner initState()');
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    spinKitSquareCircle = SpinKitSquareCircle(
      color: Colors.white,
      size: 50.0,
      controller: _controller,
    );

    int loadingTime = 5;
    for (int i = 0; i <= loadingTime; i++) {
      int counter = i + 1;
      Future.delayed(Duration(seconds: counter), () {
        setState(() {
          positionAsString += ' ...';
        });
      });
    }

    Future.delayed(Duration(seconds: loadingTime), () {
      doNothing();
    });

    super.initState();
    print('Spinner initState()');
  }

  @override
  deactivate() {
    super.deactivate();
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          doNothing();
        },
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Expanded(flex: 1, child: Container()),
                  Expanded(
                    flex: 2,
                    child: Center(child: Text(positionAsString)),
                  ),
                  Expanded(flex: 1, child: Container()),
                  Expanded(
                    flex: 2,
                    child: Center(child: spinKitRotatingCircle),
                  ),
                  Expanded(flex: 1, child: Container()),
                  Expanded(
                    flex: 2,
                    child: Center(child: spinKitSquareCircle),
                  ),
                  Expanded(flex: 1, child: Container()),
                  Expanded(
                    flex: 2,
                    child: Center(child: spinKitFadingCircle),
                  ),
                  Expanded(flex: 1, child: Container()),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: SpinKitRotatingCircle(color: Colors.white),
                    ),
                  ),
                  Expanded(flex: 1, child: Container()),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: SpinKitRotatingPlain(color: Colors.white),
                    ),
                  ),
                  Expanded(flex: 1, child: Container()),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: SpinKitChasingDots(color: Colors.white),
                    ),
                  ),
                  Expanded(flex: 1, child: Container()),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: SpinKitPumpingHeart(color: Colors.white),
                    ),
                  ),
                  Expanded(flex: 1, child: Container()),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: SpinKitPulse(color: Colors.white),
                    ),
                  ),
                  Expanded(flex: 1, child: Container()),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(flex: 1, child: Container()),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: SpinKitDoubleBounce(color: Colors.white),
                    ),
                  ),
                  Expanded(flex: 1, child: Container()),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: SpinKitWave(
                          color: Colors.white, type: SpinKitWaveType.start),
                    ),
                  ),
                  Expanded(flex: 1, child: Container()),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: SpinKitWave(
                          color: Colors.white, type: SpinKitWaveType.center),
                    ),
                  ),
                  Expanded(flex: 1, child: Container()),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: SpinKitWave(
                          color: Colors.white, type: SpinKitWaveType.end),
                    ),
                  ),
                  Expanded(flex: 1, child: Container()),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: SpinKitPianoWave(
                          color: Colors.white,
                          type: SpinKitPianoWaveType.start),
                    ),
                  ),
                  Expanded(flex: 1, child: Container()),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: SpinKitPianoWave(
                          color: Colors.white,
                          type: SpinKitPianoWaveType.center),
                    ),
                  ),
                  Expanded(flex: 1, child: Container()),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: SpinKitPianoWave(
                          color: Colors.white, type: SpinKitPianoWaveType.end),
                    ),
                  ),
                  Expanded(flex: 1, child: Container()),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: SpinKitThreeBounce(color: Colors.white),
                    ),
                  ),
                  Expanded(flex: 1, child: Container()),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: SpinKitThreeInOut(color: Colors.white),
                    ),
                  ),
                  Expanded(flex: 1, child: Container()),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(flex: 1, child: Container()),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: SpinKitWanderingCubes(color: Colors.white),
                    ),
                  ),
                  Expanded(flex: 1, child: Container()),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: SpinKitWanderingCubes(
                          color: Colors.white, shape: BoxShape.circle),
                    ),
                  ),
                  Expanded(flex: 1, child: Container()),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: SpinKitCircle(color: Colors.white),
                    ),
                  ),
                  Expanded(flex: 1, child: Container()),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: SpinKitFadingFour(color: Colors.white),
                    ),
                  ),
                  Expanded(flex: 1, child: Container()),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: SpinKitFadingFour(
                          color: Colors.white, shape: BoxShape.rectangle),
                    ),
                  ),
                  Expanded(flex: 1, child: Container()),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: SpinKitFadingCube(color: Colors.white),
                    ),
                  ),
                  Expanded(flex: 1, child: Container()),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: SpinKitCubeGrid(size: 51.0, color: Colors.white),
                    ),
                  ),
                  Expanded(flex: 1, child: Container()),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: SpinKitFoldingCube(color: Colors.white),
                    ),
                  ),
                  Expanded(flex: 1, child: Container()),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: SpinKitRing(color: Colors.white),
                    ),
                  ),
                  Expanded(flex: 1, child: Container()),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(flex: 1, child: Container()),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: SpinKitDualRing(color: Colors.white),
                    ),
                  ),
                  Expanded(flex: 1, child: Container()),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: SpinKitSpinningLines(color: Colors.white),
                    ),
                  ),
                  Expanded(flex: 1, child: Container()),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: SpinKitFadingGrid(color: Colors.white),
                    ),
                  ),
                  Expanded(flex: 1, child: Container()),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: SpinKitFadingGrid(
                          color: Colors.white, shape: BoxShape.rectangle),
                    ),
                  ),
                  Expanded(flex: 1, child: Container()),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: SpinKitSquareCircle(color: Colors.white),
                    ),
                  ),
                  Expanded(flex: 1, child: Container()),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: SpinKitSpinningCircle(color: Colors.white),
                    ),
                  ),
                  Expanded(flex: 1, child: Container()),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: SpinKitSpinningCircle(
                          color: Colors.white, shape: BoxShape.rectangle),
                    ),
                  ),
                  Expanded(flex: 1, child: Container()),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: SpinKitFadingCircle(color: Colors.white),
                    ),
                  ),
                  Expanded(flex: 1, child: Container()),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: SpinKitHourGlass(color: Colors.white),
                    ),
                  ),
                  Expanded(flex: 1, child: Container()),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(flex: 1, child: Container()),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: SpinKitPouringHourGlass(color: Colors.white),
                    ),
                  ),
                  Expanded(flex: 1, child: Container()),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child:
                          SpinKitPouringHourGlassRefined(color: Colors.white),
                    ),
                  ),
                  Expanded(flex: 1, child: Container()),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: SpinKitRipple(color: Colors.white),
                    ),
                  ),
                  Expanded(flex: 1, child: Container()),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: SpinKitDancingSquare(color: Colors.white),
                    ),
                  ),
                  Expanded(flex: 1, child: Container()),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: Container(),
                    ),
                  ),
                  Expanded(flex: 1, child: Container()),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: Container(),
                    ),
                  ),
                  Expanded(flex: 1, child: Container()),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: Container(),
                    ),
                  ),
                  Expanded(flex: 1, child: Container()),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: Container(),
                    ),
                  ),
                  Expanded(flex: 1, child: Container()),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: Container(),
                    ),
                  ),
                  Expanded(flex: 1, child: Container()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
