import 'destini_story.dart';

class DestiniStoryBrain {
  int storyNumber = 0;
  final List<DestiniStory> _destiniStoryData = [
    DestiniStory(
        storyTitle: "a title 0", choice1: "a choice 1", choice2: "a choice 2"),
    DestiniStory(
        storyTitle: "a title 1", choice1: "a choice 3", choice2: "a choice 4"),
    DestiniStory(
        storyTitle: "a title 2", choice1: "a choice 5", choice2: "a choice 6"),
    DestiniStory(
        storyTitle: "a title 3", choice1: "restart", choice2: "hide this"),
    DestiniStory(
        storyTitle: "a title 4", choice1: "restart", choice2: "hide this"),
    DestiniStory(
        storyTitle: "a title 5", choice1: "restart", choice2: "hide this")
  ];

  getStory(int storyNumber) {
    print('.. getStory for story number $storyNumber');
    print('.. title ${_destiniStoryData[storyNumber].storyTitle}');
    print('.. title 0 ${_destiniStoryData[0].storyTitle}');
    return _destiniStoryData[storyNumber];
  }

  int nextChoice = 0;

  int nextStory(int choiceNumber) {
    switch (storyNumber) {
      case 0:
        if (choiceNumber == 1) {
          nextChoice = 2;
        } else {
          nextChoice = 1;
        }
        break;
      case 1:
        if (choiceNumber == 1) {
          nextChoice = 2;
        } else {
          nextChoice = 3;
        }
        break;
      case 2:
        if (choiceNumber == 1) {
          nextChoice = 5;
        } else {
          nextChoice = 4;
        }
        break;
      case 3:
        nextChoice = 0;
        break;
      case 4:
        nextChoice = 0;
        break;
      case 5:
        nextChoice = 0;
        break;
    }

    if (nextChoice > 0) {
      print(
          'at point $storyNumber the user chose choice $choiceNumber and so advancing to screen $nextChoice');
    } else {
      print('from point $storyNumber the app exits and restarts');
    }

    storyNumber = nextChoice;
    return storyNumber;
  }
}
