import 'package:flutter/material.dart';
import 'package:story/components/already_have_an_account_check.dart';
import 'package:story/components/get_started_button.dart';
import 'package:story/components/rounded_input_field_email.dart';
import 'package:story/components/rounded_input_field_person.dart';
import 'package:story/components/rounded_password_field.dart';
import 'package:story/screens/signup/components/background.dart';
import 'package:story/screens/signup/signup_screen.dart';
import 'package:story/screens/welcome/welcome_screen.dart';

class Body extends StatelessWidget {
  final Widget child;
  const Body({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: size.height * 0.10,
            ),
            Container(
                width: 500,
                child: Text(
                  "Embark on a Journey Beyond Imagination",
                  textAlign: TextAlign.center, // Add your desired text here
                  style: TextStyle(
                      color: Color(0xFF3F3D56),
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.bold,
                      fontSize: 32), // Customize text style as needed
                )),
            SizedBox(
              height: size.height * 0.04,
            ),
            RoundedInputFieldPerson(
              labelText: "Username",
              hintText: "Enter Username",
              onChanged: (value) {},
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            RoundedInputFieldEmail(
              labelText: "Email",
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
            SizedBox(
              height: size.height * 0.02,
            ),
            RoundedPasswordField(
              labelText: "Confirm Password",
              onChanged: (value) {},
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            GetStartedButton(
              text: "Sign up",
              press: () {},
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
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return WelcomeScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
