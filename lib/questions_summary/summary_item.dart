import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/questions_summary/question_identifier.dart';

// This class represents a summary item in a quiz application.
// It is a stateless widget that displays the question, the user's answer, and the correct answer.
class SummaryItem extends StatelessWidget {
  // Constructor for the SummaryItem class. It takes one parameter:
  // 'itemData' for the data of the question.
  const SummaryItem(this.itemData, {super.key});

  // The data for the question. It is a map with keys for the question, the user's answer, and the correct answer.
  final Map<String, Object> itemData;

  // The build method creates the UI for the widget.
  @override
  Widget build(BuildContext context) {
    // Determine if the user's answer is correct.
    final isCorrectAnswer =
        itemData['correct_answer'] == itemData['user_answer'];

    // The widget is a row with a QuestionIdentifier and a column with the question, the user's answer, and the correct answer.
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionIdentifier(
          questionIndex: itemData['question_index'] as int,
          isCorrectAnswer: isCorrectAnswer,
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(itemData['question'] as String,
                style: GoogleFonts.lato(
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                    color: Colors.white)),
            const SizedBox(height: 5),
            Text(
              itemData['user_answer'] as String,
              style: const TextStyle(
                  color: Colors.pink,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              itemData['correct_answer'] as String,
              style: const TextStyle(
                  color: Colors.green,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20)
          ],
        ))
      ],
    );
  }
}
