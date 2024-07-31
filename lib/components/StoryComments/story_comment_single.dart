


import 'package:flutter/material.dart';
import 'package:story/scripts/data_objects/comment_single.dart';

class StoryCommentComponent extends StatelessWidget{
  final SingleComment comment;

  StoryCommentComponent({required this.comment});


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        GestureDetector(
          onTap: () {
            //
          },
          child: Container(
            margin: const EdgeInsets.only(
                left: 10.0, right: 10.0),
            width: size.width * 0.97,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color:
                    Color(0XFF818181), // Color of the border
                width: 0.25, // Width of the border
              ),
              borderRadius:
                  BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Color(0x40FFFFFF),
                  blurRadius: 4.0,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 5.0,
                bottom: 5.0,
                left: 13.0,
                right: 13.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    comment.user_name,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color:
                          Color(0xFF818181).withOpacity(0.75),
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 7),
                  Text(
                    comment.comment,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color:
                          Color(0xFF818181).withOpacity(0.75),
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 7.0,
        ),
      ],
    );
  }
}