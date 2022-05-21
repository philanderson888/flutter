import 'destiniStory.dart';

class DestiniStoryBrain {
  List<DestiniStory> _destiniStoryData = [
    DestiniStory(
        storyTitle: "a title", choice1: "a choice 1", choice2: "a choice 2"),
    DestiniStory(
        storyTitle: "a title", choice1: "a choice 3", choice2: "a choice 4"),
    DestiniStory(
        storyTitle: "a title", choice1: "a choice 5", choice2: "a choice 6"),
    DestiniStory(
        storyTitle: "a title", choice1: "a choice 7", choice2: "a choice 8"),
    DestiniStory(
        storyTitle: "a title", choice1: "a choice 9", choice2: "a choice 10")
  ];
  getStory() {
    return _destiniStoryData[0];
  }
}
