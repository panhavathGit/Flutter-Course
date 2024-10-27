class Question {
  String title;
  List<String> answer = [];

  Question({required this.title, required this.answer});

  @override
  String toString() {
    return 'Title : ${this.title} \n ${this.answer}';
  }
}

// void main() {
//   Question q1 = Question(
//       title: "What is the capital city of Cambodia",
//       answer: ['PP', 'Kep', 'SR']);

//   print(q1.toString());
// }
