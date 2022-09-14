import 'package:flutter/material.dart';
import 'game_model.dart';

class Control extends StatefulWidget {
  const Control({Key? key, required this.model}) : super(key: key);

  final GameModel model;

  @override
  State<Control> createState() => _ControlState();
}

class _ControlState extends State<Control> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 80.0),
          child: Text(
            '1',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: Slider(
            value: widget.model.current.toDouble(),
            onChanged: (newValue) {
              setState(() {
                widget.model.current = newValue.toInt();
              });
            },
            min: 1,
            max: 100,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(right: 80.0),
          child: Text(
            '100',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
