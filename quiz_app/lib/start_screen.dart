import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";

// creating a start screen widget as it is the norm to keep widgets and components that are not universal separate from the main
class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Opacity(
          //   opacity: 0.5,
          //   child: Image.asset("assets/images/quiz-logo.png",
          //       width: MediaQuery.of(context).size.width * 0.5,
          //       height: MediaQuery.of(context).size.height * 0.5),
          // ),
          Image.asset(
            "assets/images/quiz-logo.png",
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.height * 0.5,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),

          const SizedBox(
            height: 80,
          ),
          const Text(
            "Learn Flutter the fun way!",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.all(15),
              foregroundColor: Colors.white,
              backgroundColor: const Color.fromARGB(50, 0, 0, 0),
              textStyle: const TextStyle(fontSize: 15),
            ),
            icon: const Icon(Icons
                .arrow_right_alt), // when using an icon in a button, you need to provide an icon widget
            label: const Text("Start Quiz"), // and you replace child with label
          )
        ],
      ),
    );
  }
}

// import "package:flutter/material.dart"; // importing material.dart lib

// // creating a start screen widget as it is the norm to keep widgets and components that are not universal separate from the main
// class StartScreen extends StatelessWidget {
//   const StartScreen({super.key});

//   @override
//   Widget build(context) {
//     return const Center(
//         child: Text(
//             "Start Screen")); // center forces the Text child to take over the entire screen as there is no space constaints
//     // since the background color from main is applies to the container which start_screen is contained in,
//     // when it expands the background expands to cover the entire screen available as well
//   }
// }
