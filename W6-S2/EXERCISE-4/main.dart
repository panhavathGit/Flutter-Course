import 'package:flutter/material.dart';
import 'package:my_app/W6-S2/EXERCISE-4/data/jokes.dart';

Color appColor = Colors.green[300] as Color;

void main() => runApp(MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: appColor,
          title: const Text("Favorite Jokes"),
        ),
        body: JokeList(),
      ),
    ));

class JokeList extends StatefulWidget {
  const JokeList({
    super.key,
  });

  @override
  State<JokeList> createState() => _JokeCardState();
}

class _JokeCardState extends State<JokeList> {
  int? bestJokeIndex;

  void onFavoriteClick(int index) {
    setState(() {
      bestJokeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: jokes.length,
        itemBuilder: (context, index) {
          return JokeCard(
              joke: jokes[index],
              isFavorite: bestJokeIndex == index,
              onFavoriteClick: () => onFavoriteClick(index));
        });
  }
}

class JokeCard extends StatelessWidget {
  final Joke joke;
  final bool isFavorite;
  final VoidCallback onFavoriteClick;

  const JokeCard(
      {super.key,
      required this.joke,
      required this.isFavorite,
      required this.onFavoriteClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: .5, color: Colors.grey),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  joke.title,
                  style:
                      TextStyle(color: appColor, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 10.0),
                Text(joke.description)
              ],
            ),
          ),
          IconButton(
              onPressed: onFavoriteClick,
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.grey,
              ))
        ],
      ),
    );
  }
}
