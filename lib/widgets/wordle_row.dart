import 'package:flutter/material.dart';
import 'package:like_wordle/widgets/wordle_letterbox.dart';

const wordSize = 5;

class WordleRow extends StatelessWidget {
  const WordleRow({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final List<LetterBox> boxes = List.empty(growable: true);
      for (int j = 0; j < wordSize; j++) {
        boxes.add(
          LetterBox(),
        );
      }

    return Row(
      mainAxisSize: MainAxisSize.min,
          children: boxes,
    );
  }
}