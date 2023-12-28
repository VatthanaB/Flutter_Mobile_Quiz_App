// Importing necessary packages
import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start_screen.dart';

// Quiz is a StatefulWidget, which means it can maintain state over time.
class Quiz extends StatefulWidget {
  const Quiz({super.key});

  // Creates the mutable state for this widget at a given location in the tree.
  @override
  State<Quiz> createState() => _QuizState();
}

// _QuizState is the state for the Quiz StatefulWidget.
class _QuizState extends State<Quiz> {
  final List<String> selectedAnswers = [];
  // activeScreen is a Widget that can either be StartScreen or QuestionsScreen.
  var activeScreen = 'start-screen';

  // switchScreen is a method that changes activeScreen to QuestionsScreen.
  void switchScreen() {
    setState(() {
      // setState notifies the framework that the internal state of this object has changed.
      activeScreen = 'questions-screen';
    });
  }

  void resetQuiz() {
    setState(() {
      activeScreen = 'start-screen';
      selectedAnswers.clear();
    });
  }

  // chooseAnswer is a method that adds the selected answer to the selectedAnswers list.
  void chooseAnswer(String answer) {
    setState(() {
      selectedAnswers.add(answer);
      if (selectedAnswers.length == questions.length) {
        setState(() {
          activeScreen = 'results-screen';
        });
      }
    });
  }

  // build returns a MaterialApp widget that is rendered onto the screen.
  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(onSelectedAnswer: chooseAnswer);
    }
    if (activeScreen == 'results-screen') {
      screenWidget = ResultScreen(
        chosenAnswers: selectedAnswers,
        onRestartQuiz: resetQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          // The Container has a gradient background.
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 2, 10, 81),
                Color.fromARGB(255, 1, 13, 114)
              ],
            ),
          ),
          // The child of the Container is the activeScreen, which can be either StartScreen or QuestionsScreen.
          child: screenWidget,
        ),
      ),
    );
  }
}
