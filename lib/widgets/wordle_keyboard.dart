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
            for (var i in 'QWERTYUIOP'.split('')) WordleKey(i),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var i in 'ASDFGHJKL'.split('')) WordleKey(i),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var i in '_ZXCVBNM>'.split('')) WordleKey(i),
          ],
        ),
      ],
    );
  }
}
