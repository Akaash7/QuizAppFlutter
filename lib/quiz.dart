import 'package:flutter/material.dart';
import 'package:quiz_flutter/questions.dart';
import 'package:quiz_flutter/questions_screen.dart';
import 'package:quiz_flutter/results_screen.dart';
import 'package:quiz_flutter/splash_screen.dart';

class Quiz extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  Widget? activeScreen;

  @override
  void initState() {
    super.initState();
    activeScreen = SplashScreen(navigateToQuestions);
  }

  void chooseAnswers(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = ResultsScreen(selectedAnswers, resetQuiz);
      });
    }
  }

  void navigateToQuestions() {
    setState(() {
      activeScreen = QuestionsScreen(onSelectedAnswer: chooseAnswers);
    });
  }

  void resetQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = SplashScreen(navigateToQuestions);
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
        home: Container(color: Colors.deepPurple, child: activeScreen));
  }
}
