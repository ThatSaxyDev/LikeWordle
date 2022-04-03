import 'package:flutter/material.dart';
import 'package:like_wordle/widgets/colors.dart';

class LetterBox extends StatelessWidget {
  final int position;
  final String letter;
  final String correctWord;
  final bool attempted;

  const LetterBox({
    Key? key,
    required this.position,
    required this.letter,
    required this.correctWord,
    required this.attempted,
  }) : super(key: key);

  Color? getBgColor() {
    if (!attempted) return null;
    print('$correctWord $letter $position ${correctWord.contains(letter)}');
    if (!correctWord.contains(letter)) return Colors.grey;
    if (correctWord.indexOf(letter) == position) return correctPositionColor;
    return wrongPositionColour;
  }

  BoxBorder? getBorder() {
    if (!attempted)
      return Border.all(
        color: Colors.grey,
        width: 2,
      );
    return Border.all(color: Colors.transparent, width: 2);
  }

  Color? getTextColor() {
    if (!attempted) return Colors.white;
    return Colors.black87;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: getBorder(),
        color: getBgColor(),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        letter.toUpperCase(),
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: getTextColor(),
        ),
      ),
    );
  }
}
