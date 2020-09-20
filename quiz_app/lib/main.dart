import 'package:flutter/material.dart';
import 'package:quiz_app/quiz.dart';
import 'package:quiz_app/result.dart';

import 'models/QuestionAnswer.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return QuizAppState();
  }
}

class QuizAppState extends State<QuizApp> {
  var _questionIndex = 0;
  var _totalScore = 0;
  List<WrongAnswer> _wrongAnswersGiven = new List<WrongAnswer>();

  final _questions = const [
    {
      'questionText':
          'The difference between the place value and face value of 8 in 658742 is',
      'answers': [
        {'id': 1, 'answerText': '0', 'isCorrect': false},
        {'id': 2, 'answerText': '42', 'isCorrect': false},
        {'id': 3, 'answerText': '7992', 'isCorrect': true},
        {'id': 4, 'answerText': '693', 'isCorrect': false},
      ]
    },
    {
      'questionText':
          'The difference between the place values of 6 and 3 in 256839 is',
      'answers': [
        {'id': 1, 'answerText': '3', 'isCorrect': false},
        {'id': 2, 'answerText': '9', 'isCorrect': false},
        {'id': 3, 'answerText': '52', 'isCorrect': false},
        {'id': 4, 'answerText': '5970', 'isCorrect': true},
      ],
    },
    {
      'questionText':
          'The difference of the smallest three digit number and the largest two digit number is',
      'answers': [
        {'id': 1, 'answerText': '100', 'isCorrect': false},
        {'id': 2, 'answerText': '1', 'isCorrect': true},
        {'id': 3, 'answerText': '10', 'isCorrect': false},
        {'id': 4, 'answerText': '99', 'isCorrect': false},
      ],
    },
    {
      'questionText':
          'The largest three digit number formed by the digits 8, 5, 9 is',
      'answers': [
        {'id': 1, 'answerText': '859', 'isCorrect': false},
        {'id': 2, 'answerText': '985', 'isCorrect': true},
        {'id': 3, 'answerText': '958', 'isCorrect': false},
        {'id': 4, 'answerText': '589', 'isCorrect': false},
      ],
    },
    {
      'questionText':
          'The smallest three digit number having three distinct digits is',
      'answers': [
        {'id': 1, 'answerText': '123', 'isCorrect': false},
        {'id': 2, 'answerText': '101', 'isCorrect': false},
        {'id': 3, 'answerText': '102', 'isCorrect': true},
        {'id': 4, 'answerText': '201', 'isCorrect': false},
      ],
    },
    {
      'questionText':
          'The largest three digit number having distinct digits is',
      'answers': [
        {'id': 1, 'answerText': '987', 'isCorrect': true},
        {'id': 2, 'answerText': '789', 'isCorrect': false},
        {'id': 3, 'answerText': '999', 'isCorrect': false},
        {'id': 4, 'answerText': '900', 'isCorrect': false},
      ],
    }
  ];

  void _answerQuestion(Map answer, bool isReset) {
    setState(() {
      if (answer != null) {
        if (answer['isCorrect'] as bool == true) {
          _totalScore = _totalScore + 1;
        } else {
          var correctAnswer;
          (_questions[_questionIndex]['answers'] as List<Map>)
              .forEach((answer) => {
                    if (answer['isCorrect'] as bool == true)
                      {correctAnswer = answer['answerText']}
                  });

          WrongAnswer wa = new WrongAnswer(
            questionText: _questions[_questionIndex]['questionText'],
            correctAnswer: correctAnswer,
            wrongAnswer: answer['answerText'],
          );
          _wrongAnswersGiven.add(wa);
        }
      }
      if (isReset == true) {
        _questionIndex = 0;
        _totalScore = 0;
        _wrongAnswersGiven = new List<WrongAnswer>();
      } else {
        _questionIndex = _questionIndex + 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Quiz')),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(
                answerQuestionHandler: _answerQuestion,
                wrongAnswers: _wrongAnswersGiven,
                outOf: _questions.length,
                got: _questions.length - _wrongAnswersGiven.length),
      ),
    );
  }
}
