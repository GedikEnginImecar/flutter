// question_screen.dart

import "package:flutter/material.dart";

import "package:quiz_app/answer_button.dart";
import "package:quiz_app/data/questions.dart";

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion() {
    // currentQuestionIndex = currentQuestionIndex + 1;
    // currentQuestionIndex += 1;
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      // width: MediaQuery.of(context).size.width,
      // height: MediaQuery.of(context).size.height,
      width: double.infinity, // built in dart sizing for all available space
      height: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          // mainAxisAlignment to center the column without using center box, allows you to move it as needed
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              textAlign: TextAlign.center,
              currentQuestion.text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 30),
            // flutters built in spreading method. pulls them out of an iterable list and puts them in a comma separated values in the code
            ...currentQuestion.getShuffledAnswers().map(
              (answer) {
                return AnswerButton(
                  answerText: answer,
                  onTap: answerQuestion,
                );
                // no brackets as its a pointer to the function not being executed internally
              },
            ),
          ],
        ),
      ),
    );
  }
}
