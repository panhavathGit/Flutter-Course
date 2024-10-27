import 'dart:io';

class Color {
  static const String reset = '\x1B[0m';
  static const String bold = '\x1B[1m';

  static const String red = '\x1B[31m';
  static const String green = '\x1B[32m';
  static const String yellow = '\x1B[33m';
  static const String blue = '\x1B[34m';
  static const String cyan = '\x1B[36m';
}

class User {
  String firstName;
  String lastName;

  User({required this.firstName, required this.lastName});

  @override
  String toString() {
    return 'Name: ${firstName} ${lastName}';
  }
}

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
    return '${Color.bold}${Color.blue}Title: $title${Color.reset}\nAnswers: ${answers.join(', ')}';
  }

  bool isCorrect(List<String> userAnswers) {
    List<String> formattedCorrectAnswers =
        correctAnswers.map((answer) => answer.toLowerCase()).toList();
    List<String> formattedUserAnswers =
        userAnswers.map((answer) => answer.toLowerCase()).toList();

    return formattedCorrectAnswers
            .every((answer) => formattedUserAnswers.contains(answer)) &&
        formattedUserAnswers
            .every((answer) => formattedCorrectAnswers.contains(answer));
  }
}

class Quiz {
  List<Question> questions;

  Quiz({required this.questions});

  void conductQuiz(User user) {
    int score = 0;

    print('${Color.yellow}Starting quiz for ${user.firstName} ${user.lastName}${Color.reset}\n');

    for (var question in questions) {
      print(question);
      stdout.write('${Color.cyan}Your answer${question.isMultipleAnswer ? 's (comma-separated): ' : ': '}${Color.reset}');

      String userInput = stdin.readLineSync() ?? '';
      List<String> userAnswers = question.isMultipleAnswer
          ? userInput.split(',').map((answer) => answer.trim()).toList()
          : [userInput];

      if (question.isCorrect(userAnswers)) {
        print('${Color.green}Correct!${Color.reset}\n');
        score++;
      } else {
        print(
            '${Color.red}Wrong! The correct answers are: ${question.correctAnswers.join(', ')}${Color.reset}\n');
      }
    }

    print('${Color.yellow}Your final score: $score/${questions.length}${Color.reset}');
  }
}

void main() {
  stdout.write('${Color.cyan}Enter your first name: ${Color.reset}');
  String firstName = stdin.readLineSync() ?? '';

  stdout.write('${Color.cyan}Enter your last name: ${Color.reset}');
  String lastName = stdin.readLineSync() ?? '';

  User user = User(firstName: firstName, lastName: lastName);

  // Questions
  Question question1 = Question(
    title: 'What is the capital of France?',
    answers: ['Paris', 'London', 'Berlin', 'Madrid'],
    correctAnswers: ['Paris'],
  );

  Question question2 = Question(
    title: 'Which numbers add up to 6?',
    answers: ['2', '4', '5', '1', '6'],
    correctAnswers: ['2', '4'],
    isMultipleAnswer: true,
  );

  Question question3 = Question(
    title: 'Which language is used for Flutter development?',
    answers: ['Python', 'Java', 'Dart', 'Kotlin'],
    correctAnswers: ['Dart'],
  );

  List<Question> questionList = [question1, question2, question3];
  Quiz exam = Quiz(questions: questionList);

  exam.conductQuiz(user);
}
