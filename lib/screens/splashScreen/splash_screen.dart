import 'package:flutter/material.dart';
import 'package:story/constants.dart';

import 'components/body.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SplashBody(),
    );
  }
}
