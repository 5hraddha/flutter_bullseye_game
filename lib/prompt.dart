import 'package:flutter/material.dart';
import 'text_styles.dart';

class Prompt extends StatelessWidget {
  const Prompt({Key? key, required this.targetValue}) : super(key: key);

  final int targetValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'Put the bullseye as close as you can to hit'.toUpperCase(),
          style: LabelTextStyle.bodyText1(context),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 8.0, 8.0, 8.0),
          child: Text(
            '$targetValue',
            style: TargetTextStyle.bodyText1(context),
          ),
        ),
      ],
    );
  }
}
