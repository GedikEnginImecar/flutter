// imports necessary packages
// dart:math is a math lib built and provided by dart
import 'package:flutter/material.dart';
import "dart:math";

// first part of initializing a widget that is expected to change - a StatefulWidget
// this means the DiceRoller is a widget with different states and it can change between them

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  // the override servers to work over the default established values and params by material.dart
  @override
  State<DiceRoller> createState() {
    // this is where we create a new state for the DiceRoller

    return _DiceRollerState(); // return calls the protected method _DiceRollerState
  }
}

// protected method only meant to be accessed by its super class
// inherits from the DiceRoller's State
class _DiceRollerState extends State<DiceRoller> {
  var currentDiceFace = 5; // regular variable for the dice face
  void rollDice() {
    // dice rolling function
    setState(() {
      // built in function to change the state
      currentDiceFace = Random().nextInt(6) + 1;
    });
    // changes to be made and apply to the new state
    // Random().nextInt(6) selects from 0 =< number < 6
    // having it Random().nextInt(6) + 1 means it is 1 =< number < 7 which gives us the correct range of a die roll outcomes

    print(
        "Dice value: $currentDiceFace"); // regular print statement with string appending to display what dice is rolled in console
  }

  // the Widget building that is called when state change occurs or when building initial state
  @override
  Widget build(context) {
    return Column(
      // what to return to the parent widget that called it goes under return
      mainAxisSize: MainAxisSize
          .min, // forces the column height to be the minimum required (helps with vertical centering)
      children: [
        // sized box is similar to grid but allows you to customize the sizes, dimensions, columns and rows of a widgets placement
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.5, // 50% of device width
          height:
              MediaQuery.of(context).size.height * 0.5, // 50% of device height
          child: Image.asset(
              "assets/images/dice-$currentDiceFace.png"), // assigning an image to a child of SizedBox, needs to be declared in pubspec.yaml
        ),
        ElevatedButton(
            // button widget
            onPressed: rollDice, // the function to call on press
            style: TextButton.styleFrom(
              // style is not included in the default auto complete but can be added to customize it, styling very similar to css
              padding: const EdgeInsets.all(20),
              foregroundColor: Colors.white,
              backgroundColor: const Color.fromARGB(50, 0, 0, 0),
              textStyle: const TextStyle(fontSize: 20),
            ),
            child: const Text(
                "Roll the die!")), // the text content of the button to display, can be an image too but we are using text
      ],
    );
  }
}
