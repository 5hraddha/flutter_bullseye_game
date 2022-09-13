import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';
import 'prompt.dart';
import 'control.dart';
import 'score.dart';
import 'game_model.dart';

void main() {
  runApp(const BullsEyeApp());
}

class BullsEyeApp extends StatelessWidget {
  const BullsEyeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Lock the screen orientation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    // Set the colors for the status bar and navigation bar
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor:
            Colors.white, // navigation bar doesn't accept Colors.transparent
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );

    return const MaterialApp(
      title: 'Bullseye',
      debugShowCheckedModeBanner: false,
      home: GamePage(),
    );
  }
}

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late GameModel _model;

  void initState() {
    super.initState();
    _model = GameModel(Random().nextInt(100) + 1);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Prompt(
                targetValue: _model.target,
              ),
              Control(model: _model),
              TextButton(
                child: const Text('Hit Me!',
                    style: TextStyle(
                      color: Colors.blue,
                    )),
                onPressed: () {
                  _showAlert(context);
                },
              ),
              Score(
                totalScore: _model.totalScore,
                round: _model.round,
              ),
            ],
          ),
        ),
      ),
    );
  }

  int _pointsForCurrentRound() {
    const maximumScore = 100;
    return maximumScore - _differenceAmount();
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
    final okButton = TextButton(
      child: const Text('Awesome!'),
      onPressed: () {
        Navigator.of(context).pop();
        setState(() {
          _model.totalScore += _pointsForCurrentRound();
          _model.round += 1;
          _model.target = Random().nextInt(100) + 1;
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
