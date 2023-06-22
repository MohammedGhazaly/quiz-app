import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/question_identifier.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem({
    super.key,
    required this.summaryData,
  });
  final Map<String, Object> summaryData;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionIdentifier(
            userAnswer: summaryData["user_answer"] as String,
            correctAnswer: summaryData["correct_answer"] as String,
            questionIndex: summaryData["question_index"] as int),
        const SizedBox(
          width: 12,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                summaryData["question"] as String,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                summaryData["user_answer"] as String,
                style: const TextStyle(color: Color(0xffFF6BFE)),
              ),
              Text(summaryData["correct_answer"] as String,
                  style: const TextStyle(color: Color(0xff77BDF8))),
              const SizedBox(
                height: 32,
              )
            ],
          ),
        )
      ],
    );
  }
}
