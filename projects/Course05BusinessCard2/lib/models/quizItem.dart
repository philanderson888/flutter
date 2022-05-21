class QuizItem {
  String question = "";
  bool? answer;

  QuizItem({
    this.question = "",
    this.answer = null,
  }) {
    assert(question != "", "question must be present");
    assert(answer != null, "answer must be present");
  }
}
