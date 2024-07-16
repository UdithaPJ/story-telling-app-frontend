import 'package:flutter/material.dart';
import 'package:story/screens/storiesOnACategory/storiesOnACategory_screen.dart';
import 'package:story/screens/welcome/components/background.dart';
import 'package:story/screens/welcome/welcome_screen.dart';
import 'package:story/scripts/user_auth.dart';

// ignore: must_be_immutable
class SplashBody extends StatefulWidget {
  var isLoading = true;
  SplashBody({Key? key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SplashBodyLoadingState();
  }
}

class _SplashBodyLoadingState extends State<SplashBody> {


  void checkUser(BuildContext context){
    var userAuth = UserAuth();
    userAuth.isAuthenticated().then((value) => {
      if (value) {
        // go to the home screen
        Navigator.replace(
          context,
          oldRoute: ModalRoute.of(context)!,
          newRoute: MaterialPageRoute(
            builder: (context) {
              return StoriesOnACategoryScreen();
            },
          ),
        ),
      } else {
        // go to welcome screen
        Navigator.replace(
          context,
          oldRoute: ModalRoute.of(context)!,
          newRoute: MaterialPageRoute(
            builder: (context) {
              return WelcomeScreen();
            },
          ),
        ),
      }
    }).catchError((e) {
      print(e);
    });
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    checkUser(context); // app-icon.png

    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Image.asset('assets/images/fantasy.png'),
            width: size.width * 0.45,
          ),
          // loading animation
          Container(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
            margin: EdgeInsets.only(top: 20),
          ),          
        ],
      ),
    );
  }
}
