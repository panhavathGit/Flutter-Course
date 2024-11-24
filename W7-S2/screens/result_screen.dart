import 'package:flutter/material.dart';
import 'package:my_app/W7-S2/model/submission.dart';

class ResultScreen extends StatelessWidget {
  final Submission submission;
  final VoidCallback onRestart;
  const ResultScreen(
      {super.key, required this.submission, required this.onRestart});

  @override
  Widget build(BuildContext context) {
    int score = submission.getScore();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Your Score: $score",
            style: TextStyle(fontSize: 34, color: Colors.amber[300])),
        ...submission.answers.entries.map((entry) {
          final question = entry.key;
          final possibleAnswers = question.possibleAnswers;
          final answer = entry.value;
          return Center(
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Centers items vertically
              crossAxisAlignment:
                  CrossAxisAlignment.center, // Centers items horizontally
              children: [
                Text(
                  question.title,
                  style: TextStyle(fontSize: 20),
                  textAlign:
                      TextAlign.center, // Ensures text is centered if multiline
                ),
                SizedBox(
                  height: 80,
                  child: ListView.builder(
                    itemCount: possibleAnswers.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Center(
                            child: Text(
                              possibleAnswers[index],
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                  
                        ],
                      );
                    },
                  ),
                ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            Text("Your Answer: ${answer.userAnswer}",
                            style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(width: 20,),
                            Text(
                              "Correct Answer: ${question.goodAnswer}",
                              style: TextStyle(fontSize: 16, color: Colors.green[200]),
                            ),
                                        
                          ],
                      )
              ],
            ),
          );
        }),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: onRestart,
          child: const Text("Restart Quiz"),
        ),
      ],
    );
  }
}

// return ListTile(
//             title: Text(question.title),
//             subtitle: Text(
//                 "Your Answer: ${answer.userAnswer}\nCorrect Answer: ${answer.questionAnswer}"),
//             tileColor: answer.isCorrect() ? Colors.green : Colors.red,
//           );