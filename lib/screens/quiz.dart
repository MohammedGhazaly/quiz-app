import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions_data.dart';
import 'package:quiz_app/screens/questions_screen.dart';
import 'package:quiz_app/screens/results_screen.dart';
import 'package:quiz_app/screens/welcome_screen.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  List<String> selectedAnswers = [];
  var activeScreen = "welcome-screen";
  void switchScreen() {
    setState(() {
      activeScreen = "questions-screen";
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    // To stop when we exausted all the answers
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = "results-screen";
      });
    }
    print(selectedAnswers);
  }

  void removeAnswer(int index) {
    selectedAnswers.removeAt(index);
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = "questions-screen";
    });
  }

  @override
  Widget build(BuildContext context) {
    final Widget screenWidget;
    if (activeScreen == "welcome-screen") {
      screenWidget = WelcomeScreen(
        onPressedFunction: switchScreen,
      );
    } else if (activeScreen == "questions-screen") {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
        onRemoveAnswer: removeAnswer,
      );
    } else {
      screenWidget = ResultsScreen(
        choosenAnswers: selectedAnswers,
        onTapFunction: restartQuiz,
      );
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 78, 13, 151),
                  Color.fromARGB(255, 107, 15, 168)
                ]),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
