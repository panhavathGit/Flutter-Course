import 'dart:io';

// Define ANSI escape codes for colors
class ConsoleColors {
  static const String reset = '\u001B[0m';
  static const String black = '\u001B[30m';
  static const String red = '\u001B[31m';
  static const String green = '\u001B[32m';
  static const String yellow = '\u001B[33m';
  static const String blue = '\u001B[34m';
  static const String magenta = '\u001B[35m';
  static const String cyan = '\u001B[36m';
  static const String white = '\u001B[37m';
  static const String bold = '\u001B[1m';
  static const String underline = '\u001B[4m';
}

class User {
  String firstName;
  String lastName;

  User({required this.firstName, required this.lastName});

  @override
  String toString() {
    return 'Name: $firstName $lastName';
  }
}

class Question {
  String title;
  List<String> answers;
  String correctAnswer; // Add a field for the correct answer

  Question({required this.title, required this.answers, required this.correctAnswer});

  @override
  String toString() {
    return 'Title: $title\nAnswers: ${answers.join(', ')}';
  }

  // Method to check if the user's answer is correct
  bool isCorrect(String userAnswer) {
    return userAnswer.toLowerCase() == correctAnswer.toLowerCase();
  }
}

class Quiz {
  List<Question> questions;
  User? registeredUser; // Hold a single user instance

  Quiz({required this.questions});

  void registerUser(User user) {
    registeredUser = user; // Assign the single user
    print('${user.toString()} has been registered for the quiz.\n');
  }

  @override
  String toString() {
    return questions.map((q) => q.toString()).join('\n\n');
  }

  // Method to conduct the quiz
  void conductQuiz() {
    if (registeredUser == null) {
      print('${ConsoleColors.red}No user registered for the quiz.${ConsoleColors.reset}');
      return;
    }

    print('${ConsoleColors.green}Starting quiz for ${registeredUser.toString()}:${ConsoleColors.reset}');
    int score = 0;

    for (var question in questions) {
      print(question);
      stdout.write('${ConsoleColors.yellow}Your answer: ${ConsoleColors.reset}');

      String userAnswer = stdin.readLineSync() ?? '';

      if (question.isCorrect(userAnswer)) {
        print('${ConsoleColors.green}Correct!${ConsoleColors.reset}\n');
        score++;
      } else {
        print('${ConsoleColors.red}Wrong! The correct answer is: ${question.correctAnswer}${ConsoleColors.reset}\n');
      }
    }

    print('${ConsoleColors.blue}Your final score: $score/${questions.length}${ConsoleColors.reset}');
  }
}

void main() {
  // Create individual questions
  Question question1 = Question(
    title: 'What is the capital of France?',
    answers: ['Paris', 'London', 'Berlin', 'Madrid'],
    correctAnswer: 'Paris',
  );

  Question question2 = Question(
    title: 'What is 2 + 2?',
    answers: ['3', '4', '5', '6'],
    correctAnswer: '4',
  );

  Question question3 = Question(
    title: 'Which language is used for Flutter development?',
    answers: ['Python', 'Java', 'Dart', 'Kotlin'],
    correctAnswer: 'Dart',
  );

  // Create a list of questions
  List<Question> questionList = [question1, question2, question3];

  // Create a Quiz instance
  Quiz exam = Quiz(questions: questionList);

  // Register a user
  stdout.write('${ConsoleColors.blue}Enter your first name: ${ConsoleColors.reset}');
  String firstName = stdin.readLineSync() ?? '';
  
  stdout.write('${ConsoleColors.blue}Enter your last name: ${ConsoleColors.reset}');
  String lastName = stdin.readLineSync() ?? '';

  User user = User(firstName: firstName, lastName: lastName);
  exam.registerUser(user); // Register the user

  // Print the quiz to see all questions
  print(exam);

  // Conduct the quiz
  exam.conductQuiz();
}
