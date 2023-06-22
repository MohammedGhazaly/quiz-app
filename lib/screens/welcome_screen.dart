import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key, required this.onPressedFunction});
  final void Function() onPressedFunction;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset(
          "assets/images/quiz-logo.png",
          width: 300,
          color: Colors.white.withOpacity(0.5),
        ),
        const SizedBox(
          height: 72,
        ),
        const Text(
          "Learn flutter the fun way!",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        const SizedBox(
          height: 12,
        ),
        OutlinedButton.icon(
            onPressed: onPressedFunction,
            icon: const Icon(
              Icons.arrow_right_alt,
              size: 28,
              color: Colors.white,
            ),
            label: const Text(
              "Start quiz",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ))
      ]),
    );
  }
}
