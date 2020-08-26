import 'package:firechat/screens/chat_screen.dart';
import 'package:firechat/screens/login_screen.dart';
import 'package:firechat/screens/registration_screen.dart';
import 'package:firechat/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomeScreen(),
        '/LoginScreen': (context) => LoginScreen(),
        '/RegistrationScreen': (context) => RegistrationScreen(),
        '/ChatScreen': (context) => ChatScreen(),
      },
    );
  }
}
