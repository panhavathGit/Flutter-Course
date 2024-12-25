import 'package:flutter/material.dart';
import 'package:my_app/Flashcard-PersonalProject/data/word_storage.dart';
import 'package:my_app/Flashcard-PersonalProject/widget/create_card.dart';
import 'package:my_app/Flashcard-PersonalProject/model/word.dart';
import 'package:my_app/Flashcard-PersonalProject/widget/flipcard_screen.dart';

class ListTileOfWordScreen extends StatefulWidget {
  final String category;
  const ListTileOfWordScreen({super.key, required this.category});

  @override
  State<ListTileOfWordScreen> createState() => _ListTileOfWordScreenState();
}

class _ListTileOfWordScreenState extends State<ListTileOfWordScreen> {
  Set<Word> categorizedWord = Set<Word>();

  String? wordFilter(String category, int index) {
    if (wordList[index].category == category) {
      return wordList[index].chineseCharacter;
    }
    return null;
  }

  Word? filteredWordObject(String category, int index) {
    if (wordList[index].category == category) {
      return wordList[index];
    }
    return null;
  }

  void addNewWord() async {
    final newWord = await Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => CardEditorScreen(category: widget.category)),
    );

    if (newWord != null) {
      setState(() {
        wordList.add(newWord);
      });
    }
  }

  void navigateToFlipMode(Set<Word> categorizedWord) async {
    List<Word> uniqueWords = categorizedWord.toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => FlipModeScreen(categorizedWords: uniqueWords),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(widget.category, style: const TextStyle(color: Colors.white, fontSize: 24)),
        centerTitle: false,
        backgroundColor: const Color.fromARGB(255, 243, 8, 8),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: addNewWord,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: wordList.length,
              itemBuilder: (context, index) {
                String? filteredWord = wordFilter(widget.category, index);
                Word? word = filteredWordObject(widget.category, index);

                if (word != null) {
                  categorizedWord.add(word);
                  return Dismissible(
                    key: ValueKey(word.id),
                    background: Container(
                      color: const Color.fromARGB(255, 221, 97, 88),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      alignment: Alignment.centerLeft,
                      child: const Icon(Icons.delete, color: Colors.white, size: 30),
                    ),
                    secondaryBackground: Container(
                      color: const Color.fromARGB(255, 0, 132, 255),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      alignment: Alignment.centerRight,
                      child: const Icon(Icons.edit, color: Colors.white, size: 30),
                    ),
                    confirmDismiss: (direction) async {
                      if (direction == DismissDirection.startToEnd) {
                        final bool? confirmDelete = await showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Confirm Delete'),
                            content: const Text('Are you sure you want to delete this word?'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(false),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(true),
                                child: const Text('Delete'),
                              ),
                            ],
                          ),
                        );
                        if (confirmDelete ?? false) {
                          setState(() {
                            wordList.remove(word);
                          });
                        }
                        return confirmDelete ?? false;
                      } else if (direction == DismissDirection.endToStart) {
                        final updatedWord = await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => CardEditorScreen(
                              category: widget.category,
                              wordToEdit: word,
                            ),
                          ),
                        );
                        if (updatedWord != null) {
                          setState(() {
                            int wordIndex = wordList.indexOf(word);
                            wordList[wordIndex] = updatedWord;
                          });
                        }
                        return false;
                      }
                      return false;
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 8, 89, 219),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: ListTile(
                        leading: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(filteredWord!, style: const TextStyle(color: Colors.white, fontSize: 20)),
                        ),
                        title: Text(
                          wordList[index].pinyin,
                          style: const TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
          GestureDetector(
            onTap: () => navigateToFlipMode(categorizedWord),
            child: Container(
              width: double.infinity,
              height: 70,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 212, 6, 6),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: const Center(
                child: Text(
                  'Card flipping mode',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
