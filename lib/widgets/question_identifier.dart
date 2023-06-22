import 'package:flutter/material.dart';

class QuestionIdentifier extends StatelessWidget {
  const QuestionIdentifier({
    super.key,
    required this.userAnswer,
    required this.correctAnswer,
    required this.questionIndex,
  });
  final String userAnswer;
  final String correctAnswer;
  final int questionIndex;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 30,
        height: 30,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: userAnswer == correctAnswer
                ? Color(0xff77BDF8)
                : Color(0xffFF6BFE),
            borderRadius: BorderRadius.circular(50)),
        child: Text(
          "${(questionIndex)}",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ));
  }
}
