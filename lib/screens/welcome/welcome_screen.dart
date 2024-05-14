import 'package:flutter/material.dart';
import 'package:story/constants.dart';
import 'package:story/screens/welcome/components/body.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Body(),
    );
  }
}
