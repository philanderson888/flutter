class DestiniStory {
  String storyTitle = "";
  String choice1 = "";
  String choice2 = "";
  DestiniStory({
    required storyTitle,
    required choice1,
    required choice2,
  }) {
    storyTitle = storyTitle;
    choice1 = choice1;
    choice2 = choice2;
  }

  getChoice1() {
    return choice1;
  }

  getChoice2() {
    return choice2;
  }
}
