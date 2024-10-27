import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("Let it xiao ge hotpot"),
        backgroundColor: Colors.blue[200],
      ),
      body: Center(
        child: Text("Hello Panhavath",
        style: TextStyle(
          color: Colors.amber[300],
          fontSize: 50,
        ),),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>{},
        child: Text("click me"),
      ),
    ),
  ));
}


