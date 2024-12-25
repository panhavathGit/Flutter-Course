import 'package:flutter/material.dart';
import 'package:my_app/Flashcard-PersonalProject/widget/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:"My FlashCard", 
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 253, 255, 254),
          brightness: Brightness.dark,
          surface: const Color.fromARGB(255, 222, 0, 0),
        ),
        scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      
    );
  }
}
