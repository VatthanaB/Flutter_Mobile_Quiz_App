// Importing necessary packages
import 'package:flutter/material.dart';
import 'package:quiz_app/quiz.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// The main function is the entry point of the application.
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // runApp is a Flutter function that inflates the given widget and attaches it to the screen.
  // Quiz is the root widget of the application.
  runApp(const Quiz());
}
