import 'package:flutter/material.dart';

class Xylophone extends StatefulWidget {
  const Xylophone({Key? key}) : super(key: key);

  @override
  State<Xylophone> createState() => _XylophoneState();
}

class _XylophoneState extends State<Xylophone> {
  final player = AudioCache();

  var audioPlayer = AudioPlayer(
    mode: PlayerMode.LOW_LATENCY,
  );

  @override
  Widget build(BuildContext context) {
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
                      color: const Color(0xFFCA1E51),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(),
                ),
                buildXylophoneNote(
                  note: 2,
                  color: const Color(0xFFd62b20),
                ),
                Expanded(
                  flex: 1,
                  child: Container(),
                ),
                buildXylophoneNote(
                  note: 3,
                  color: const Color(0xFFda791f),
                ),
                Expanded(
                  flex: 1,
                  child: Container(),
                ),
                buildXylophoneNote(
                  note: 4,
                  color: const Color(0xFFc29020),
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
                      color: const Color(0xFF6b974f),
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
                      color: const Color(0xFF83c196),
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
                      color: const Color(0xFF77b7bb),
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
                      color: const Color(0xFFa99aab),
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
