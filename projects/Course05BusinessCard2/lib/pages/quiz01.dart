import 'package:flutter/material.dart';

class Quiz01 extends StatelessWidget {
  const Quiz01({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Quiz01Page(),
        ),
      ),
    );
  }
}

class Quiz01Page extends StatefulWidget {
  const Quiz01Page({Key? key}) : super(key: key);

  @override
  State<Quiz01Page> createState() => _Quiz01PageState();
}

class _Quiz01PageState extends State<Quiz01Page> {
  doNothing() {
    print('doing nothing');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Text(
                'This is a question - true or false?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              ),
              onPressed: () {
                print('you chose true');
              },
              child: const Text(
                'True',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              onPressed: () {
                print('you chose false');
              },
              child: const Text(
                'False',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
