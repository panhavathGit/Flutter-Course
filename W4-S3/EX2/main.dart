import 'package:flutter/material.dart';

class Card extends StatefulWidget {
  const Card({super.key});

  @override
  State<Card> createState() => _CardState();
}

class _CardState extends State<Card> {
  bool isFavorite = true;

  void addFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  Color get color => isFavorite ? Colors.red : Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Container(
      // YOUR CODE
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: .5, color: Colors.grey),
        ),
      ),
      child: Row(children: [
        Expanded(
            child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("title",
                  style: TextStyle(color: Colors.blue[400], fontSize: 20)),
              Text("description", style: TextStyle(fontSize: 18)),
            ],
          ),
        )),
        IconButton(
            onPressed: addFavorite,
            icon: Icon(
              Icons.favorite,
              color: color,
            ))
      ]),
    );
  }
}

void main() => runApp(MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Favorite cards"),
        ),
        body: Column(
          children: [
            Card(),
            Card(),
            Card(),
          ],
        ),
      ),
    ));
