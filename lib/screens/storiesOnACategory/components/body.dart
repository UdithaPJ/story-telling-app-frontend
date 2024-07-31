import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:story/components/simple_text_button.dart';
import 'package:story/constants.dart';
import 'package:story/screens/storiesOnACategory/components/background.dart';
import 'package:http/http.dart' as http;
import 'package:story/components/single_story_item.dart';
import 'package:story/scripts/data_objects/simple_story_item.dart';
import 'package:story/scripts/user_auth.dart';

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
  var isLoading = false;
  var articles = [];
	List<SimpleStoryItem> stories = [];
  final List<String> categories = ["All", "Adventure", "Romance", "Mystery"];


  void get_articles() {
    if (isLoading) {
      return;
    }
    setState(() {
      isLoading = true;
    });
    var url = Uri.parse(kServerDomain + "/api/articles/get-suggested");
    var response = http.get(url, headers: {
      "Content-Type": "application/json",
      "ngrok-skip-browser-warning": "true"
    });
    response.then((value) {
      if (value.statusCode == 200){
        // save token and go to home screen
        var message = JsonDecoder().convert(value.body);
        if (message["token"] != null){
          // save token
          UserAuth().saveToken(message["token"]);
        }
      }
    }).whenComplete(() => setState(() {
      isLoading = false;
    }));
  }
  
  
	@override
	void initState() {
		super.initState();
    stories = [];
		SimpleStoryItem.fetchStories().then((stories){
      setState(() {
        this.stories = stories;
      });
    });
	}

  List<Widget> getCategoriesWidgetList(){
    var categoriesWidgetList = <Widget>[];

    for (var e in this.categories){
      categoriesWidgetList.add(SimpleTextButton(
        text: e,
        color: Color(0XFF818181).withOpacity(0.1),
        textColor: Colors.black,
        width: 0.28,
        height: 0.04,
        textSize: 13.0,
      ));
      categoriesWidgetList.add(SizedBox(width: 8.0));
    }
    return categoriesWidgetList;
  }


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
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: getCategoriesWidgetList(),
                    ),
                  )
                ],
              ),
            ),
            //child: Padding(),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: this.stories.length,
              itemBuilder: (context, index) {
                return SingleStoryItem(story: this.stories[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
