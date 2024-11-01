import 'dart:io';
import 'user.dart';
import 'question.dart';
import 'quiz.dart';
import 'user_results.dart';

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

  // Conduct the quiz and receive a UserResult
  UserResult result = exam.conductQuiz(user);

  // Save the result to JSON
  result.saveToJson();
}

