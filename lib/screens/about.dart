import 'package:flutter/material.dart';
import '../styles/text_styles.dart';
import '../components/style_button.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  final String aboutBullseye =
      'This is Bullseye, the game where you can win points'
      ' and earn fame by dragging a slider.'
      ' Your goal is to place the slider as close'
      ' as possible to the target value.'
      ' The closer you are, the more points you score.'
      ' Enjoy!';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('About'),
          backgroundColor: Colors.red[700],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Image(image: AssetImage('images/nub.png')),
                  Text(
                    'Bullseye Blast'.toUpperCase(),
                    style: HeadlineTextStyle.headline1(context),
                  ),
                ],
              ),
              SizedBox(
                width: 600.0,
                child: Text(
                  aboutBullseye,
                  textAlign: TextAlign.center,
                  style: BodyTextStyle.bodyText1(context),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: StyledButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icons.arrow_back,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
