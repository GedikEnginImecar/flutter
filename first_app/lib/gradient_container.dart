//imports the necessary packages
import "package:flutter/material.dart";
import "package:first_app/dice_roller.dart";

// alignment for the linear gradient background
const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

// creates the stateless widget (as GradientContainer itself does not change)
class GradientContainer extends StatelessWidget {
  const GradientContainer(
      {super.key,
      required this.colorList}); // inherits key from its super class - StatelessWidget

// assigns colorList as a final list type as it needs to be initialized after receiving it from its class call
  final List<Color> colorList;

  // creating the widget and called other sub widgets (DiceRoller)
  // uses colorList established above, the colors field takes in a singular color or a list so colorList needs to be a list when being passed in
  // override servers to allow us to overwrite the default values/params that material.dart has for the container widget

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colorList,
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      child: const Center(
        child: DiceRoller(),
      ),
    );
  }
}
