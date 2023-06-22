import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions_data.dart';
import 'package:quiz_app/widgets/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.onTapFunction,
    required this.choosenAnswers,
  });
  final void Function() onTapFunction;
  final List<String> choosenAnswers;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];
    for (int i = 0; i < choosenAnswers.length; i++) {
      summary.add({
        "question_index": i + 1,
        "question": questions[i].questionTitle,
        "correct_answer": questions[i].possibleAnswers[0],
        "user_answer": choosenAnswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    // final summaryData = getSummaryData(); // دي القديمة
    final int numOfTotalQuestions = questions.length;
    final numOfCorrectQuestions = summaryData.where((element) {
      return element["correct_answer"] == element["user_answer"];
    });
    // دي طريقة
    // for (int i = 0; i < summaryData.length; i++) {
    //   if (summaryData[i]["correct_answer"] == summaryData[i]["user_answer"]) {
    //     numOfCorrectQuestions++;
    //   }
    // }

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You answered ${numOfCorrectQuestions.length} out of $numOfTotalQuestions questions correctly!",
              style: const TextStyle(
                color: Color.fromARGB(255, 244, 218, 255),
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData: summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
                onPressed: onTapFunction,
                style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    foregroundColor: Colors.white,
                    backgroundColor: const Color.fromARGB(255, 33, 1, 95)),
                icon: const Icon(Icons.refresh, size: 28),
                label: const Text(
                  "Restart quiz",
                  style: TextStyle(fontSize: 18),
                ))
          ],
        ),
      ),
    );
  }
}
