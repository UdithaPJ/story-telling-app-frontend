

import 'package:flutter/widgets.dart';

class TextParagraphWidget extends StatelessWidget{
  final String text;
  final Map<String, dynamic> data;

  TextParagraphWidget({required this.text, this.data = const {}});

  TextAlign getAlignment(){
    if (data["alignment"] == "center"){
      return TextAlign.center;
    }
    if (data["alignment"] == "right"){
      return TextAlign.right;
    }
    if (data["alignment"] == "left"){
      return TextAlign.left;
    }
    return TextAlign.justify;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(bottom: 16.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          this.text,
          textAlign: getAlignment(),
          style: TextStyle(
            color: Color(0xFF000000).withOpacity(0.6),
            fontFamily: 'Lato',
            fontWeight: FontWeight.normal,
            fontSize: data["fontSize"] ?? 16,
          ),
        ),
      ),
    );
  }
}