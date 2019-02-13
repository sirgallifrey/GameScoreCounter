import 'package:flutter/material.dart';

typedef void OnIncrementScore(int incrementBy);
typedef void OnChangeName(String changeTo);
enum Department { treasury, state }

class PlayerWidget extends StatelessWidget {
  final String name;
  final int score;
  final OnIncrementScore onIncrementScore;

  PlayerWidget({
    this.name,
    this.score,
    this.onIncrementScore,
    //OnChangeName onChangeName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                name,
                style: TextStyle(fontSize: 18.0),
              ),
            ],
          ),
          Text(
            'Score: $score',
            style: TextStyle(fontSize: 24.0),
          ),
          ButtonTheme(
            minWidth: 36.0,
            shape: CircleBorder(),
            padding: EdgeInsets.all(0.0),
            child: Row(
              children: <Widget>[
                RaisedButton(
                    child: Text('-5'),
                    color: Colors.red,
                    onPressed: () {
                      onIncrementScore(-5);
                    }),
                RaisedButton(
                    child: Text('-1'),
                    color: Colors.red,
                    onPressed: () {
                      onIncrementScore(-1);
                    }),
                RaisedButton(
                    child: Text('+1'),
                    color: Colors.green,
                    onPressed: () {
                      onIncrementScore(1);
                    }),
                RaisedButton(
                    child: Text('+5'),
                    color: Colors.green,
                    onPressed: () {
                      onIncrementScore(5);
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
