import 'package:flutter/material.dart';

class StyledButton extends StatelessWidget {
  const StyledButton({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  final IconData icon;
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      fillColor: Colors.black,
      splashColor: Colors.redAccent,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
      shape: const CircleBorder(
        side: BorderSide(color: Colors.white),
      ),
    );
  }
}
