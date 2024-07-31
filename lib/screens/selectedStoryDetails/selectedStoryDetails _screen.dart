import 'package:flutter/material.dart';
import 'package:story/constants.dart';
import 'package:story/screens/selectedStoryDetails/components/body.dart';

class SelectedStoryDetailsScreen extends StatefulWidget {
  const SelectedStoryDetailsScreen({super.key});

  @override
  State<SelectedStoryDetailsScreen> createState() =>
      _SelectedStoryDetailsScreenState();
}

class _SelectedStoryDetailsScreenState
    extends State<SelectedStoryDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    final id = args["id"];
    if (id == null) {
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Story Details'),
        toolbarHeight: 75, // Adjust the height as needed
        elevation: 10.0,
        centerTitle: true,
      ),
      //backgroundColor: kPrimaryLightColor,
      body: Body(
        child: SingleChildScrollView(),
        id: id,
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
