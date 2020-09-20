import 'package:flutter/material.dart';
import 'package:quiz_app/models/QuestionAnswer.dart';

class Result extends StatelessWidget {
  final Function answerQuestionHandler;
  final List<WrongAnswer> wrongAnswers;
  final int outOf;
  final int got;
  Result({this.wrongAnswers, this.outOf, this.got, this.answerQuestionHandler});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30),
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Text('You have got ' +
              this.got.toString() +
              ' out of ' +
              this.outOf.toString()),
          FlatButton(
            onPressed: () => this.answerQuestionHandler(null, true),
            child: Text('Start again' , style: TextStyle(color: Colors.blueAccent),),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: wrongAnswers.length,
                itemBuilder: (context, index) {
                  return new Card(
                    margin: EdgeInsets.only(top: 30),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Question : ' +
                              wrongAnswers.elementAt(index).questionText),
                          Text(
                            'Wrong answer : ' +
                                wrongAnswers.elementAt(index).wrongAnswer,
                            style: TextStyle(color: Colors.red),
                          ),
                          Text(
                            'Correct answer: ' +
                                wrongAnswers.elementAt(index).correctAnswer,
                            style: TextStyle(color: Colors.green),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
