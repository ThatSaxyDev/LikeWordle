import 'package:flutter/material.dart';
import 'package:like_wordle/widgets/wordle_grid.dart';
import 'package:like_wordle/widgets/wordle_keyboard.dart';
import 'package:like_wordle/widgets/wordle_title_bar.dart';

class WordlePage extends StatelessWidget {
  const WordlePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   //title: const Text('WORDLE'),
      //   backgroundColor: backgroundColor,
      // ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              WordleTitleBar(),
              WordleGrid(),
              WordleKeyboard(),
            ],
          ),
        ),
      ),
    );
  }
}
