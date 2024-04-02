// questions_summary

import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return Column(
      // using summaryData.map allows you to not manually declare each children for column, but rather create them dynamically based on the amount of data contained/passed via summaryData
      children: summaryData.map(
        (data) {
          return Row(
            children: [
              // it is passed as an object, so you take it as an integer increment it, then convert it into a string
              // this is called type casting
              Text(((data["question_index"] as int) + 1).toString()),
              Column(
                children: [
                  Text(data["question"] as String),
                  const SizedBox(height: 7),
                  Text(data["question_answer"] as String),
                  const SizedBox(height: 3),
                  Text(data["user_answer"] as String),
                ],
              )
            ],
          );
        },
      ).toList(), // as the widgets want list type, and .map provides an iterable type, you need to reassign the data type
    );
  }
}
