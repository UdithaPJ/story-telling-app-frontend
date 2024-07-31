import 'package:flutter/material.dart';
import 'package:story/constants.dart';
import 'package:story/screens/previewStory/components/body.dart';

class PreviewStoryScreen extends StatefulWidget {
  const PreviewStoryScreen({super.key});

  @override
  State<PreviewStoryScreen> createState() => _PreviewStoryScreenState();
}

class _PreviewStoryScreenState extends State<PreviewStoryScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Story Preview'),
        toolbarHeight: 75, // Adjust the height as needed
        elevation: 10.0,
        centerTitle: true,
      ),
      //backgroundColor: kPrimaryLightColor,
      body: Body(
        child: SingleChildScrollView(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: kPrimaryLightColor,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: "Stories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
        onTap: (int n) {
          //if (n == 1) Navigator.pushNamed(context, '/activities');
          //if (n == 2) Navigator.pushNamed(context, '/profile');
        },
        currentIndex: 0,
        selectedItemColor: kPrimaryDarkColor,
      ),
    );
  }
}
