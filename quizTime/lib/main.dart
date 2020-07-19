import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

void main() => runApp(QuizTime());

class QuizTime extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _QuizTimeState();
  }
}

class _QuizTimeState extends State<QuizTime> {
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex = (_questionIndex + 1) % 3;
    });
  }

  @override
  Widget build(BuildContext context) {
    const questions = const [
      {
        'questionText': 'What\'s your favourite color?',
        'answers': ['Black', 'Red', 'Green', 'White'],
      },
      {
        'questionText': 'What\'s your favourite color?',
        'answers': ['Rabbit', 'Snake', 'Elephant', 'Lion'],
      },
      {
        'questionText': 'What\'s your favourite number?',
        'answers': ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'],
      },
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz Time'),
        ),
        body: Column(
          children: [
            Question(
              questions[_questionIndex]['questionText'],
            ),
            ...(questions[_questionIndex]['answers'] as List<String>)
                .map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList()
          ],
        ),
      ),
    );
  }
}
