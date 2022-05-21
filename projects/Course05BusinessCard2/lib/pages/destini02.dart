import 'package:flutter/material.dart';
import 'package:flutter_teaching_app/models/destiniStoryBrain.dart';

class Destini02 extends StatefulWidget {
  const Destini02({Key? key}) : super(key: key);

  @override
  State<Destini02> createState() => _Destini02State();
}

var storyBrain = DestiniStoryBrain();
var story = storyBrain.getStory();

class _Destini02State extends State<Destini02> {
  @override
  Widget build(BuildContext context) {
    print('hello');
    print('${story.storyTitle}');
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
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
                        child: Center(
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
                        child: Center(
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
                        child: Center(
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
