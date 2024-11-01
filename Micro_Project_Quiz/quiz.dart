import 'dart:io';
import 'user.dart';
import 'question.dart';
import 'user_results.dart';

class Quiz {
  List<Question> questions;

  Quiz({required this.questions});

  // Modify the conductQuiz method to return a UserResult
  UserResult conductQuiz(User user) {
    int score = 0;

    print('Starting quiz for ${user.firstName} ${user.lastName}\n');

    for (var question in questions) {
      print(question);
      stdout.write(
          'Your answer${question.isMultipleAnswer ? 's (comma-separated): ' : ': '}');

      String userInput = stdin.readLineSync() ?? '';

      List<String> userAnswers = question.isMultipleAnswer
          ? userInput.split(',').map((answer) => answer.trim()).toList()
          : [userInput];

      if (question.isCorrect(userAnswers)) {
        print('Correct!\n');
        score++;
      } else {
        print(
            'Wrong! The correct answers are: ${question.correctAnswers.join(', ')}\n');
      }
    }

    print('Your final score: $score/${questions.length}');

    // Create and return a UserResult with the final score
    return UserResult(firstname: user.firstName, lastname: user.lastName, score: score);
  }
}
