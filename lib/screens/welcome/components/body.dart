import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:story/components/get_started_button.dart';
import 'package:story/screens/login/login_screen.dart';
import 'package:story/screens/welcome/components/background.dart';

class Body extends StatelessWidget {
  const Body({Key? key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Text(
          //   "Welcome!",
          //   style: TextStyle(fontWeight: FontWeight.bold),
          // ),
          SvgPicture.asset(
            "assets/images/main.svg",
            height: size.height * 0.3,
          ),
          SizedBox(
              height:
                  50), // Add SizedBox to create space between the image and the text
          Container(
              width: 300,
              child: Text(
                "TaleTwist: Where Stories Unfold",
                textAlign: TextAlign.center, // Add your desired text here
                style: TextStyle(
                    color: Color(0xFF3F3D56),
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.bold,
                    fontSize: 20), // Customize text style as needed
              )),
          SizedBox(height: 20),
          Container(
              width: 300,
              child: Text(
                "Our project aims to develop an Interactive Storytelling Platform, to revolutionizing storytelling. Through intuitive features like voting mechanisms and robust search functionalities, users can shape stories and discover diverse content. Authors can monetize their work, supported by data analytics.",
                textAlign: TextAlign.center, // Add your desired text here
                style: TextStyle(
                    color: Color(0xFF3F3D56).withOpacity(0.66),
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.bold,
                    fontSize: 13), // Customize text style as needed
              )),
          SizedBox(
              height:
                  60), // Add SizedBox to create space between the text and the button
          GetStartedButton(
            text: "Get Started",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
