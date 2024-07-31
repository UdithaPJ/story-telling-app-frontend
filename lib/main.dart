import 'package:flutter/material.dart';
import 'package:story/screens/login/login_screen.dart';
import 'package:story/screens/previewStory/previewStory_screen.dart';
import 'package:story/screens/readStoryPreview/readStoryPreview_screen.dart';
import 'package:story/screens/selectedStory/selectedStory_screen.dart';
import 'package:story/screens/selectedStoryDetails/selectedStoryDetails%20_screen.dart';
import 'package:story/screens/signup/signup_screen.dart';
import 'package:story/screens/splashScreen/splash_screen.dart';
import 'package:story/screens/storiesOnACategory/storiesOnACategory_screen.dart';
import 'package:story/screens/welcome/welcome_screen.dart';
import 'package:story/screens/writeAStory/writeAStory_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // theme: ThemeData(
      //   primaryColor: kPrimaryColor,
      //   scaffoldBackgroundColor: Colors.white,
      // ),
      home: SplashScreen(),
      routes: {
        '/welcome': (context) => const WelcomeScreen(),
        '/signin': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
        '/storyCategories': (context) => const StoriesOnACategoryScreen(),
        '/selectedStoryDetails': (context) =>
            const SelectedStoryDetailsScreen(),
        '/selectedStory': (context) => const SelectedStoryScreen(),
        '/writeAStory': (context) => const WriteAStoryScreen(),
        '/previewStory': (context) => const PreviewStoryScreen(),
        '/readStoryPreview': (context) => const ReadStoryPreviewScreen(),
      },
    );
  }
}
