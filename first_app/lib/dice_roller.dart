import 'package:flutter/material.dart';
import "dart:math";

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  var currentDiceFace = 5;
  void rollDice() {
    setState(() {
      currentDiceFace = Random().nextInt(6) + 1;
    });
    print("Dice value: $currentDiceFace");
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize
          .min, // forces the column height to be the minimum required (helps with vertical centering)
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.5, // 50% of screen width
          height:
              MediaQuery.of(context).size.height * 0.5, // 50% of screen height
          child: Image.asset("assets/images/dice-$currentDiceFace.png"),
        ),
        ElevatedButton(
            onPressed: rollDice,
            style: TextButton.styleFrom(
              padding: const EdgeInsets.all(20),
              foregroundColor: Colors.white,
              backgroundColor: const Color.fromARGB(50, 0, 0, 0),
              textStyle: const TextStyle(fontSize: 20),
            ),
            child: const Text("Roll the die!")),
      ],
    );
  }
}
