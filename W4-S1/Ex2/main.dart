import 'package:flutter/material.dart';

enum Product {
  dart("Dart", "The best object language", "assets/dart.jpg"),
  flutter("Flutter", "The best mobile widget library", "assets/flutter.png"),
  firebase("Firebase", "The best cloud database", "assets/firebase.png");

  final String title;
  final String text;
  final String imgPath;

  const Product(this.title, this.text, this.imgPath);
}

class ProductCard extends StatelessWidget {
  final String title;
  final String text;
  final String imgPath;
  const ProductCard(
      {super.key,
      required this.imgPath,
      required this.title,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(10),
        width: 500,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, 
              children: [
                  Image.asset(imgPath, width: 80),
                  Text(title,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        color: Colors.black,
                        fontSize: 34,
                      )
                    ),
                  Text(text,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        color: Colors.black,
                        fontSize: 15,
                  )
                )
        ]));
  }
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple[100],
          title: Center(
            child: Text("Products"),
          ),
        ),
        backgroundColor: Colors.blue[400],
        body: Center(
          child: Column(
            children: [
              ProductCard(
                imgPath: Product.dart.imgPath,
                title: Product.dart.title,
                text: Product.dart.text,
              ),
              ProductCard(
                imgPath: Product.flutter.imgPath,
                title: Product.flutter.title,
                text: Product.flutter.text,
              ),
              ProductCard(
                imgPath: Product.firebase.imgPath,
                title: Product.firebase.title,
                text: Product.firebase.text,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
