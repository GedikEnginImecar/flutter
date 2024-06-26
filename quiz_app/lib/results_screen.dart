// results_screen.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import "package:quiz_app/data/questions.dart";
import 'package:quiz_app/questions_summary/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestart,
  });

  final void Function() onRestart;
  final List<String> chosenAnswers;

// List<Map> means that getSummaryData returns a list of Map data composed of strings and objects (objects are flexible data types)
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    // creating a final variable of type List<Map<String, Object>>

    // for (range/config goes in here(start variable/range ; comparison condition ; how range should be manipulated )){the code to execute while running}
    for (var i = 0; i < chosenAnswers.length; i++) {
      // creating a dictionary/value key pairs
      summary.add(
        {
          "question_index": i,
          // i will reflect the index/number of the question

          "question": questions[i].text,
          // the i numbered question test (actual question)

          "question_answer": questions[i].answers[0],
          // the i numbered questions, answer lists 0 index (in the questions.dart it is designed such that questions.answer[0] is always the correct one)

          "user_answer": chosenAnswers[i],
          // the user answer to the question numbered i
        },
      );
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    // to dynamically get the amount of total questions and correct questions
    final summaryData = getSummaryData();

    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data["user_answer"] == data["question_answer"];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You answered $numCorrectQuestions out of $numTotalQuestions correctly!",
              style: GoogleFonts.architectsDaughter(
                color: const Color.fromARGB(255, 238, 197, 255),
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            //
            QuestionsSummary(summaryData),
            //
            const SizedBox(
              height: 30,
            ),
            OutlinedButton.icon(
              // onPressed: startQuiz, // pointer method
              onPressed: onRestart, // pointer method
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.all(15),
                foregroundColor: Colors.white,
                backgroundColor: const Color.fromARGB(50, 0, 0, 0),
                textStyle: const TextStyle(fontSize: 15),
              ),
              icon: const Icon(Icons.cached),
              label: const Text("Restart Quiz"),
            )
          ],
        ),
      ),
    );
  }
}
