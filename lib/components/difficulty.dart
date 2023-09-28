import 'package:flutter/material.dart';

class Difficulty extends StatelessWidget {
  const Difficulty({
    super.key,
    required this.difficultyLevel,
  });
  final int difficultyLevel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          size: 15,
          color: difficultyLevel >= 1 ? Colors.blue : Colors.blue,
        ),
        Icon(
          Icons.star,
          size: 15,
          color: difficultyLevel >= 2 ? Colors.blue : Colors.blue[100],
        ),
        Icon(
          Icons.star,
          size: 15,
          color: difficultyLevel >= 3 ? Colors.blue : Colors.blue[100],
        ),
        Icon(
          Icons.star,
          size: 15,
          color: difficultyLevel >= 4 ? Colors.blue : Colors.blue[100],
        ),
        Icon(
          Icons.star,
          size: 15,
          color: difficultyLevel >= 5 ? Colors.blue : Colors.blue[100],
        ),
      ],
    );
  }
}
