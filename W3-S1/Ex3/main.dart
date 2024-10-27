import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              child: Center(
                child: Text(
                  "OOP",
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.white,
                  ),
                ),
              ),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                color: Colors.blue[100],
              ),
            ),

             Container(
              child: Center(
                child: Text(
                  "DART",
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.white,
                  ),
                ),
              ),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                color: Colors.blue[300],
              ),
            ),

             Container(
              child: Center(
                child: Text(
                  "FLUTTER",
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.white,
                  ),
                ),
              ),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors:
                [
                     Colors.blue[300] ?? Colors.blue,  // Fallback to Colors.blue if null
                    Color.fromARGB(255, 3, 87, 161) ?? Colors.blue,

                ]),
                borderRadius: BorderRadius.all(Radius.circular(50)),
                color: Colors.blue[600],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
