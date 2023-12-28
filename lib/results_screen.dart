// Importing necessary packages
import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary/questions_summary.dart';

// ResultScreen is a StatelessWidget, which means it describes part of the user interface which can depend on configuration information in the constructor.
class ResultScreen extends StatelessWidget {
  // Constructor takes a score as a parameter. This score will be displayed on the screen.
  const ResultScreen(
      {super.key, required this.chosenAnswers, required this.onRestartQuiz});

  final List<String> chosenAnswers;
  final void Function() onRestartQuiz;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          "question": questions[i].text,
          "correct_answer": questions[i].answers[0],
          'user_answer': chosenAnswers[i],
        },
      );
    }

    return summary;
  }

  // The build method returns a widget tree that represents how this widget appears in the user interface.
  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['correct_answer'] == data['user_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "You scored $numCorrectQuestions out of $numTotalQuestions!",
              style: const TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            QuestionsSummary(summaryData),
            const SizedBox(height: 30),
            TextButton(
              onPressed: () {
                onRestartQuiz();
              },
              child: const Text(
                'Restart Quiz!',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
