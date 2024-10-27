  @override
  String toString() {
    // Loop through questions and format output
    return questions.map((q) => q.toString()).join('\n');
  }