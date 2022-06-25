import 'package:flutter/material.dart';
import '../models/destini_story_brain.dart';
import '../models/destini_story.dart';

class Destini01 extends StatefulWidget {
  const Destini01({Key? key}) : super(key: key);

  @override
  State<Destini01> createState() => _Destini01State();
}

class _Destini01State extends State<Destini01> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  'https://seekingtruth.co.uk/wp-content/uploads/2021/07/banner-galaxy.jpg'),
              fit: BoxFit.cover),
        ),
        child: SafeArea(
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.yellow,
                ),
              ),
              Expanded(
                flex: 12,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.grey,
                      ),
                    ),
                    Expanded(
                      flex: 7,
                      child: Container(
                        color: Colors.green,
                        child: const Center(
                          child: Text(
                            'a container',
                            style: TextStyle(fontSize: 50, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 7,
                      child: Container(
                        color: Colors.blue,
                        child: const Center(
                          child: Text(
                            'a container',
                            style: TextStyle(fontSize: 50, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 7,
                      child: Container(
                        color: Colors.red,
                        child: const Center(
                          child: Text(
                            'a container',
                            style: TextStyle(fontSize: 50, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.yellow,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
