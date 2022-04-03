import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:like_wordle/data/word_data.dart';
import 'package:like_wordle/providers/settings_provider.dart';

/*
A: used
B: invalid
C: 
D
*/

class GameState {
  final GameSettings settings;
  final List<String> validWords;
  final String correctWord;
  final List<String> attempts;
  final int attempted;

  const GameState({
    required this.correctWord,
    required this.validWords,
    required this.settings,
    required this.attempts,
    required this.attempted,
  });

  GameState clone({
    List<String>? validWords,
    String? correctWord,
    List<String>? attempts,
    int? attempted,
  }) {
    return GameState(
      correctWord: correctWord ?? this.correctWord,
      validWords: validWords ?? this.validWords,
      settings: this.settings,
      attempts: attempts ?? this.attempts,
      attempted: attempted ?? this.attempted,
    );
  }
}

class GameStateNotifier extends StateNotifier<GameState> {
  final Random rng = Random();
  GameStateNotifier(GameSettings settings)
      : super(
          GameState(
            validWords: [],
            correctWord: 'begin',
            settings: settings,
            attempts: [],
            attempted: 0,
          ),
        );

  Future<void> updateWords() async {
    final words = await loadWords(state.settings.wordSize);
    state = state.clone(
      validWords: words,
      correctWord: words[rng.nextInt(words.length - 1)],
    );
  }

  void newCorrectWord() {
    state = state.clone(
      correctWord: state.validWords[rng.nextInt(state.validWords.length - 1)],
    );
  }

  void updateCurrentAttempt(String key) {
    final attempts = state.attempts;

    if (attempts.length <= state.attempted) {
      attempts.add('');
    }
    var currentAttempt = attempts[state.attempted];

    if (key == '_') {
      //handle enter press
      if (currentAttempt.length < state.settings.wordSize) {
        print('incomplete attempted word');
        return;
      }

      if (!state.validWords.contains(currentAttempt)) {
        print('not in valid words list');
        return;
      }

      state = state.clone(
        attempted: state.attempted + 1,
      );
    } else if (key == '>') {
      //handle backspace
      if (currentAttempt.isEmpty) {
        print('cannot backspace on empty string');
        return;
      }
      currentAttempt = currentAttempt.substring(0, currentAttempt.length - 1);
      attempts[state.attempted] = currentAttempt;
      state = state.clone(
        attempts: attempts,
      );
    } else {
      if (currentAttempt.length >= state.settings.wordSize) {
        print('trying to type word longer than current word length');
        return;
      }

      currentAttempt += key;
      attempts[state.attempted] = currentAttempt;
      state = state.clone(
        attempts: attempts,
      );
    }
  }
}

final gameStateProvider = StateNotifierProvider<GameStateNotifier, GameState>(
  (ref) {
    final settings = ref.watch(gameSettingsProvider);
    final gameStateNotifier = GameStateNotifier(settings);
    gameStateNotifier.updateWords();
    return gameStateNotifier;
  },
);
