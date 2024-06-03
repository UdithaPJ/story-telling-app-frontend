import 'package:flutter/material.dart';
import 'package:story/components/already_have_an_account_check.dart';
import 'package:story/components/get_started_button.dart';
import 'package:story/components/rounded_input_field_email.dart';
import 'package:story/components/rounded_input_field_person.dart';
import 'package:story/components/rounded_password_field.dart';
import 'package:story/components/simple_text_button.dart';
import 'package:story/screens/storiesOnACategory/components/background.dart';
import 'package:story/screens/storiesOnACategory/storiesOnACategory_screen.dart';
import 'package:story/screens/welcome/welcome_screen.dart';

class Body extends StatefulWidget {
  final Widget child;
  const Body({
    super.key,
    required this.child,
  });

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        children: <Widget>[
          Container(
            width: size.width,
            height: size.height * 0.1,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(width: 2.0, color: Color(0XF818181)),
                bottom: BorderSide(width: 2.0, color: Color(0XF818181)),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 20.0), // Add horizontal padding if needed
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Align children to the left
                mainAxisAlignment:
                    MainAxisAlignment.center, // Center children vertically
                children: <Widget>[
                  Text(
                    "Categories",
                    textAlign: TextAlign.left, // Ensure text is left-aligned
                    style: TextStyle(
                      color: Color(0xFF3F3D56),
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ), // Customize text style as needed
                  ),
                  SizedBox(
                      height:
                          8.0), // Add some space between the text and the buttons
                  Row(
                    children: <Widget>[
                      SimpleTextButton(
                        text: 'Adventure',
                        color: Color(0XFF818181).withOpacity(0.1),
                        textColor: Colors.black,
                        width: 0.28,
                        height: 0.04,
                        textSize: 13.0,
                      ),
                      SizedBox(width: 8.0), // Space between buttons
                      SimpleTextButton(
                        text: 'Adventure',
                        color: Color(0XFF818181).withOpacity(0.1),
                        textColor: Colors.black,
                        width: 0.28,
                        height: 0.04,
                        textSize: 13.0,
                      ),
                      SizedBox(width: 8.0), // Space between buttons
                      SimpleTextButton(
                        text: 'Adventure',
                        color: Color(0XFF818181).withOpacity(0.1),
                        textColor: Colors.black,
                        width: 0.28,
                        height: 0.04,
                        textSize: 13.0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //child: Padding(),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/selectedStoryDetails');
                  },
                  child: Container(
                    width: size.width,
                    height: size.height * 0.27,
                    decoration: const BoxDecoration(
                      //color: Colors.white,
                      border: Border(
                        bottom: BorderSide(
                          color: Color(0XFF818181),
                          width: 0.25,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment
                              .start, // Align children to the start
                          children: [
                            Image.asset(
                              'assets/images/story-image-list.jpg',
                              width: 150,
                              height: 175,
                            ),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Story Title',
                                    style: TextStyle(
                                      color: Color(0xFF3F3D56),
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'by Author',
                                    style: TextStyle(
                                      color: Color(0xFF818181),
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                    ),
                                  ),
                                  SizedBox(height: 7),
                                  Text(
                                    'Views and Rates',
                                    style: TextStyle(
                                      color: Color(0xFF818181),
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13,
                                    ),
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    'Embark on an epic adventure in Chronicles of Everglade: a mystical realm where ancient prophecies and hidden magic converge. As a young hero, youll journey through lush forests, treacherous mountains, and forgotten ruins, fac...',
                                    style: TextStyle(
                                      color: Color(0xFF818181),
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.normal,
                                      fontSize: 11,
                                    ),
                                    //maxLines: 7,
                                  ),
                                  SizedBox(height: 3),
                                  Row(
                                    children: [
                                      SimpleTextButton(
                                        text: 'Complete',
                                        color:
                                            Color(0XFF00B4D8).withOpacity(0.5),
                                        textColor: Colors.white,
                                        width: 0.24,
                                        height: 0.03,
                                        textSize: 10.0,
                                      ),
                                      SizedBox(
                                          width: 8.0), // Space between buttons
                                      SimpleTextButton(
                                        text: 'Complete',
                                        color:
                                            Color(0XFF818181).withOpacity(0.1),
                                        textColor: Colors.black,
                                        width: 0.24,
                                        height: 0.03,
                                        textSize: 10.0,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
