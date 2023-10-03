class QuizQuestion {
  const QuizQuestion(this.questionString, this.answersList);

  final String questionString;
  final List<String> answersList;

  List<String> shuffledAnswersList() {
    final list = List.of(answersList);
    list.shuffle();
    return list;
  }
}
