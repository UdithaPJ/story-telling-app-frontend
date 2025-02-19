import 'package:flutter/material.dart';

class GetStartedButton extends StatelessWidget {
  final String text;
  final void Function() press;
  final Color color, textColor;
  final double width;
  const GetStartedButton({
    super.key,
    required this.text,
    required this.press,
    required this.color,
    required this.textColor,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * width,
      child: ElevatedButton(
          onPressed: press,
          child: Text(
            text,
            style: TextStyle(
                color: textColor,
                fontFamily: 'Lato',
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(color),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0))),
          )),
    );
  }
}
