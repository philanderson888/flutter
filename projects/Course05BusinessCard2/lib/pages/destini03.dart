import 'package:flutter/material.dart';
import 'package:flutter_teaching_app/models/destiniStoryBrain.dart';

class Destini03 extends StatefulWidget {
  const Destini03({Key? key}) : super(key: key);

  @override
  State<Destini03> createState() => _Destini03State();
}

class _Destini03State extends State<Destini03> {
  static var storyBrain = DestiniStoryBrain();
  static var story = storyBrain.getStory(0);
  bool button2Visible = true;
  @override
  Widget build(BuildContext context) {
    setNextStory(int choice) {
      var storyNumber = storyBrain.nextStory(choice);
      setState(() {
        story = storyBrain.getStory(storyNumber);
        if (storyNumber == 0) {
          button2Visible = true;
        }
        if (storyNumber >= 3) {
          button2Visible = false;
        }
        print(
            'new story holds data ${story.storyTitle} ${story.choice1} ${story.choice2}');
      });
    }

    print('${story.storyTitle}');
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
                    //color: Colors.yellow,
                    ),
              ),
              Expanded(
                flex: 12,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                          //color: Colors.grey,
                          ),
                    ),
                    Expanded(
                      flex: 7,
                      child: Center(
                        child: Text(
                          story.storyTitle,
                          style: const TextStyle(
                              fontSize: 50, color: Colors.white),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 7,
                      child: Container(
                        color: Colors.blue,
                        child: TextButton(
                          onPressed: () {
                            setNextStory(1);
                          },
                          child: Center(
                            child: Text(
                              story.getChoice1(),
                              style: const TextStyle(
                                  fontSize: 50, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 7,
                      child: Visibility(
                        visible: button2Visible,
                        child: Container(
                          color: Colors.red,
                          child: TextButton(
                            onPressed: () {
                              setNextStory(2);
                            },
                            child: Center(
                              child: Text(
                                story.getChoice2(),
                                style: const TextStyle(
                                    fontSize: 50, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                          //color: Colors.grey,
                          ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                    //color: Colors.yellow,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
