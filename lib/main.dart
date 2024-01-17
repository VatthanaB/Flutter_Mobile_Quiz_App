// Importing necessary packages
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/quiz.dart';

// The main function is the entry point of the application.
void main() async {
  // runApp is a Flutter function that inflates the given widget and attaches it to the screen.
  // Quiz is the root widget of the application.
  runApp(DevicePreview(
      builder: (context) => const Quiz(), enabled: !kReleaseMode));
}
