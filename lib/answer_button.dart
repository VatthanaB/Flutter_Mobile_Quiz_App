import 'package:flutter/material.dart';

// This class represents an answer button in a quiz application.
// It is a stateless widget that displays the answer text and calls a function when tapped.
class AnswerButton extends StatelessWidget {
  // Constructor for the AnswerButton class. It takes two parameters:
  // 'answerText' for the text of the answer and 'onTap' for the function to call when the button is tapped.
  const AnswerButton(
      {super.key, required this.answerText, required this.onTap});

  // The text of the answer.
  final String answerText;

  // The function to call when the button is tapped.
  final void Function() onTap;

  // The build method creates the UI for the widget.
  @override
  Widget build(BuildContext context) {
    // The widget is an elevated button with custom padding, colors, and shape.
    // When the button is tapped, it calls the 'onTap' function.
    return ElevatedButton(
      onPressed: () => onTap(),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        backgroundColor: Color.fromARGB(255, 175, 64, 4),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      child: Text(
        answerText,
        textAlign: TextAlign.center,
      ),
    );
  }
}
