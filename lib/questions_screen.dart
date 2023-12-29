import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

// This class represents the screen where the questions are displayed in a quiz application.
// It is a stateful widget that displays the current question and a list of answer buttons.
class QuestionsScreen extends StatefulWidget {
  // Constructor for the QuestionsScreen class. It takes one parameter:
  // 'onSelectedAnswer' for the function to call when an answer is selected.
  const QuestionsScreen({super.key, required this.onSelectedAnswer});

  // The function to call when an answer is selected.
  final void Function(String answer) onSelectedAnswer;

  // The createState method creates the mutable state for this widget.
  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

// This class represents the mutable state for the QuestionsScreen widget.
class _QuestionsScreenState extends State<QuestionsScreen> {
  // The index of the current question.
  var currentQuestionIndex = 0;

  // This method is called when an answer is selected. It calls the 'onSelectedAnswer' function and advances to the next question.
  answerQuestion(String selectedAnswers) {
    widget.onSelectedAnswer(selectedAnswers);
    setState(() {
      currentQuestionIndex++;
    });
  }

  // The build method creates the UI for the widget.
  @override
  Widget build(context) {
    // Get the current question.
    final currentQuestion = questions[currentQuestionIndex];

    // The widget is a column with the question text and a list of answer buttons.
    // Each button is created from an answer in the current question.
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                textStyle: const TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map((
              answer,
            ) {
              return AnswerButton(
                  answerText: answer,
                  onTap: () {
                    answerQuestion(answer);
                  });
            }),
          ],
        ),
      ),
    );
  }
}
