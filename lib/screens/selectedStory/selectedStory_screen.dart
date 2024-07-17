import 'package:flutter/material.dart';
import 'package:story/constants.dart';
import 'package:story/screens/selectedStory/components/body.dart';
import 'package:story/scripts/data_objects/full_story_item.dart';

class SelectedStoryScreen extends StatefulWidget {
  const SelectedStoryScreen({super.key});

  @override
  State<SelectedStoryScreen> createState() => _SelectedStoryScreenState();
}

class _SelectedStoryScreenState extends State<SelectedStoryScreen> {

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    var args = ModalRoute.of(context)!.settings.arguments as Map;;

    FullStoryItem? story = args["story"] as FullStoryItem?;
    if (story == null){
      // return to home
      Navigator.pop(context);
      return Container();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(story.title),
        toolbarHeight: 75, // Adjust the height as needed
        elevation: 10.0,
        centerTitle: true,
      ),
      //backgroundColor: kPrimaryLightColor,
      body: Body(
        child: Column(),
        story: story,
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
