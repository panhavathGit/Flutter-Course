import 'package:flutter/material.dart';

const String quizLogo = 'assets/W7/quiz-logo.png';

class WelcomeScreen extends StatelessWidget {
  final String quizTitle;
  final VoidCallback onStart;
  const WelcomeScreen({super.key,required this.quizTitle, required this.onStart});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          quizLogo, 
          width: 500, 
          height: 500,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(quizTitle,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 32,
        )),
        const SizedBox(
          height: 50,
        ),
        Container(
          width: 200,
          child: ElevatedButton(
            onPressed: onStart,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.arrow_right_alt),
                SizedBox(width: 10),
                Text("Start Quiz", style: TextStyle(fontSize: 15)),
              ],
            )
          ),
        ),
      ],
    );
  }
}
