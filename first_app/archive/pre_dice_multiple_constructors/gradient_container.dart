import "package:flutter/material.dart";
import "package:first_app/styled_text.dart";

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer(this.color1, this.color2, this.color3, this.color4,
      this.color5, this.color6,
      {super.key});

// uses constructor classes with set values to make it easier to specify the background we want
  const GradientContainer.red({super.key})
      : color1 = const Color.fromARGB(255, 179, 0, 0),
        color2 = const Color.fromARGB(255, 204, 0, 0),
        color3 = const Color.fromARGB(255, 230, 0, 0),
        color4 = const Color.fromARGB(255, 255, 0, 0),
        color5 = const Color.fromARGB(255, 255, 26, 26),
        color6 = const Color.fromARGB(255, 255, 51, 51);

  const GradientContainer.green({super.key})
      : color1 = const Color.fromARGB(255, 0, 179, 0),
        color2 = const Color.fromARGB(255, 0, 204, 0),
        color3 = const Color.fromARGB(255, 0, 230, 0),
        color4 = const Color.fromARGB(255, 0, 255, 0),
        color5 = const Color.fromARGB(255, 26, 255, 26),
        color6 = const Color.fromARGB(255, 51, 255, 51);

  const GradientContainer.blue({super.key})
      : color1 = const Color.fromARGB(255, 0, 0, 179),
        color2 = const Color.fromARGB(255, 0, 0, 204),
        color3 = const Color.fromARGB(255, 0, 0, 230),
        color4 = const Color.fromARGB(255, 0, 0, 255),
        color5 = const Color.fromARGB(255, 26, 26, 255),
        color6 = const Color.fromARGB(255, 51, 51, 255);

  final Color color1;
  final Color color2;
  final Color color3;
  final Color color4;
  final Color color5;
  final Color color6;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color1, color2, color3, color4, color5, color6],
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      child: const Center(
        child: StyledText("test"),
      ),
    );
  }
}
