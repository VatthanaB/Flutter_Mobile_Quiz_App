import 'package:flutter/material.dart';

// This class represents a question identifier widget in a quiz application.
// It is a stateless widget that displays the question number and changes color based on whether the answer was correct or not.
class QuestionIdentifier extends StatelessWidget {
  // Constructor for the QuestionIdentifier class. It takes two parameters:
  // 'questionIndex' for the index of the question and 'isCorrectAnswer' to indicate if the answer was correct.
  const QuestionIdentifier({
    super.key,
    required this.questionIndex,
    required this.isCorrectAnswer,
  });

  // The index of the question in the quiz.
  final int questionIndex;

  // A boolean value indicating whether the answer to the question was correct.
  final bool isCorrectAnswer;

  // The build method creates the UI for the widget.
  @override
  Widget build(BuildContext context) {
    // The question number is the index plus one (since indices start at 0).
    final questionNumber = questionIndex + 1;

    // The widget is a padded container with a circular shape and a color that depends on whether the answer was correct.
    // The question number is displayed in the center of the container.
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        width: 35,
        height: 35,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isCorrectAnswer ? Colors.green : Colors.red,
          borderRadius: BorderRadius.circular(35),
        ),
        child: Text(
          questionNumber.toString(),
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
    );
  }
}
