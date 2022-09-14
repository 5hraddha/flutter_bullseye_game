import 'package:flutter/material.dart';

class ControlSliderStyle {
  static SliderThemeData slider(BuildContext context) {
    return SliderTheme.of(context).copyWith(
      activeTrackColor: Colors.red[700],
      inactiveTrackColor: Colors.red[700],
      trackShape: const RoundedRectSliderTrackShape(),
      trackHeight: 8.0,
      thumbColor: Colors.redAccent,
      overlayColor: Colors.red.withAlpha(32),
      overlayShape: const RoundSliderOverlayShape(overlayRadius: 28.0),
    );
  }
}
