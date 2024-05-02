import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Add_FlashCard.dart';
import 'FlashCardWidget.dart';

class FlashcardScreen extends StatefulWidget {
  @override
  _FlashcardScreenState createState() => _FlashcardScreenState();
}

class _FlashcardScreenState extends State<FlashcardScreen> {
  List<Flashcard> flashcards = [
    Flashcard(question: 'What is the capital of France?', answer: 'Paris'),
    Flashcard(question: 'What is the largest planet in our solar system?', answer: 'Jupiter'),
    Flashcard(question: 'Who wrote "Romeo and Juliet"?', answer: 'William Shakespeare'),
    Flashcard(question: 'What is the powerhouse of the cell?', answer: 'Mitochondria'),
    Flashcard(question: 'Who painted the Mona Lisa?', answer: 'Leonardo da Vinci'),
    Flashcard(question: 'What is the chemical symbol for water?', answer: 'H2O'),
    Flashcard(question: 'Who invented the light bulb?', answer: 'Thomas Edison'),
    Flashcard(question: 'What is the tallest mammal?', answer: 'Giraffe'),
    Flashcard(question: 'Which planet is known as the Red Planet?', answer: 'Mars'),
    Flashcard(question: 'What is the chemical symbol for gold?', answer: 'Au'),
  ];

  int correctAnswers = 0;
  int totalQuestions = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flashcards'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          Text('Score: $correctAnswers / $totalQuestions'),
          Expanded(
            child: ListView.builder(
              itemCount: flashcards.length,
              itemBuilder: (context, index) {
                return FlashcardWidget(
                  flashcard: flashcards[index],
                  onAnswered: (isCorrect) {
                    setState(() {
                      totalQuestions++;
                      if (isCorrect) {
                        correctAnswers++;
                      }
                    });
                  },
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                correctAnswers = 0;
                totalQuestions = 0;
              });
            },
            child: const Text('Start Quiz'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _navigateToAddFlashcardScreen(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _navigateToAddFlashcardScreen(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddFlashcardScreen()),
    );
    if (result != null && result is Flashcard) {
      setState(() {
        flashcards.add(result);
      });
    }
  }
}
