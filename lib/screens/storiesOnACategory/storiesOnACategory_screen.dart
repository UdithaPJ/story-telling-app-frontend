import 'package:flutter/material.dart';
import 'package:story/constants.dart';
import 'package:story/screens/storiesOnACategory/components/body.dart';

class StoriesOnACategoryScreen extends StatefulWidget {
  const StoriesOnACategoryScreen({super.key});

  @override
  State<StoriesOnACategoryScreen> createState() =>
      _StoriesOnACategoryScreenState();
}

class _StoriesOnACategoryScreenState extends State<StoriesOnACategoryScreen> {
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Adventure'),
        toolbarHeight: 75, // Adjust the height as needed
        elevation: 10.0,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Add your onPressed code here!
            },
          ),
        ],
      ),
      //backgroundColor: kPrimaryLightColor,
      body: Body(
        child: Column(),
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
