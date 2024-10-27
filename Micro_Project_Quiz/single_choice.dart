import 'dart:io';

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
  String correctAnswer;

  Question({required this.title, required this.answers, required this.correctAnswer});
  @override
  String toString() {
    return 'Title: $title\nAnswers: ${answers.join(', ')}';
  }

  bool isCorrect(String userAnswer) {
    return userAnswer.toLowerCase() == correctAnswer.toLowerCase();
  }
}

class Quiz {
  List<Question> questions;

  Quiz({required this.questions});

  @override
  String toString() {
    return questions.map((q) => q.toString()).join('\n\n');
  }

  void conductQuiz(User user) {
    int score = 0;

    print('Starting quiz for ${user.firstName} ${user.lastName}\n');

    for (var question in questions) {
      print(question);
      stdout.write('Your answer: ');

      String userAnswer = stdin.readLineSync() ?? '';

      if (question.isCorrect(userAnswer)) {
        print('Correct!\n');
        score++;
      } else {
        print('Wrong! The correct answer is: ${question.correctAnswer}\n');
      }
    }

    print('Your final score: $score/${questions.length}');
  }
}

void main() {
  // User registration
  stdout.write('Enter your first name: ');
  String firstName = stdin.readLineSync() ?? '';

  stdout.write('Enter your last name: ');
  String lastName = stdin.readLineSync() ?? '';

  User user = User(firstName: firstName, lastName: lastName);

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

  List<Question> questionList = [question1, question2, question3];
  Quiz exam = Quiz(questions: questionList);

  // Print the quiz questions
  // print(exam);

  // Conduct the quiz
  exam.conductQuiz(user);
}
