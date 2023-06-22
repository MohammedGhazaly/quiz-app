import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/summary_item.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summaryData});
  final List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ...summaryData.map((data) {
              return SummaryItem(
                summaryData: data,
              );
            })
          ],
        ),
      ),
    );
  }
}
