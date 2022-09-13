import 'package:flutter/material.dart';

class Control extends StatefulWidget {
  const Control({Key? key}) : super(key: key);

  @override
  State<Control> createState() => _ControlState();
}

class _ControlState extends State<Control> {
  double _currentValue = 50.0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('1'),
        Slider(
          value: _currentValue,
          onChanged: (newValue) {
            setState(() {
              _currentValue = newValue;
            });
          },
          min: 1,
          max: 100,
        ),
        const Text('100'),
      ],
    );
  }
}
