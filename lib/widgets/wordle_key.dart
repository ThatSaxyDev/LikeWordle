import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:like_wordle/providers/game_state_provider.dart';

class WordleKey extends ConsumerWidget {
  final String letter;
  const WordleKey(this.letter, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget keyCap;
    double width = 50;
    if (letter == '_') {
      keyCap = Icon(
        Icons.keyboard_return,
        size: 20,
      );
    } else if (letter == '>') {
      keyCap = Icon(
        Icons.backspace_outlined,
        size: 20,
      );
    } else {
      width = 34;
      keyCap = Text(
        letter,
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      );
    }

    return Container(
      width: width,
      height: 60,
      alignment: Alignment.center,
      //padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Color.fromRGBO(105, 105, 105, 1),
      ),
      child: InkWell(
        onTap: () {
          ref.read(gameStateProvider.notifier).updateCurrentAttempt(letter);
        },
        child: keyCap,
      ),
    );
  }
}
