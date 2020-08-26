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
      duration: Duration(seconds: 1),
      upperBound: 100,
    );

    animation = ColorTween(begin: Colors.redAccent, end: Colors.red)
        .animate(controller);

    controller.forward();

    controller.addListener(() {
      setState(() {});
      print(animation.value);
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
      backgroundColor: Colors.white,
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
                  height: animation.value,
                ),
                TypewriterAnimatedTextKit(
                  text: ['Fire Chat '],
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
