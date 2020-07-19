import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function answerHandler;
  final String answerText;

  Answer(this.answerHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 100, top: 10, right: 100, bottom: 10),
      child: RaisedButton(
        color: Colors.blueAccent,
        textColor: Colors.white,
        child: Text(answerText),
        onPressed: answerHandler,
      ),
    );
  }
}
