// questions.dart

// regular class to act as a blueprint -
class QuizQuestion {
  const QuizQuestion(this.text,
      this.answers); // constructor function to map values to receive values and map to the properties below, it should be a const as it should not change

  final String text;
  final List<String> answers; // creates a list of strings for answers
}
