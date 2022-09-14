import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/home.dart';

class BullsEyeApp extends StatelessWidget {
  const BullsEyeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Lock the screen orientation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    return const MaterialApp(
      title: 'Bullseye',
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
