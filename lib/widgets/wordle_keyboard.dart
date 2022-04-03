import 'package:flutter/material.dart';
import 'package:like_wordle/widgets/wordle_key.dart';

class WordleKeyboard extends StatelessWidget {
  const WordleKeyboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var i in 'qwertyuiop'.split('')) WordleKey(i),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var i in 'asdfghjkl'.split('')) WordleKey(i),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var i in '_zxcvbnm>'.split('')) WordleKey(i),
          ],
        ),
      ],
    );
  }
}
