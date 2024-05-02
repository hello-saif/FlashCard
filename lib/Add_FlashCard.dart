import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddFlashcardScreen extends StatefulWidget {
  @override
  _AddFlashcardScreenState createState() => _AddFlashcardScreenState();
}

class _AddFlashcardScreenState extends State<AddFlashcardScreen> {
  TextEditingController questionController = TextEditingController();
  TextEditingController answerController = TextEditingController();
  bool isCorrect = true; // Default is correct

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Flashcard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: questionController,
              decoration: const InputDecoration(labelText: 'Question'),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: answerController,
              decoration: const InputDecoration(labelText: 'Answer'),
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                const Text('Is Correct: '),
                Checkbox(
                  value: isCorrect,
                  onChanged: (value) {
                    setState(() {
                      isCorrect = value ?? false;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (questionController.text.isNotEmpty &&
                    answerController.text.isNotEmpty) {
                  Navigator.pop(
                    context,
                    Flashcard(
                      question: questionController.text,
                      answer: answerController.text,
                      isCorrect: isCorrect,
                    ),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Error'),
                      content: const Text('Please fill out both fields.'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                }
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

class Flashcard {
  final String question;
  final String answer;
  final bool isCorrect;

  Flashcard({required this.question, required this.answer, required this.isCorrect});
}
