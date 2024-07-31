import 'package:flutter/material.dart';

class SimpleTextButton extends StatelessWidget {
  final String text;
  final Color color, textColor;
  final double width, height, textSize;
  final VoidCallback? onPressed;

  const SimpleTextButton({
    Key? key,
    required this.text,
    required this.color,
    required this.textColor,
    required this.width,
    required this.height,
    required this.textSize,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * width,
      height: size.height * height,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(color: textColor, fontSize: textSize),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(color),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
      ),
    );
  }
}
