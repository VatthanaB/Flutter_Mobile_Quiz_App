import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String answerText;
  final void Function() onTap;

  const AnswerButton(
      {super.key, required this.answerText, required this.onTap});

  @override
  Widget build(BuildContext context) {
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
