import 'package:flutter/material.dart';

class SimpleTextButton extends StatelessWidget {
  final String text;
  final Color color, textColor;
  final double width, height, textSize;

  const SimpleTextButton({
    super.key,
    required this.text,
    required this.color,
    required this.textColor,
    required this.width,
    required this.height,
    required this.textSize,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * width,
      height: size.height * height,
      child: ElevatedButton(
          onPressed: () {},
          child: Text(
            text,
            style: TextStyle(color: textColor, fontSize: textSize, overflow: TextOverflow.ellipsis),
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
