class QuizItem {
  String question = "";
  bool? answer;

  QuizItem({
    this.question = "",
    this.answer = false,
  }) {
    assert(question != "", "question must be present");
    assert(answer != null, "answer must be present");
  }
}
