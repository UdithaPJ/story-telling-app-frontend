import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:story/components/already_have_an_account_check.dart';
import 'package:story/components/get_started_button.dart';
import 'package:story/components/rounded_input_field_email.dart';
import 'package:story/components/rounded_password_field.dart';
import 'package:story/navigation_menu.dart';
import 'package:story/screens/login/components/background.dart';
import 'package:story/screens/signup/signup_screen.dart';
import 'package:story/screens/storiesOnACategory/storiesOnACategory_screen.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: size.height * 0.15,
          ),
          Container(
              width: 300,
              child: Text(
                "Welcome back!",
                textAlign: TextAlign.center, // Add your desired text here
                style: TextStyle(
                    color: Color(0xFF3F3D56),
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.bold,
                    fontSize: 32), // Customize text style as needed
              )),
          SizedBox(
            height: size.height * 0.005,
          ),
          Container(
              width: 500,
              child: Text(
                "Sign in to continue your adventure",
                textAlign: TextAlign.center, // Add your desired text here
                style: TextStyle(
                    color: Color(0xFF3F3D56).withOpacity(0.66),
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.bold,
                    fontSize: 24), // Customize text style as needed
              )),
          SizedBox(
            height: size.height * 0.1,
          ),
          RoundedInputFieldEmail(
            labelText: "Username or Email",
            hintText: "Enter Email",
            onChanged: (value) {},
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          RoundedPasswordField(
            labelText: "Password",
            onChanged: (value) {},
          ),
          Container(
              width: size.width * 0.7,
              child: Align(
                alignment: Alignment.topRight,
                child: Text(
                  "Forgot Password?",
                  textAlign: TextAlign.center, // Add your desired text here
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      decorationColor: Color(0xFF0077B6),
                      color: Color(0xFF0077B6),
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w500,
                      fontSize: 14), // Customize text style as needed
                ),
              )),
          SizedBox(
            height: size.height * 0.03,
          ),
          GetStartedButton(
            text: "Sign in",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return StoriesOnACategoryScreen();
                  },
                ),
              );
            },
            //() => Get.to(() => const NavigationMenu()),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 2,
                width: 110, // Adjust width as needed
                color: Color(0XFF818181), // Change color as needed
              ),
              Text(
                "  or  ",
                style: TextStyle(
                    color: Color(0XFF818181),
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.normal,
                    fontSize: 18),
              ),
              Container(
                height: 2,
                width: 110, // Adjust width as needed
                color: Color(0XFF818181), // Change color as needed
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          AlreadyHaveAnAccountCheck(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SignupScreen();
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
