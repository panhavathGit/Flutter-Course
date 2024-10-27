import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key, required this.text, this.color = Colors.blue});
  final String text;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      width: 700,
      height: 80,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 30,
            decoration: TextDecoration.none,
            color: Colors.white,
          ),
        ),
      ),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        color: color,
      ),
    ));
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
        body: Column(
      children: [
        MyWidget(text: "OOP" , color: Colors.blue[100]),
        MyWidget(text: "DART", color: Colors.blue[300]),
        MyWidget(text: "FLUTTER",color: Colors.blue[600])
      ],
    )),
  ));
}
