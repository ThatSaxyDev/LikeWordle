import 'package:flutter/material.dart';
import 'package:like_wordle/widgets/wordle_letterbox.dart';

class WordleRow extends StatelessWidget {
  final int wordSize;
  final String word;
  final String correctWord;
  final bool attempted;
  const WordleRow({
    Key? key,
    required this.wordSize,
    required this.word,
    required this.correctWord,
    required this.attempted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<LetterBox> boxes = List.empty(growable: true);
    for (int j = 0; j < wordSize; j++) {
      var letter = '';
      if (word.length > j) {
        letter = word[j];
      }
      boxes.add(
        LetterBox(
          position: j,
          letter: letter,
          attempted: attempted,
          correctWord: correctWord,
        ),
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: boxes,
    );
  }
}
