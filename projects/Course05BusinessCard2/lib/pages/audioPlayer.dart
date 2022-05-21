import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioPlayerWidget extends StatefulWidget {
  const AudioPlayerWidget({Key? key}) : super(key: key);

  @override
  State<AudioPlayerWidget> createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  final player = AudioCache();
  @override
  Widget build(BuildContext context) {
    var audioPlayer = AudioPlayer(
      mode: PlayerMode.LOW_LATENCY,
    );

    var audioFileUrl =
        'https://file-examples.com/storage/fe66818077626db7798c5e8/2017/11/file_example_MP3_700KB.mp3';
    var localFileUrl = 'note2.wav';

    playAudio() async {
      audioPlayer = await player.play(
        localFileUrl,
      );
    }

    playRemoteAudio() async {
      audioPlayer = await player.play(audioFileUrl);
    }

    loopAudio() async {
      audioPlayer = await player.loop(localFileUrl);
    }

    pauseAudio() {
      print(audioPlayer.state);
      if (audioPlayer.state == PlayerState.PLAYING) {
        audioPlayer.pause();
      } else if (audioPlayer.state == PlayerState.PAUSED) {
        audioPlayer.resume();
      }
    }

    fastForwardAudio() {
      if ((audioPlayer.state == PlayerState.PLAYING) |
          (audioPlayer.state == PlayerState.PAUSED)) {
        audioPlayer.seek(const Duration(milliseconds: 1200));
      }
    }

    rewindAudio() {
      if ((audioPlayer.state == PlayerState.PLAYING) |
          (audioPlayer.state == PlayerState.PAUSED)) {
        audioPlayer.seek(const Duration(milliseconds: -1200));
      }
    }

    stopLoopAudio() {
      audioPlayer.stop();
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Audio Player')),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(),
            ),
            const Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  "Audio Player",
                  style: TextStyle(
                    fontSize: 55,
                    fontFamily: "SourceSansPro",
                    color: Color(0xFF5395d4),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(),
            ),
            Expanded(
              flex: 2,
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(),
                  ),
                  Expanded(
                    flex: 8,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFF85cfe6),
                        borderRadius: BorderRadius.all(
                          Radius.circular(40),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Container(),
                          ),
                          Expanded(
                            flex: 1,
                            child: TextButton(
                              onPressed: playAudio,
                              child: const Image(
                                image: NetworkImage(
                                    'https://cdn.pixabay.com/photo/2013/07/13/11/42/audio-158489_1280.png'),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(),
                          ),
                          Expanded(
                            flex: 1,
                            child: TextButton(
                              onPressed: loopAudio,
                              child: const Image(
                                image: NetworkImage(
                                    'https://c8.alamy.com/comp/K95095/flat-loop-icon-repeat-sign-reload-interface-button-multimedia-audio-K95095.jpg'),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(),
                          ),
                          Expanded(
                            flex: 1,
                            child: TextButton(
                              onPressed: pauseAudio,
                              child: const Image(
                                image: NetworkImage(
                                    'https://cdn-icons-png.flaticon.com/512/189/189639.png'),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(),
                          ),
                          Expanded(
                            flex: 1,
                            child: TextButton(
                              onPressed: rewindAudio,
                              child: const Image(
                                image: NetworkImage(
                                    'https://icons.iconarchive.com/icons/hopstarter/button/256/Button-Rewind-icon.png'),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(),
                          ),
                          Expanded(
                            flex: 1,
                            child: TextButton(
                              onPressed: fastForwardAudio,
                              child: const Image(
                                image: NetworkImage(
                                    'https://icons.iconarchive.com/icons/custom-icon-design/pretty-office-8/256/Fast-forward-icon.png'),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(),
                          ),
                          Expanded(
                            flex: 1,
                            child: TextButton(
                              onPressed: stopLoopAudio,
                              child: const Image(
                                image: NetworkImage(
                                    'https://cdn.pixabay.com/photo/2013/07/12/12/22/stop-145678_960_720.png'),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(),
            ),
            const Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  "Remote Audio",
                  style: TextStyle(
                    fontSize: 55,
                    fontFamily: "SourceSansPro",
                    color: Color(0xFF5395d4),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(),
            ),
            Expanded(
              flex: 2,
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(),
                  ),
                  Expanded(
                    flex: 8,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFF85cfe6),
                        borderRadius: BorderRadius.all(
                          Radius.circular(40),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            flex: 10,
                            child: Container(),
                          ),
                          Expanded(
                            flex: 3,
                            child: TextButton(
                              onPressed: playRemoteAudio,
                              child: const Image(
                                image: NetworkImage(
                                    'https://cdn.pixabay.com/photo/2013/07/13/11/42/audio-158489_1280.png'),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 10,
                            child: Container(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
