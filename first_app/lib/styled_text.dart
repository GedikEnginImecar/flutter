import "package:flutter/material.dart";

class StyledText extends StatelessWidget {
  const StyledText(this.displayText, {super.key});
  // this is the positional argument approach
  // this.displayText allows you to make the parameter being passed available as a class variable
  // however even if you leave it as just String displayText, flutter automatically looks for class variables based on the variable name
  // and assigns them automatically
  // it can no longer be a const as it has a value being passed into it which means it can change

  final String displayText;
  // as you do not plan on reassigning the variables, you can specify the type as final String

  @override
  Widget build(context) {
    // it can no longer be returning a const Text
    // as it has a value being passed into it which means it can change
    return Text(
      displayText,
      // so the new const is the style
      style: const TextStyle(
        backgroundColor: Color.fromARGB(255, 154, 173, 152),
        color: Color.fromARGB(255, 255, 255, 255),
      ),
    );
  }
}
