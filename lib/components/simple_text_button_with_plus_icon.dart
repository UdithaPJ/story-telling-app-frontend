import 'package:flutter/material.dart';

class SimpleTextButtonWithPlus extends StatelessWidget {
  final String text;
  final Color color, textColor;
  final double width, height, textSize;
  final VoidCallback? onPressed;

  const SimpleTextButtonWithPlus({
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
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(color),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
          padding: MaterialStateProperty.all<EdgeInsets>(
            EdgeInsets.symmetric(
                horizontal: 8.0), // Reduce padding from left and right
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.add,
              color: textColor,
              size: textSize,
            ),
            SizedBox(width: 4.0),
            Flexible(
              child: Text(
                text,
                style: TextStyle(color: textColor, fontSize: textSize),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
