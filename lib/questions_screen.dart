import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_flutter/answer_button.dart';
import 'package:quiz_flutter/questions.dart';
import 'package:quiz_flutter/quiz_question.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({required this.onSelectedAnswer, super.key});

  final void Function(String answer) onSelectedAnswer;

  @override
  State<StatefulWidget> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int questionNumber = 0;

  void nextQuestion(String answer) {
    widget.onSelectedAnswer(answer);
    setState(() {
      questionNumber++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[questionNumber];

    return Container(
      padding: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Material(
              color: Colors.transparent,
              child: Text(
                currentQuestion.questionString,
                style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              )),
          ...currentQuestion
              .shuffledAnswersList()
              .map((item) => AnswerButton(item, () {
                    nextQuestion(item);
                  }))
        ],
      ),
    );
  }
}
