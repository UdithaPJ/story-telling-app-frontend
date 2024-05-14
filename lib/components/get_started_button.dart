import 'package:flutter/material.dart';
import 'package:story/constants.dart';

class GetStartedButton extends StatelessWidget {
  final String text;
  final void Function() press;
  final Color color, textColor;
  const GetStartedButton({
    super.key,
    required this.text,
    required this.press,
    this.color = kPrimaryDarkColor,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.45,
      child: ElevatedButton(
          onPressed: press,
          child: Text(
            text,
            style: TextStyle(color: textColor),
          ),
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(kPrimaryDarkColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0))),
          )),
    );
  }
}
