import 'package:flutter/material.dart';
import 'package:like_wordle/widgets/wordle_row.dart';

const rows = 6;

class WordleGrid extends StatelessWidget {
  const WordleGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Column(
        children: [
          WordleRow(),
          WordleRow(),
          WordleRow(),
          WordleRow(),
          WordleRow(),
          WordleRow(),
        ],
      ),
    );
  }
}
