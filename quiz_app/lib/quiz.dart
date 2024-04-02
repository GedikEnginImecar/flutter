// quiz.dart

import "package:flutter/material.dart";
import "package:quiz_app/question_screen.dart";
import "package:quiz_app/results_screen.dart";
import "package:quiz_app/start_screen.dart";
import "package:quiz_app/data/questions.dart";

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var activeScreen = "start-screen";

  List<String> selectedAnswers = [];
  // creating a list for the answers selected, you can use final as you won't be reassigning it, but rather adding to it

  void switchScreen() {
    setState(() {
      activeScreen = "question-screen";
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer); // built in dart list adding - aka appending

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = "results-screen";
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == "question-screen") {
      screenWidget = QuestionScreen(onSelectAnswer: chooseAnswer);
    } else if (activeScreen == "results-screen") {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
        onRestart: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
