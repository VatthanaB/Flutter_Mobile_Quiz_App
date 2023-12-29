class QuizQuestion {
  // Constructor for the QuizQuestion class. It takes two parameters:
  // 'text' for the question text and 'answers' for the list of possible answers.
  const QuizQuestion(this.text, this.answers);

  // The text of the quiz question.
  final String text;

  // The list of possible answers for the quiz question.
  final List<String> answers;

  // Method to get a shuffled list of the possible answers.
  // It creates a copy of the original list and shuffles it.
  List<String> getShuffledAnswers() {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
