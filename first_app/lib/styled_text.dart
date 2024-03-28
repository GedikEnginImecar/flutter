import "package:flutter/material.dart";

class StyledText extends StatelessWidget {
  const StyledText({super.key});

  @override
  Widget build(context) {
    return const Text(
      "Fingers Crossed here we go!",
      style: TextStyle(
        backgroundColor: Color.fromARGB(255, 154, 173, 152),
        color: Color.fromARGB(255, 255, 255, 255),
      ),
    );
  }
}
