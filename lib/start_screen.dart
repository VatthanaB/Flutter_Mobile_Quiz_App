// Importing necessary packages
import 'package:flutter/material.dart';

// StartScreen is a StatelessWidget, which means it describes part of the user interface which can depend on configuration information in the constructor.
class StartScreen extends StatelessWidget {
  // Constructor takes a function as a parameter. This function will be called when the start quiz button is pressed.
  const StartScreen(this.startQuiz, {super.key});

  // Declaration of the function that will be passed from the parent widget.
  final void Function() startQuiz;

  // The build method returns a widget tree that represents how this widget appears in the user interface.
  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Display an image from assets
          Image.asset(
            'assets/images/copain.png',
            width: 300,
          ),
          // A SizedBox for spacing
          const SizedBox(height: 30),
          // Display a text
          const Text(
            "Let's play some quiz!",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          // Another SizedBox for spacing
          const SizedBox(height: 30),
          // An OutlinedButton that calls the startQuiz function when pressed
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.grey, width: 1),
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.quiz),
            label: const Text('Start Quiz'),
          )
        ],
      ),
    );
  }
}
