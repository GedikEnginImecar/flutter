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
  Widget? activeScreen;
// using a question mark means the variable is present but it could take in a null value

// passes a pointer to link with switchScreen - avoid using brackets as that will call it which is not the intention
  // normally you would get an error here as you are trying to use switchScreen without declaring/initializing it which is why you need to create a dedicated initialization method

  // need to create an initialization method to prevent functions and assignments occurring too early.
  // it is only executed once and is never done again
  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

// too many arguments being passed into start screen ^^ if it is not accounted for like below
// that needs to be changed on start_screen.dart
// you can add either a positional or name argument in the constructor class and specify the class
// i.e: from

// class StartScreen extends StatelessWidget {
//    const StartScreen({super.key});

// to:

// class StartScreen extends StatelessWidget {
//    const StartScreen(void Function() startQuiz, {super.key});

// or using darts built in type recognition

// class StartScreen extends StatelessWidget {
//    const StartScreen(this.startQuiz, {super.key});

// this means that startQuiz is declared as a function type, which is built into dart
// the startQuiz is a function that doesn't return a value or takes in a value, which matches what the actual function does within quiz.dart

  void switchScreen() {
    setState(() {
      activeScreen = const QuestionScreen();
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            // using const here as all the widgets and values contained within fall under the constant type
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child:
              activeScreen, // StartScreen uses center to force the child to use all available space
        ),
      ),
    );
  }
}
