// import 'package:flutter/material.dart';
// import 'package:my_app/Flashcard-PersonalProject/model/word.dart';
// import 'package:my_app/Flashcard-PersonalProject/model/word_category.dart';

// class CardEditorScreen extends StatefulWidget {
//   final String category;
//   Word? wordToEdit;

//   CardEditorScreen({super.key, required this.category, wordToEdit});

//   @override
//   State<CardEditorScreen> createState() => _CardEditorScreenState();
// }

// class _CardEditorScreenState extends State<CardEditorScreen> {
//   final CategoryManager categoryManager = CategoryManager();
//   final _formKey = GlobalKey<FormState>();
//   String _chineseCharacter = '';
//   String _pinyin = '';
//   late String _category;

//   @override
//   void initState() {
//     super.initState();
//     _category = widget.category;
//   }

//   void _saveItem() {
//     if (_formKey.currentState!.validate()) {
//       _formKey.currentState!.save();

//       final newWord = Word(
//         chineseCharacter: _chineseCharacter,
//         pinyin: _pinyin,
//         category: _category,
//       );

//       Navigator.of(context).pop(newWord);
//     }
//   }

//   void _resetForm() {
//     _formKey.currentState!.reset();
//     setState(() {
//       _chineseCharacter = '';
//       _pinyin = '';
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final categories = categoryManager.getAllCategories();

//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//         title: const Text('Create Card'),
//         elevation: 0,
//         backgroundColor: Colors.transparent,
//         foregroundColor: Colors.black,
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           padding: const EdgeInsets.all(16.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 const SizedBox(height: 16),
//                 // Front Card
//                 Container(
//                   padding: EdgeInsets.all(50),
//                   height: 250,
//                   decoration: BoxDecoration(
//                     color: Colors.redAccent,
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Center(
//                     child: TextFormField(
//                       textAlign: TextAlign.center,
//                       decoration: const InputDecoration(
//                         labelText: "Chinese Character:",
//                         labelStyle:
//                             TextStyle(fontSize: 20, color: Colors.white),
//                         border: InputBorder.none,
//                       ),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return "Please enter a Chinese character.";
//                         }
//                         return null;
//                       },
//                       onSaved: (value) {
//                         _chineseCharacter = value!;
//                       },
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 24),
//                 // Back Card
//                 Container(
//                   height: 250,
//                   padding: EdgeInsets.all(50),
//                   decoration: BoxDecoration(
//                     color: Colors.blueAccent,
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Center(
//                     child: TextFormField(
//                       textAlign: TextAlign.center,
//                       decoration: const InputDecoration(
//                         labelText: "Pinyin:",
//                         labelStyle:
//                             TextStyle(fontSize: 20, color: Colors.white),
//                         border: InputBorder.none,
//                       ),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return "Please enter the pinyin.";
//                         }
//                         return null;
//                       },
//                       onSaved: (value) {
//                         _pinyin = value!;
//                       },
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 24),
//                 // Action Buttons
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     TextButton(
//                       onPressed: _resetForm,
//                       child:
//                           const Text('Reset', style: TextStyle(fontSize: 15)),
//                       style: TextButton.styleFrom(
//                         padding: EdgeInsets.symmetric(
//                             horizontal: 24,
//                             vertical: 16), // Increases button size
//                       ),
//                     ),
//                     const SizedBox(width: 16),
//                     ElevatedButton(
//                       onPressed: _saveItem,
//                       child:
//                           const Text("Create", style: TextStyle(fontSize: 15)),
//                       style: ElevatedButton.styleFrom(
//                         padding: EdgeInsets.symmetric(
//                             horizontal: 24,
//                             vertical: 16), // Increases button size
//                         minimumSize: Size(120, 48), // Makes button bigger
//                       ),
//                     ),
//                   ],
//                 ),

//                 const SizedBox(height: 24),
//                 // Image at bottom
//                 Container(
//                   height: 150,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Center(
//                     child: Image.asset(
//                       'assets/FlashCardProject/cards.png', // Replace with your image path
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:my_app/Flashcard-PersonalProject/model/word.dart';
import 'package:my_app/Flashcard-PersonalProject/model/word_category.dart';

class CardEditorScreen extends StatefulWidget {
  final String category;
  final Word? wordToEdit;

  CardEditorScreen({super.key, required this.category, this.wordToEdit});

  @override
  State<CardEditorScreen> createState() => _CardEditorScreenState();
}

class _CardEditorScreenState extends State<CardEditorScreen> {
  final CategoryManager categoryManager = CategoryManager();
  final _formKey = GlobalKey<FormState>();
  late String _chineseCharacter;
  late String _pinyin;
  late String _category;
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();

    // Initialize fields based on whether we're editing or creating
    _isEditing = widget.wordToEdit != null;
    _chineseCharacter = _isEditing ? widget.wordToEdit!.chineseCharacter : '';
    _pinyin = _isEditing ? widget.wordToEdit!.pinyin : '';
    _category = widget.category;
  }

  void _saveItem() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Update the word if editing, or create a new one
      final updatedWord = Word(
        chineseCharacter: _chineseCharacter,
        pinyin: _pinyin,
        category: _category,
      );

      Navigator.of(context).pop(updatedWord);
    }
  }

  void _resetForm() {
    _formKey.currentState!.reset();
    setState(() {
      _chineseCharacter = _isEditing ? widget.wordToEdit!.chineseCharacter : '';
      _pinyin = _isEditing ? widget.wordToEdit!.pinyin : '';
    });
  }

  @override
  Widget build(BuildContext context) {
    final categories = categoryManager.getAllCategories();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(_isEditing ? 'Edit Card' : 'Create Card'),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 16),
                // Front Card
                Container(
                  padding: const EdgeInsets.all(50),
                  height: 250,
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: TextFormField(
                      initialValue: _chineseCharacter,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                              fontSize: 20, 
                              color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      decoration: const InputDecoration(
                        labelText: "Chinese Character:",
                        labelStyle:
                            TextStyle(fontSize: 23, color: Colors.white),
                        border: InputBorder.none,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter a Chinese character.";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _chineseCharacter = value!;
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                // Back Card
                Container(
                  height: 250,
                  padding: const EdgeInsets.all(50),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 209, 7),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: TextFormField(
                      initialValue: _pinyin,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      decoration: const InputDecoration(
                        labelText: "Pinyin:",
                        labelStyle:
                            TextStyle(fontSize: 23, color: Colors.white),
                        border: InputBorder.none,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter the pinyin.";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _pinyin = value!;
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                // Action Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: _resetForm,
                      child:
                          const Text('Reset', style: TextStyle(fontSize: 15)),
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 16,
                        ), // Increases button size
                      ),
                    ),
                    const SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: _saveItem,
                      child: Text(
                        _isEditing ? "Update" : "Create",
                        style: const TextStyle(fontSize: 15),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 16,
                        ), // Increases button size
                        minimumSize: const Size(120, 48), // Makes button bigger
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                // Image at bottom
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/FlashCardProject/cards.png', // Replace with your image path
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

