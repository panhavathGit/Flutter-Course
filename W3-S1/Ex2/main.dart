import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Center(
        child: Container(
          width: 500,
          height: 700,
          color: Colors.blue[200],
          alignment: Alignment.center, // Center the child within the container
          child: Container(
            margin: EdgeInsets.all(50),
            padding: EdgeInsets.all(50),
            width: 500,
            height: 700,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.blue[400],
            ),
            child: Center(
              child: Text(
                "CADT STUDENTS",
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  ));
}
