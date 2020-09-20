import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectAnswerHandler;
  final Map answer;
  Answer({this.selectAnswerHandler, this.answer});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Colors.blueAccent,
        onPressed: () => this.selectAnswerHandler(answer, false),
        child: Text(
          this.answer['answerText'],
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
