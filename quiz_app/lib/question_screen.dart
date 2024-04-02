// question_screen.dart

import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

import "package:quiz_app/answer_button.dart";
import "package:quiz_app/data/questions.dart";

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswers) {
    // built in dart/flutter widget property, the onSelectAnswer is initialized in the widget class above not the protected method
    // using widget.onSelectAnswer allows you to access it in the private class without having it present in the private class
    widget.onSelectAnswer(
        "..."); // function that is a function from QuestionScreen widget but made available by using widget property from dart/flutter
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
            // Text(
            //   textAlign: TextAlign.center,
            //   currentQuestion.text,
            //   style: const TextStyle(
            //     color: Colors.white,
            //     fontSize: 20,
            //   ),
            Text(
              textAlign: TextAlign.center,
              currentQuestion.text,
              style: GoogleFonts.gloriaHallelujah(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            // flutters built in spreading method. pulls them out of an iterable list and puts them in a comma separated values in the code
            ...currentQuestion.getShuffledAnswers().map(
              (answer) {
                return AnswerButton(
                  answerText: answer,
                  // onTap: answerQuestion, // this is the initial method used before answer checking
                  // however it is a pointer so it does not take in a string like we are trying to pass and append to the selected answers list.
                  onTap: () {
                    // so you use an anon function to call answerQuestion method and pass selected answer into it
                    answerQuestion(answer);
                  },
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
