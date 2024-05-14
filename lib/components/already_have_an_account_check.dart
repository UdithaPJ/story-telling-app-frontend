import 'package:flutter/material.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final void Function() press;
  const AlreadyHaveAnAccountCheck({
    super.key,
    this.login = true,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "Are you new?" : "Already have an account?",
          style: TextStyle(
            color: Color(0XFF818181),
          ),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? " Create An Account" : " Sign in",
            style: TextStyle(
                //decoration: TextDecoration.underline,
                //decorationColor: Color(0xFF0077B6),
                color: Color(0XFF0077B6)),
          ),
        )
      ],
    );
  }
}
