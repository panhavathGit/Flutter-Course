import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  final Color? color;
  final IconData icon;
  final String text;
  const MyWidget(
      {super.key, required this.color, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(children: [
        Padding(
          padding: EdgeInsets.only(right: 20, left: 30), 
          child:Icon(icon, size: 30, color: Colors.white)
        ),
        Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        )
      ]),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              MyWidget(color: Colors.green[500], icon: Icons.travel_explore , text: "Travelling"),
              MyWidget(color: Colors.grey, icon: Icons.skateboarding, text: "Skating"),
            ]
          ),
        ),
      ),
    ),
  );
}
