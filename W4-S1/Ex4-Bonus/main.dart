import 'package:flutter/material.dart';

const String sunny = 'assets/W4-S1-Bonus/sun.png';
const String snowing = 'assets/W4-S1-Bonus/snowing.png';
const String warm = 'assets/W4-S1-Bonus/warm.png';
const String cloudy = 'assets/W4-S1-Bonus/cloudy.png';
const String raining = 'assets/W4-S1-Bonus/heavy-rain.png';
const String rainSun = 'assets/W4-S1-Bonus/rain_sun.png';


class WeatherForecast extends StatelessWidget {
  final String imagePath;
  final String day;
  final String minTemp;
  final String maxTemp;
  const WeatherForecast(
      {super.key,
      required this.day,
      required this.imagePath,
      required this.maxTemp,
      required this.minTemp});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(10),
        width: 100,
        height: 150,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Text(day),
            Padding(
                padding: EdgeInsets.all(10),
                child: Image.asset(imagePath, width: 80)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(maxTemp),
                Text(minTemp, style: TextStyle(color: Colors.grey)),
              ],
            )
          ],
        ));
  }
}

void main() {
  runApp(MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        body: Container(
          child: Center(
            child: IntrinsicWidth(
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  WeatherForecast(day: "Sun", imagePath: sunny, maxTemp: "15\u00B0C ", minTemp: "-3\u00B0C"),
                  WeatherForecast(day: "Mon", imagePath: warm, maxTemp: "12\u00B0C ", minTemp: "7\u00B0C"),
                  WeatherForecast(day: "Tue", imagePath: rainSun, maxTemp: "9\u00B0C ", minTemp: "7\u00B0C"),
                  WeatherForecast(day: "Wed", imagePath: raining, maxTemp: "8\u00B0C ", minTemp: "-1\u00B0C"),
                  WeatherForecast(day: "Thu", imagePath: snowing, maxTemp: "5\u00B0C ", minTemp: "-2\u00B0C"),
                  WeatherForecast(day: "Fri", imagePath: cloudy, maxTemp: "4\u00B0C ", minTemp: "-4\u00B0C"),
                  WeatherForecast(day: "Sat", imagePath: sunny, maxTemp: "3\u00B0C ", minTemp: "-3\u00B0C"),
                ]),
              )
          )
        )
      )
    )
  ));
}
