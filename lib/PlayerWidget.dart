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
      child: FlatButton(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              this.name,
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.display1,
            ),
            Text(
              '$score',
              style: Theme.of(context).textTheme.display1,
            ),
            ButtonTheme(
              minWidth: 36.0,
              shape: CircleBorder(),
              padding: EdgeInsets.all(0.0),
              child: Row(
                children: <Widget>[
                  RaisedButton(
                      child: Text('-5'),
                      onPressed: () {
                        onIncrementScore(-5);
                      }),
                  RaisedButton(
                      child: Text('-1'),
                      onPressed: () {
                        onIncrementScore(-1);
                      }),

                  RaisedButton(
                      child: Text('+1'),
                      onPressed: () {
                        onIncrementScore(1);
                      }),
                  RaisedButton(
                      child: Text('+5'),
                      onPressed: () {
                        onIncrementScore(5);
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
