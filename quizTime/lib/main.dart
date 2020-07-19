import 'package:flutter/material.dart';
import 'package:quizTime/result.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(QuizTime());

class QuizTime extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _QuizTimeState();
  }
}

class _QuizTimeState extends State<QuizTime> {
  var _questionIndex = 0;
  var _totalScore = 0;
  final _questions = const [
    {
      'questionText': 'What\'s your favourite color?',
      'answers': [
        {'code': 'Black', 'score': 10},
        {'code': 'Red', 'score': 7},
        {'code': 'Green', 'score': 4},
        {'code': 'White', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favourite color?',
      'answers': [
        {'code': 'Rabbit', 'score': 3},
        {'code': 'Snake', 'score': 11},
        {'code': 'Elephant', 'score': 5},
        {'code': 'Lion', 'score': 9},
      ],
    },
  ];

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = (_questionIndex + 1) % 3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz Time'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                questionIndex: _questionIndex,
                answerQuestion: _answerQuestion,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
