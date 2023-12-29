import 'package:flutter/material.dart';

import 'package:quiz_app/questions_summary/summary_item.dart';

// This class represents a summary of all the questions in a quiz application.
// It is a stateless widget that displays a list of SummaryItem widgets, each representing a single question.
class QuestionsSummary extends StatelessWidget {
  // Constructor for the QuestionsSummary class. It takes one parameter:
  // 'summaryData' for the list of data for each question.
  const QuestionsSummary(this.summaryData, {super.key});

  // The list of data for each question. Each item in the list is a map with the data for a single question.
  final List<Map<String, Object>> summaryData;

  // The build method creates the UI for the widget.
  @override
  Widget build(BuildContext context) {
    // The widget is a scrollable column of SummaryItem widgets.
    // Each SummaryItem is created from the data for a single question.
    return SizedBox(
      height: 450,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return SummaryItem(data);
            },
          ).toList(),
        ),
      ),
    );
  }
}
