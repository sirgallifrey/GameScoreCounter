import 'package:flutter/material.dart';
import 'package:game_score_counter/domain/player.dart';
import 'package:game_score_counter/PlayerWidget.dart';

class ScoreCounterPage extends StatefulWidget {
  ScoreCounterPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ScoreCounterPageState createState() => _ScoreCounterPageState();
}

class _ScoreCounterPageState extends State<ScoreCounterPage> {
  List<Player> _players;

  _ScoreCounterPageState() {
    _players = new List<Player>();
    _players.add(new Player(name: 'Player 1', score: 0));
    _players.add(new Player(name: 'Player 2', score: 0));
  }

  void _newPlayer() {
    setState(() {
      var _numPlayers = _players.length;
      _players.add(new Player(
        name: 'Player ' + (_numPlayers + 1).toString(),
        score: 0,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: _players
            .map(
              (p) => PlayerWidget(
                    name: p.name,
                    score: p.score,
                    onIncrementScore: (incrementBy) {
                      setState(() {
                        p.score += incrementBy;
                      });
                    },
                  ),
            )
            .toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _newPlayer,
        tooltip: 'Add new player',
        child: Icon(Icons.add),
      ),
    );
  }
}
