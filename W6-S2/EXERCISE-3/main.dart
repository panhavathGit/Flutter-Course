import 'package:flutter/material.dart';
import 'package:my_app/W6-S2/EXERCISE-3/screen/temperature.dart';
import 'package:my_app/W6-S2/EXERCISE-3/screen/welcome.dart';

class TemperatureApp extends StatefulWidget {
  const TemperatureApp({super.key});

  @override
  State<TemperatureApp> createState() {
    return _TemperatureAppState();
  }
}

class _TemperatureAppState extends State<TemperatureApp> {
  // Widget currentScreen = const Welcome();
  Widget? currentScreen;

  // Initialize `currentScreen` in the initState
  @override
  void initState() {
    super.initState();
    currentScreen = Welcome(changeScreen: switchScreen);
  }
  // Method to switch to the Temperature screen
  void switchScreen() {
    setState(() {
      if (currentScreen is Welcome) {
        currentScreen = Temperature(changeScreen: switchScreen);
      } else {
        currentScreen = Welcome(changeScreen: switchScreen);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff16C062),
                Color(0xff00BCDC),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: currentScreen ,
        ),
      ),
    );
  }
}

void main() {
  runApp(TemperatureApp());
}
