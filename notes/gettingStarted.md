## Creating a custom widget fundamentals

#### Stateless Widget

to create a new file/widget this is the basic skeleton

```dart
// creating a start screen widget as it is the norm to keep widgets and components that are not universal separate from the main

import "package:flutter/material.dart"; // importing material.dart lib

class StartScreen extends StatelessWidget { // creating the StatelessWidget class
  const StartScreen({super.key}); // short hand for dart constructor variable, optimized for memory using constants

  @override // overriding the basic/default config of the widget by material.dart
  Widget build(context) {
    return const Text("Start Screen"); // content and what to return when this widget is called
  }
}
```

this is what the matching main calling the StartScreen custom widget look like:

```dart

import "package:flutter/material.dart"; // importing material.dart lib
import "package:quiz_app/start_screen.dart"; // importing the start_screen.dart file to be able to use the custom widget from it

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(body: StartScreen()), // calling it as a child of the Scaffold widget
    ),
  );
}

```

### Stateful Widget

to get started with a stateful widget you need 2 classes, one StatefulWidget and one state inheriting the StatefulWidget.

```dart
// StatefulWidget
class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key}); // constructor variables

  // the override servers to work over the default values
  @override
  State<DiceRoller> createState() {     // this is where we create a new state for the DiceRoller

    return _DiceRollerState(); // return calls the protected method _DiceRollerState
  }
}
```

```dart
// Protected/inheriting class
// protected method only meant to be accessed by its super class, inherits from StatefulWidget parent class
class _DiceRollerState extends State<DiceRoller> {
  void rollDice() { // function that is called by an action to trigger state change
    setState(() {       // built in function to change the state
    });
  }
  // the Widget building that is called when state change occurs or when building initial state
  @override
  Widget build(context) {
    return Column(       // what to return to the parent widget that called it goes under return
        ElevatedButton(
            // button widget
            onPressed: rollDice, // the function to call on press,
            child: const Text(
                "Roll the die!")
                )
            )
        }
    }
```

### Different widgets you can use:

#### Buttons

```dart
// buttons and example stylings

OutlinedButton()
TextButton()
ElevatedButton(
            onPressed: rollDice, // the function to call on press or alternatively
            // onPressed: (){} to use an anonymous function
            style: TextButton.styleFrom(
              // style is not included in the default auto complete but can be added to customize it, styling very similar to css
              padding: const EdgeInsets.all(20), // padding for edges
              foregroundColor: Colors.white, // text color
              backgroundColor: const Color.fromARGB(50, 0, 0, 0), // background color
              textStyle: const TextStyle(fontSize: 20), // text stylings
            ),
            child: const Text(
                "Roll the die!"))  // the text content of the button to display, can be an image too but we are using text

```

#### Container like-housing widgets

```dart
Container()
Column() // to go vertically placed children within the widget tree
Row() // to go horizontally placed children within the widget tree
SizedBox(
    children: [
        // children widgets go in here
    ]
) // container like, allows multiple child widgets
```
