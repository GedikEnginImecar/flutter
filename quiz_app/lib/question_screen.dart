// question_screen.dart

import "package:flutter/material.dart";

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  void rollDice() {
    setState(() {});
  }

  @override
  Widget build(context) {
    return const Text("QuestionScreen");
  }
}
