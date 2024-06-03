import 'package:flutter/material.dart';
import 'package:story/constants.dart';
import 'package:story/screens/login/components/body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    super.key,
    //required this.name,
    //required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryLightColor,
      body: Body(),
    );
  }
}
