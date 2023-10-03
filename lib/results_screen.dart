import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_flutter/colored_serial_number.dart';
import 'package:quiz_flutter/questions.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(this.selectedAnswers, this.onPressed, {super.key});

  final void Function() onPressed;
  final List<String> selectedAnswers;

  List<Map<String, Object>> getSummary() {
    final List<Map<String, Object>> summary = [];
    for (int i = 0; i < selectedAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].questionString,
        'correct_answer': questions[i].answersList.first,
        'chosen_answer': selectedAnswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(context) {
    final summary = getSummary();
    final totalNoQuestions = summary.length;
    final correctNoQuestions = summary
        .where(
            (element) => element['correct_answer'] == element['chosen_answer'])
        .length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You answered $correctNoQuestions out of $totalNoQuestions Questions correctly!",
              style: const TextStyle(inherit: false),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text("List of answers and questions...",
                style: TextStyle(inherit: false)),
            const SizedBox(
              height: 30,
            ),
            QuestionAnswers(summary),
            TextButton(
              onPressed: onPressed,
              child: const Text(
                "Restart Quiz!",
              ),
            )
          ],
        ),
      ),
    );
  }
}

class QuestionAnswers extends StatelessWidget {
  const QuestionAnswers(this.summary, {super.key});

  final List<Map<String, Object>> summary;

  @override
  Widget build(context) {
    return SizedBox(
        height: 300,
        child: SingleChildScrollView(
            child: Column(
          children: [
            ...summary.map((item) {
              return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ColoredSerialNumber(
                        item['correct_answer'] == item['chosen_answer'],
                        item['question_index'] as int),
                    const SizedBox(width: 10),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['question'] as String,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              inherit: false),
                        ),
                        const SizedBox(height: 5),
                        Text(item['chosen_answer'] as String,
                            style: TextStyle(
                                color: item['correct_answer'] ==
                                        item['chosen_answer']
                                    ? Colors.green
                                    : Colors.red,
                                inherit: false)),
                        Text(
                          item['correct_answer'] as String,
                          style: const TextStyle(fontSize: 14, inherit: false),
                        ),
                      ],
                    ))
                  ]);
            })
          ],
        )));
  }
}
