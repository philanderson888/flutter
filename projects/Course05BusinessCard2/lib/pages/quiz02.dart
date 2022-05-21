import 'package:flutter/material.dart';
import '../models/quizItem.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Quiz02 extends StatefulWidget {
  const Quiz02({Key? key}) : super(key: key);

  @override
  State<Quiz02> createState() => _Quiz02State();
}

class _Quiz02State extends State<Quiz02> {
  int scoreCorrect = 0;
  int scoreIncorrect = 0;
  int scoreTotal = 0;
  double quizPadding = 8.0;
  int questionNumber = 0;

  static List<QuizItem> quizItems = [
    QuizItem(question: "Everest is the highest mountain", answer: true),
    QuizItem(question: "Dogs are reptiles", answer: false),
    QuizItem(question: "Cats are carnivores", answer: true),
    QuizItem(question: "Everest is the highest mountain", answer: true),
    QuizItem(question: "Dogs are reptiles", answer: false),
    QuizItem(question: "Cats are carnivores", answer: true),
    QuizItem(question: "Everest is the highest mountain", answer: true),
    QuizItem(question: "Dogs are reptiles", answer: false),
    QuizItem(question: "Cats are carnivores", answer: true),
    QuizItem(question: "Everest is the highest mountain", answer: true),
    QuizItem(question: "Dogs are reptiles", answer: false),
    QuizItem(question: "Cats are carnivores", answer: true),
    QuizItem(question: "Everest is the highest mountain", answer: true),
    QuizItem(question: "Dogs are reptiles", answer: false),
    QuizItem(question: "Cats are carnivores", answer: true),
  ];

  var quizItem = quizItems[0];

  List<Expanded> scoreKeeper = [
    Expanded(
      flex: 1,
      child: Container(),
    ),
    Expanded(
      flex: 1,
      child: Icon(
        Icons.close,
        color: Colors.white,
        size: 50,
      ),
    ),
    Expanded(
      flex: 1,
      child: Icon(
        Icons.close,
        color: Colors.white,
        size: 50,
      ),
    ),
    Expanded(
      flex: 1,
      child: Icon(
        Icons.close,
        color: Colors.white,
        size: 50,
      ),
    ),
    Expanded(
      flex: 1,
      child: Container(),
    ),
  ];

  doNothing() {
    print('doing nothing');
  }

  var expandedCorrect = Expanded(
    flex: 1,
    child: Icon(
      Icons.check,
      color: Colors.white,
      size: 50,
    ),
  );

  var expandedIncorrect = Expanded(
    flex: 1,
    child: Icon(
      Icons.close,
      color: Colors.white,
      size: 50,
    ),
  );

  askQuestion() {
    print('asking a question');
    setState(() {
      questionNumber++;
      quizItem = quizItems[questionNumber];
    });
  }

  chooseAnswer(bool answer) {
    bool userHasChosenCorrectAnswer = (answer == quizItem.answer);
    print(
        'choosing answer $answer - is this correct? $userHasChosenCorrectAnswer');
    setState(
      () {
        if (questionNumber < quizItems.length) {
          if (userHasChosenCorrectAnswer) {
            scoreKeeper.insert(scoreKeeper.length - 1, expandedCorrect);
            scoreCorrect++;
          } else {
            scoreKeeper.insert(scoreKeeper.length - 1, expandedIncorrect);
            scoreIncorrect++;
          }
          scoreTotal++;
          String correctOrIncorrectString = "";
          if (userHasChosenCorrectAnswer) {
            correctOrIncorrectString = 'correct';
          } else {
            correctOrIncorrectString = 'incorrect';
          }
          questionNumber++;
          print(
              'question ${questionNumber} of ${quizItems.length} was $correctOrIncorrectString - score is $scoreCorrect out of $scoreTotal');
          if (questionNumber == quizItems.length) {
            print('quiz has finished');
            Alert(
                    context: context,
                    title: "Quiz Over",
                    desc: "Well done - you scored $scoreCorrect / $scoreTotal")
                .show();
          } else
            quizItem = quizItems[questionNumber];
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF46016E),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(),
              ),
              Expanded(
                flex: 10,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(),
                    ),
                    Expanded(
                      flex: 10,
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Center(
                          child: Text(
                            quizItem.question,
                            style: TextStyle(
                              fontSize: 50,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 10,
                      child: Padding(
                        padding: EdgeInsets.all(quizPadding),
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xFF10FA91),
                            ),
                          ),
                          onPressed: () {
                            chooseAnswer(true);
                          },
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(),
                              ),
                              const Expanded(
                                flex: 1,
                                child: Center(
                                  child: Text(
                                    'True',
                                    style: TextStyle(
                                      fontSize: 50,
                                      color: Colors.white,
                                    ),
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
                    ),
                    Expanded(
                      flex: 10,
                      child: Padding(
                        padding: EdgeInsets.all(quizPadding),
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xFFC7024F),
                            ),
                          ),
                          onPressed: () {
                            chooseAnswer(false);
                          },
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(),
                              ),
                              const Expanded(
                                flex: 1,
                                child: Center(
                                  child: Text(
                                    'False',
                                    style: TextStyle(
                                      fontSize: 50,
                                      color: Colors.white,
                                    ),
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
                    ),
                    Expanded(
                      flex: 10,
                      child: Padding(
                        padding: EdgeInsets.all(quizPadding),
                        child: Container(
                          color: Color(0xFF637DE6),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Container(),
                              ),
                              Expanded(
                                flex: 1,
                                child: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 50,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  'correct',
                                  style: TextStyle(
                                    fontSize: 50,
                                    color: Colors.white,
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
                    ),
                    Expanded(
                      flex: 10,
                      child: Padding(
                        padding: EdgeInsets.all(quizPadding),
                        child: Container(
                          color: Color(0xFF637DE6),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Container(),
                              ),
                              Expanded(
                                flex: 1,
                                child: Icon(
                                  Icons.close,
                                  color: Colors.white,
                                  size: 50,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  'incorrect',
                                  style: TextStyle(
                                    fontSize: 50,
                                    color: Colors.white,
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
                    ),
                    Expanded(
                      flex: 10,
                      child: Padding(
                        padding: EdgeInsets.all(quizPadding),
                        child: Container(
                          color: Color(0xFF10FA91),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Container(),
                              ),
                              Expanded(
                                flex: 1,
                                child: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 50,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  'correct',
                                  style: TextStyle(
                                    fontSize: 50,
                                    color: Colors.white,
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
                    ),
                    Expanded(
                      flex: 10,
                      child: Padding(
                        padding: EdgeInsets.all(quizPadding),
                        child: Container(
                          color: Color(0xFFC7024F),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Container(),
                              ),
                              Expanded(
                                flex: 1,
                                child: Icon(
                                  Icons.close,
                                  color: Colors.white,
                                  size: 50,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  'incorrect',
                                  style: TextStyle(
                                    fontSize: 50,
                                    color: Colors.white,
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
                    ),
                    Expanded(
                      flex: 10,
                      child: Padding(
                        padding: EdgeInsets.all(quizPadding),
                        child: Container(
                          color: Color(0xFF637DE6),
                          child: Row(
                            children: scoreKeeper,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 10,
                      child: Padding(
                        padding: EdgeInsets.all(quizPadding),
                        child: Container(
                          color: Color(0xFF637DE6),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                flex: 4,
                                child: Container(),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  scoreCorrect.toString(),
                                  style: TextStyle(
                                    fontSize: 50,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  '/',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 50,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  scoreTotal.toString(),
                                  style: TextStyle(
                                    fontSize: 50,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: Container(),
                              ),
                            ],
                          ),
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
            ],
          ),
        ),
      ),
    );
  }
}
