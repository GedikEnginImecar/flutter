import "package:flutter/material.dart";
import "package:quiz_app/question_screen.dart";
import "package:quiz_app/start_screen.dart";

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var activeScreen = "start-screen"; // mapping active screen to a string

  void switchScreen() {
    setState(() {
      activeScreen =
          "question-screen"; // mapping the new active screen to question screen, its easier to read and digest as a human
    });
  }

  @override
  Widget build(context) {
    final screenWidget = activeScreen == "start-screen"
        ? StartScreen(switchScreen)
        : const QuestionScreen();

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
