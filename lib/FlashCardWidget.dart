
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'data/Add_FlashCard.dart';

class FlashcardWidget extends StatefulWidget {
  final Flashcard flashcard;
  final Function(bool) onAnswered;

  const FlashcardWidget({Key? key, required this.flashcard, required this.onAnswered}) : super(key: key);

  @override
  _FlashcardWidgetState createState() => _FlashcardWidgetState();
}

class _FlashcardWidgetState extends State<FlashcardWidget> {
  bool _showAnswer = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _showAnswer = !_showAnswer;
        });
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Question:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              Text(widget.flashcard.question),
              if (_showAnswer) ...[
                const SizedBox(height: 16.0),
                const Text(
                  'Answer:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                Text(widget.flashcard.answer),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    widget.onAnswered(widget.flashcard.isCorrect);
                  },
                  child: const Text('Correct'),
                ),
                ElevatedButton(
                  onPressed: () {
                    widget.onAnswered(!widget.flashcard.isCorrect);
                  },
                  child: const Text('Incorrect'),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
