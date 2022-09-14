import 'package:flutter/material.dart';
import 'dart:math';
import '../components/prompt.dart';
import '../components/control.dart';
import '../components/score.dart';
import '../components/hit_me_button.dart';
import '../components/style_button.dart';
import '../game_model.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late GameModel _model;

  void initState() {
    super.initState();
    _model = GameModel(_newTarget());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.only(left: 28.0, right: 5.0),
        decoration: BoxDecoration(
          border: Border.all(),
          color: Colors.white,
          image: const DecorationImage(
            image: AssetImage('images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      top: 38.0, bottom: 30.0, right: 20.0),
                  child: Prompt(
                    targetValue: _model.target,
                  ),
                ),
                Control(model: _model),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0, right: 20.0),
                  child: HitMeButton(
                    text: 'Hit me'.toUpperCase(),
                    onPressed: () {
                      _showAlert(context);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Score(
                    totalScore: _model.totalScore,
                    round: _model.round,
                    onStartOver: _startNewGame,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Callback to pass to Score widget to restart the game
  void _startNewGame() {
    setState(() {
      _model.current = GameModel.sliderStart;
      _model.round = GameModel.roundStart;
      _model.totalScore = GameModel.scoreStart;
      _model.target = _newTarget();
    });
  }

  int _newTarget() => Random().nextInt(100) + 1;

  int _pointsForCurrentRound() {
    const maximumScore = 100;
    final difference = _differenceAmount();
    // Calculate bonus for the player
    var bonus = 0;
    if (difference == 0) {
      bonus = 100;
    } else if (difference == 1) {
      bonus = 50;
    }
    return maximumScore - difference + bonus;
  }

  int _differenceAmount() => (_model.target - _model.current).abs();

  String _alertTitle() {
    final difference = _differenceAmount();
    if (difference == 0) {
      return 'Perfect! You did it.';
    } else if (difference <= 5) {
      return 'You almost had it.';
    } else if (difference <= 10) {
      return 'Not bad!';
    }
    return 'Try hard to hit close!';
  }

  void _showAlert(BuildContext context) {
    final okButton = StyledButton(
      icon: Icons.close,
      onPressed: () {
        Navigator.of(context).pop();
        setState(() {
          _model.totalScore += _pointsForCurrentRound();
          _model.round += 1;
          _model.target = _newTarget();
          _model.current = GameModel.sliderStart;
        });
      },
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(_alertTitle()),
          content: Text('The current value of the slider is ${_model.current}\n'
              'You scored ${_pointsForCurrentRound()} points in this round.'),
          actions: [
            okButton,
          ],
          elevation: 5,
        );
      },
    );
  }
}
