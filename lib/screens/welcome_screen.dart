import 'package:firechat/components/roundButton.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
      upperBound: 60,
    );

    animation =
        ColorTween(begin: Colors.red, end: Colors.blue).animate(controller);

    controller.forward();

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  child: Image.asset('images/logo.png'),
                  height: controller.value,
                ),
                TypewriterAnimatedTextKit(
                  speed: Duration(seconds: 1),
                  text: ['Fire Chat'],
                  textStyle: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButtons(
                title: 'Log In',
                color: Colors.lightBlueAccent,
                onPressed: () {
                  Navigator.pushNamed(context, '/LoginScreen');
                }),
            RoundedButtons(
                title: 'Register',
                color: Colors.blueAccent,
                onPressed: () {
                  Navigator.pushNamed(context, '/RegistrationScreen');
                }),
          ],
        ),
      ),
    );
  }
}
