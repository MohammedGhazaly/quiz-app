class QuestionsModel {
  final String questionTitle;
  final List<String> possibleAnswers;

  // QuestionsModel({required this.questionTitle, required this.possibleAnswers});
  const QuestionsModel(this.questionTitle, this.possibleAnswers);

  List<String> getShuffledList() {
    final shuffledList = List.of(possibleAnswers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
