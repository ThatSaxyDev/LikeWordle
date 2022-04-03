import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:like_wordle/providers/game_state_provider.dart';
import 'package:like_wordle/providers/settings_provider.dart';
import 'package:like_wordle/widgets/wordle_row.dart';

class WordleGrid extends ConsumerWidget {
  const WordleGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameSettings = ref.watch(gameSettingsProvider);
    final gameState = ref.watch(gameStateProvider);

    //final gameState = ref.watch(gameStateProvider);

    //print('new correct word = ${gameState.correctWord}');

    final wordSize = gameSettings.wordSize;

    final List<WordleRow> rows = List.empty(growable: true);

    for (int i = 0; i < gameSettings.attempts; i++) {
      var word = '';
      if (gameState.attempts.length > i) {
        word = gameState.attempts[i];
      }
      var attempted = false;
      if (gameState.attempted > i) {
        attempted = true;
      }
      rows.add(
        WordleRow(
          wordSize: wordSize,
          word: word,
          correctWord: gameState.correctWord, 
          attempted: attempted,
        ),
      );
    }

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: rows,
      ),
    );
  }
}
