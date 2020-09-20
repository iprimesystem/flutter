import 'package:flutter/material.dart';
import 'package:quiz_app/question.dart';

import 'answer.dart';

class Quiz extends StatelessWidget {
  final int questionIndex;
  final List<Map<String, Object>> questions;
  final Function answerQuestion;
  Quiz({this.questionIndex, this.questions, this.answerQuestion});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(questionText: questions[this.questionIndex]['questionText']),
        ...(questions[questionIndex]['answers'] as List<Map>).map((answer) {
          return Answer(
              selectAnswerHandler: answerQuestion, answer: answer);
        }).toList()
      ],
    );
  }
}
