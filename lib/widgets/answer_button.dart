import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(
      {super.key,
      required this.questionAnswer,
      required this.onPressedFunction});
  final String questionAnswer;
  final void Function() onPressedFunction;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              foregroundColor: Colors.white,
              backgroundColor: const Color.fromARGB(255, 33, 1, 95),
            ),
            onPressed: onPressedFunction,
            child: Text(
              questionAnswer,
              style: const TextStyle(fontSize: 14),
              textAlign: TextAlign.center,
            )),
        const SizedBox(
          height: 12,
        )
      ],
    );
  }
}
