import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen(this.navigateToQuestions, {super.key});

  final void Function() navigateToQuestions;

  @override
  Widget build(context) {
    return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            height: 300,
            width: 300,
            color: const Color.fromARGB(10, 255, 255, 255),
          ),
          Container(height: 40),
          const Text("Learn Flutter the fun way!",
              style: TextStyle(
                  inherit: false, fontSize: 24, color: Colors.white)),
          Container(height: 20),
          OutlinedButton.icon(
              icon: const Icon(Icons.arrow_forward_ios_sharp),
              onPressed: navigateToQuestions,
              label: const Text("Start Quiz"))
        ]);
  }

}