class Question {
  String title;
  List<String> answers;
  List<String> correctAnswers;
  bool isMultipleAnswer;

  Question({
    required this.title,
    required this.answers,
    required this.correctAnswers,
    this.isMultipleAnswer = false,
  });

  @override
  String toString() {
    return 'Title: $title\nAnswers: ${answers.join(', ')}';
  }

  bool isCorrect(List<String> userAnswers) {
    //formatted mean we convert to lower case
    List<String> formattedCorrectAnswers =
        correctAnswers.map((answer) => answer.toLowerCase()).toList();
    List<String> formattedUserAnswers =
        userAnswers.map((answer) => answer.toLowerCase()).toList();

    //Check if all correct answers are in user answers and no extra incorrect answers
    //make sure that both list contain exactly the same answer, and no extra wrong answers
    return formattedCorrectAnswers
            .every((answer) => formattedUserAnswers.contains(answer)) &&
        formattedUserAnswers
            .every((answer) => formattedCorrectAnswers.contains(answer));
  }
}