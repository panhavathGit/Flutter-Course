import 'package:flutter/material.dart';

List<String> images = [
  "assets/W4-S3-gallery/bird.jpg",
  "assets/W4-S3-gallery/bird2.jpg",
  "assets/W4-S3-gallery/insect.jpg",
  "assets/W4-S3-gallery/girl.jpg",
  "assets/W4-S3-gallery/man.jpg",
];
class ImageGallery extends StatefulWidget {
  @override
  _ImageGalleryState createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<ImageGallery> {
  int currentIndex = 0;

  // Function to go to the previous image, looping back if at the first image.
  void showPreviousImage() {
    setState(() {
      currentIndex = (currentIndex - 1 + images.length) % images.length;
    });
  }

  // Function to go to the next image, looping to the start if at the last image.
  void showNextImage() {
    setState(() {
      currentIndex = (currentIndex + 1) % images.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Text('Image Viewer'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_before),
            tooltip: 'Go to the previous image',
            onPressed: showPreviousImage,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
            child: IconButton(
              icon: const Icon(Icons.navigate_next),
              tooltip: 'Go to the next image',
              onPressed: showNextImage,
            ),
          ),
        ],
      ),
      body: Center(
        child: Image.asset(images[currentIndex])
      ),
    );
  }
}
void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false, // Why this line ? Can you explain it ?
      home: ImageGallery()
));
