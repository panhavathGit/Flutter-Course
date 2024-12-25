// import 'package:flutter/material.dart';
// import 'package:my_app/Flashcard-PersonalProject/model/word.dart';

// class FlipModeScreen extends StatefulWidget {
//   final List<Word> categorizedWords; // List of Word objects

//   const FlipModeScreen({super.key, required this.categorizedWords});

//   @override
//   State<FlipModeScreen> createState() => _FlipModeScreenState();
// }

// class _FlipModeScreenState extends State<FlipModeScreen>
//     with SingleTickerProviderStateMixin {
//   int _currentIndex = 0; // Track the current card index
//   late AnimationController _controller;
//   late Animation<double> _flipAnimation;

//   bool _isFlipped = false; // Track card flip state

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 600),
//     );

//     _flipAnimation = Tween<double>(begin: 0, end: 1).animate(
//       CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   void _flipCard() {
//     if (_isFlipped) {
//       _controller.reverse();
//     } else {
//       _controller.forward();
//     }
//     setState(() {
//       _isFlipped = !_isFlipped;
//     });
//   }

//   void _nextCard() {
//     setState(() {
//       if (_currentIndex < widget.categorizedWords.length - 1) {
//         _currentIndex++;
//         _isFlipped = false; // Reset flip state
//         _controller.reset(); // Reset animation
//       }
//     });
//   }

//   void _previousCard() {
//     setState(() {
//       if (_currentIndex > 0) {
//         _currentIndex--;
//         _isFlipped = false; // Reset flip state
//         _controller.reset(); // Reset animation
//       }
//     });
//   }

//   double _getProgress() {
//     return (_currentIndex + 1) / widget.categorizedWords.length;
//   }

//   @override
//   Widget build(BuildContext context) {
//     final currentWord = widget.categorizedWords[_currentIndex];

//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.of(context).pop(); // Navigate back
//           },
//         ),
//         title: const Text('Card Flip', style: TextStyle(color: Colors.black)),
//         centerTitle: false,
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         iconTheme: const IconThemeData(color: Colors.black),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             // Category Name
//             Text(
//               currentWord.category,
//               style: const TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//                 color: Color.fromRGBO(221, 37, 23, 1)
//               ),
//             ),
//             const SizedBox(height: 24),
//             // Card with Flip Animation
//             GestureDetector(
//               onTap: _flipCard,
//               child: AnimatedBuilder(
//                 animation: _flipAnimation,
//                 builder: (context, child) {
//                   final angle = _flipAnimation.value * 3.1415926535897932;
//                   final isBackVisible = angle > 3.1415926535897932 / 2;

//                   return Transform(
//                     alignment: Alignment.center,
//                     transform: Matrix4.identity()
//                       ..setEntry(3, 2, 0.001)
//                       ..rotateY(angle),
//                     child: isBackVisible
//                         ? Container(
//                             key: const ValueKey('Pinyin'),
//                             height: 200,
//                             width: double.infinity,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(20),
//                               color: const Color.fromARGB(255, 250, 40, 40),
//                             ),
//                             child: Center(
//                               child: Transform(
//                                 alignment: Alignment.center,
//                                 transform: Matrix4.identity()
//                                   ..rotateY(3.1415926535897932),
//                                 child: Text(
//                                   currentWord.pinyin,
//                                   style: const TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 32,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           )
//                         : Container(
//                             key: const ValueKey('ChineseCharacter'),
//                             height: 200,
//                             width: double.infinity,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(20),
//                               color: Color.fromARGB(255, 8, 89, 219)
//                             ),
//                             child: Center(
//                               child: Text(
//                                 currentWord.chineseCharacter,
//                                 style: const TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 32,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                           ),
//                   );
//                 },
//               ),
//             ),
//             const SizedBox(height: 24),
//             // Progress Indicator
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'Card ${_currentIndex + 1} of ${widget.categorizedWords.length}',
//                   style: const TextStyle(fontSize: 16, color: Colors.black87),
//                 ),
//                 Text(
//                   '${(_getProgress() * 100).toStringAsFixed(1)}%',
//                   style: const TextStyle(fontSize: 16, color: Colors.black87),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 8),
//             LinearProgressIndicator(
//               value: _getProgress(),
//               backgroundColor: Colors.grey[300],
//               color: Colors.red,
//               minHeight: 6,
//             ),
//             const SizedBox(height: 24),
//             // Navigation Arrows
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 IconButton(
//                   icon: const Icon(Icons.arrow_left),
//                   onPressed: _previousCard,
//                   color: _currentIndex > 0 ? Colors.black : Colors.grey,
//                 ),
//                 const SizedBox(width: 32),
//                 IconButton(
//                   icon: const Icon(Icons.arrow_right),
//                   onPressed: _nextCard,
//                   color: _currentIndex < widget.categorizedWords.length - 1
//                       ? Colors.black
//                       : Colors.grey,
//                 ),
//               ],
//             ),
//             const SizedBox(height: 32),
//             // Finish Button
//             if (_currentIndex == widget.categorizedWords.length - 1)
//               SizedBox(
//                 width: double.infinity,
//                 height: 48,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     showDialog(
//                       context: context,
//                       builder: (context) => AlertDialog(
//                         title: const Text('Congratulations!'),
//                         content:
//                             const Text('You have completed all the cards!'),
//                         actions: [
//                           TextButton(
//                               onPressed: () {
//                                 Navigator.of(context).pop();
//                                 Navigator.of(context).pop();
//                               },
//                               child: const Text("OK")),
//                         ],
//                       ),
//                     );
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.green,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                   ),
//                   child: const Text(
//                     'Finish',
//                     style: TextStyle(color: Colors.white, fontSize: 16),
//                   ),
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:my_app/Flashcard-PersonalProject/model/word.dart';

class FlipModeScreen extends StatefulWidget {
  final List<Word> categorizedWords; // List of Word objects

  const FlipModeScreen({super.key, required this.categorizedWords});

  @override
  State<FlipModeScreen> createState() => _FlipModeScreenState();
}

class _FlipModeScreenState extends State<FlipModeScreen>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0; // Track the current card index
  late AnimationController _controller;
  late Animation<double> _flipAnimation;

  bool _isFlipped = false; // Track card flip state

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _flipAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _flipCard() {
    if (_isFlipped) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
    setState(() {
      _isFlipped = !_isFlipped;
    });
  }

  void _nextCard() {
    setState(() {
      if (_currentIndex < widget.categorizedWords.length - 1) {
        _currentIndex++;
        _isFlipped = false; // Reset flip state
        _controller.reset(); // Reset animation
      }
    });
  }

  void _previousCard() {
    setState(() {
      if (_currentIndex > 0) {
        _currentIndex--;
        _isFlipped = false; // Reset flip state
        _controller.reset(); // Reset animation
      }
    });
  }

  double _getProgress() {
    return (_currentIndex + 1) / widget.categorizedWords.length;
  }

  @override
  Widget build(BuildContext context) {
    final currentWord = widget.categorizedWords[_currentIndex];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back
          },
        ),
        title: const Text('Card Flip', style: TextStyle(color: Colors.white)),
        backgroundColor: Color.fromRGBO(221, 37, 23, 1),
        centerTitle: false,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Category Name
            Text(
              currentWord.category,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(221, 37, 23, 1)
              ),
            ),
            const SizedBox(height: 24),
            // Card with Flip Animation
            GestureDetector(
              onTap: _flipCard,
              child: AnimatedBuilder(
                animation: _flipAnimation,
                builder: (context, child) {
                  final angle = _flipAnimation.value * 3.1415926535897932;
                  final isBackVisible = angle > 3.1415926535897932 / 2;

                  return Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateY(angle),
                    child: isBackVisible
                        ? Container(
                            key: const ValueKey('Pinyin'),
                            height: 200,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromARGB(255, 250, 40, 40),
                            ),
                            child: Center(
                              child: Transform(
                                alignment: Alignment.center,
                                transform: Matrix4.identity()
                                  ..rotateY(3.1415926535897932),
                                child: Text(
                                  currentWord.pinyin,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          )
                        : Container(
                            key: const ValueKey('ChineseCharacter'),
                            height: 200,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromARGB(255, 8, 89, 219)
                            ),
                            child: Center(
                              child: Text(
                                currentWord.chineseCharacter,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
            // Progress Indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Card ${_currentIndex + 1} of ${widget.categorizedWords.length}',
                  style: const TextStyle(fontSize: 16, color: Colors.black87),
                ),
              ],
            ),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: _getProgress(),
              backgroundColor: Colors.grey[300],
              color: Colors.red,
              minHeight: 6,
            ),
            const SizedBox(height: 24),
            // Navigation Arrows
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_left),
                  onPressed: _previousCard,
                  color: _currentIndex > 0 ? Colors.black : Colors.grey,
                ),
                const SizedBox(width: 32),
                IconButton(
                  icon: const Icon(Icons.arrow_right),
                  onPressed: _nextCard,
                  color: _currentIndex < widget.categorizedWords.length - 1
                      ? Colors.black
                      : Colors.grey,
                ),
              ],
            ),
            const SizedBox(height: 32),
            // Finish Button
            if (_currentIndex == widget.categorizedWords.length - 1)
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Congratulations!'),
                        content:
                            const Text('You have completed all the cards!'),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                Navigator.of(context).pop();
                              },
                              child: const Text("OK")),
                        ],
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 227, 88),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Finish',
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 16),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}


