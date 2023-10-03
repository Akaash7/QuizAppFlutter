import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColoredSerialNumber extends StatelessWidget {
  const ColoredSerialNumber(this.isCorrect, this.questionNumber, {super.key});

  final bool isCorrect;
  final int questionNumber;

  @override
  Widget build(context) {
    return Container(
        height: 30,
        width: 30,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: isCorrect ? Colors.green : Colors.red,
            borderRadius: BorderRadius.circular(100)),
        child: Text(questionNumber.toString(),
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                inherit: false)));
  }
}
