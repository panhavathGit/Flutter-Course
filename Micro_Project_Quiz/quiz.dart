// import 'question.dart';
class Question {
  String title;
  List<String> answer = [];

  Question({required this.title, required this.answer});

  @override
  String toString() {
    return 'Title : ${this.title} \n ${this.answer}';
  }
}
class Quiz {
  List<Question> questions = [];

  Quiz({required this.questions});

  @override
  String toString() {
    return '${questions.join('\n')}';
  }

}

void main() {
    // Create individual questions with titles and answers
    Question question1 = Question(
      title: 'What is the capital of France?',
      answer: ['Paris', 'London', 'Berlin', 'Madrid'],
    );

    Question question2 = Question(
      title: 'What is 2 + 2?',
      answer: ['3', '4', '5', '6'],
    );

    Question question3 = Question(
      title: 'Which language is used for Flutter development?',
      answer: ['Python', 'Java', 'Dart', 'Kotlin'],
    );

    // Add the questions to a list
    List<Question> questionList = [question1, question2, question3];

    // Create a Quiz instance using the list of questions
    Quiz exam = Quiz(questions: questionList);

    // Print the quiz to see all questions and their answers
    print(exam);
  
}
