import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int finalScore;
  final Function resetHandler;

  Result(this.finalScore, this.resetHandler);

  String get resultPhrase {
    String resultText = '';
    if (finalScore <= 8) {
      resultText = 'Quite Innocent! ';
    } else if (finalScore <= 8) {
      resultText = 'Pretty Likeable!';
    } else if (finalScore <= 8) {
      resultText = 'You are strange???';
    } else {
      resultText = 'You are bad';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
          child: Text(
            resultPhrase,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        RaisedButton(
          child: Text('Retake the quiz!'),
          onPressed: resetHandler,
        )
      ],
    );
  }
}
