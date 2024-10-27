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
    return formattedCorrectAnswers.every((answer) => formattedUserAnswers.contains(answer)) 
           &&
           formattedUserAnswers.every((answer) => formattedCorrectAnswers.contains(answer));
  }
} 

class Quiz {
  List<Question> questions;

  Quiz({required this.questions});

  void conductQuiz(User user) {
    int score = 0;

    print('Starting quiz for ${user.firstName} ${user.lastName}\n');

    for (var question in questions) {
      print(question);
      stdout.write(
          'Your answer${question.isMultipleAnswer ? 's (comma-separated): ' : ': '}');

      String userInput = stdin.readLineSync() ?? '';

      // List<String> userAnswers = question.isMultipleAnswer
      //     ? userInput.split(',').map((answer) => answer.trim()).toList() // Handle multiple answers
      //     : [userInput]; // Single answer in a list

      List<String> userAnswers;
      if (question.isMultipleAnswer) {
          // Handle multiple answers
          userAnswers = userInput.split(',').map((answer) => answer.trim()).toList();
      } else {
          // Single answer in a list
          userAnswers = [userInput];
      }

      if (question.isCorrect(userAnswers)) {
        print('Correct!\n');
        score++;
      } else {
        print(
            'Wrong! The correct answers are: ${question.correctAnswers.join(', ')}\n');
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
  Question question4 = Question(
    title: 'What is the capital of France?',
    answers: ['Paris', 'London', 'Berlin', 'Madrid'],
    correctAnswers: ['Paris'],
  );

  Question question2 = Question(
      title: 'Which numbers add up to 6?',
      answers: ['2', '4', '5', '1', '6'],
      correctAnswers: ['2', '4'],
      isMultipleAnswer: true // Mark as multiple-answer question
      );

  Question question3 = Question(
    title: 'Which language is used for Flutter development?',
    answers: ['Python', 'Java', 'Dart', 'Kotlin'],
    correctAnswers: ['Dart'],
  );

  Question question1 = Question(
      title: 'Choose the name of fruit',
      answers: ['banana', 'apple', 'car', 'orange'],
      correctAnswers: ['banana', 'apple', 'orange'],
      isMultipleAnswer: true);

  List<Question> questionList = [question1, question2, question3, question4];
  Quiz exam = Quiz(questions: questionList);

  // Conduct the quiz
  exam.conductQuiz(user);
}
