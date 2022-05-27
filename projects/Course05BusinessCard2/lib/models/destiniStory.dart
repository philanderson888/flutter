class DestiniStory {
  String storyTitle = "";
  String choice1 = "";
  String choice2 = "";
  DestiniStory({
    required storyTitle,
    required choice1,
    required choice2,
  }) {
    this.storyTitle = storyTitle;
    this.choice1 = choice1;
    this.choice2 = choice2;
  }

  getChoice1() {
    return this.choice1;
  }

  getChoice2() {
    return this.choice2;
  }
}
