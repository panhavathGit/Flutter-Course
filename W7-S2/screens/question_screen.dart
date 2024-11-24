import 'package:flutter/material.dart';
import 'package:my_app/W7-S2/model/quiz.dart';
import 'package:my_app/W7-S2/model/submission.dart';

class QuestionScreen extends StatefulWidget {
  final Quiz quiz;
  //use this to pass data back to parent
  final Function(Submission) onFinish;
  const QuestionScreen({super.key, required this.quiz, required this.onFinish});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentQuestionIndex = 0;
  Submission submission = Submission();
  String? selectedAnswer;

  @override
  Widget build(BuildContext context) {
    final currentQuestion = widget.quiz.questions[currentQuestionIndex];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          currentQuestion.title,
          style: TextStyle(fontSize: 30),
        ),
        //Select answer and save logic
        ...currentQuestion.possibleAnswers.map((answer) {
          return Container(
            margin: EdgeInsets.all(5),
            width: 200,
            //Button for chosing answer
            child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue[400]),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                ),
                child: Text(answer),
                onPressed: () {
                  selectedAnswer = answer;
                  submission.addAnswer(
                      currentQuestion,
                      Answer(
                          questionAnswer: currentQuestion.goodAnswer,
                          userAnswer: selectedAnswer!));
                }),
          );
        }),
        SizedBox(height: 20),
        //Move to next question button
        if(currentQuestionIndex < widget.quiz.questions.length-1)
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.amber[400]),
              foregroundColor: MaterialStateProperty.all(Colors.black),
            ),
            onPressed: () {
              setState(() {
                // Move to the next question
                if (currentQuestionIndex < widget.quiz.questions.length - 1) {
                  currentQuestionIndex++;
                } else {
                  print('Quiz Finished!');
                }
              });
            },
            child: const Text("Next Question"),
          ),
        
       
        SizedBox(height: 15),
        //Submit button
        if (currentQuestionIndex == widget.quiz.questions.length - 1)
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.green),
            foregroundColor: MaterialStateProperty.all(Colors.black),
          ),
          onPressed: () => widget.onFinish(submission),
          child: const Text("Finish the quiz"),
        ),
      ],
    );
  }
}
