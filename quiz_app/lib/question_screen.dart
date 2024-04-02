// question_screen.dart

import "package:flutter/material.dart";
import "package:quiz_app/answer_button.dart";

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  Widget build(context) {
    return SizedBox(
      // width: MediaQuery.of(context).size.width,
      // height: MediaQuery.of(context).size.height,
      width: double.infinity, // built in dart sizing for all available space
      height: double.infinity,
      child: Column(
        // mainAxisAlignment to center the column without using center box, allows you to move it as needed
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "The question:",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          const SizedBox(height: 30),
          AnswerButton(answerText: "Ans 1", onTap: () {}),
          AnswerButton(answerText: "Ans 2", onTap: () {}),
          AnswerButton(answerText: "Ans 3", onTap: () {}),
          AnswerButton(answerText: "Ans 4", onTap: () {}),
        ],
      ),
    );
  }
}
