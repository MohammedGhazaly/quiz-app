import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions_data.dart';
import 'package:quiz_app/widgets/answer_button.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    super.key,
    required this.onSelectAnswer,
    required this.onRemoveAnswer,
  });
  final void Function(String answer) onSelectAnswer;
  final void Function(int index) onRemoveAnswer;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;
  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      // currentQuestionIndex += currentQuestionIndex;
      currentQuestionIndex++;
    });
  }

  void decrementAnswer(int index) {
    setState(() {
      // currentQuestionIndex += currentQuestionIndex;
      currentQuestionIndex--;
    });
    widget.onRemoveAnswer(currentQuestionIndex);
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.questionTitle,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: const Color.fromARGB(255, 218, 189, 248),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              textAlign: TextAlign.center,
              "Question no.${currentQuestionIndex + 1} out of ${questions.length}",
              style: GoogleFonts.lato(
                fontWeight: FontWeight.normal,
                fontSize: 12,
                color: const Color.fromARGB(255, 218, 189, 248),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            ...currentQuestion.getShuffledList().map((answer) {
              return AnswerButton(
                  questionAnswer: answer,
                  onPressedFunction: () {
                    answerQuestion(answer);
                  });
            }).toList(),
            currentQuestionIndex == 0
                ? Container()
                : TextButton.icon(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 14),
                    ),
                    onPressed: () {
                      decrementAnswer(currentQuestionIndex);
                    },
                    label: Text(
                      "Re-answer question.",
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                        color: const Color.fromARGB(255, 218, 189, 248),
                      ),
                    ),
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 18,
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
