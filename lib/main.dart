import 'package:flutter/material.dart';

import 'Add_FlashCard.dart';
import 'FlashCardScreen.dart';

void main() {
  runApp(FlashcardApp());
}

class FlashcardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flashcard Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FlashcardScreen(),
    );
  }
}
