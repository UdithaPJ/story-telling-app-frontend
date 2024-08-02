import 'dart:async';

import 'package:flutter/material.dart';
import 'package:story/components/TextWidgets/love_this_story.dart';
import 'package:story/components/TextWidgets/text_paragraph.dart';
import 'package:story/screens/selectedStory/components/background.dart';
import 'package:story/scripts/data_objects/full_story_item.dart';
import 'package:story/scripts/user_interaction_tracker.dart';

class Body extends StatefulWidget {
  final Widget child;
  final FullStoryItem story;
  const Body({
    super.key,
    required this.child,
    required this.story,
  });

  @override
  _BodyState createState() => _BodyState(story: story);
}

class _BodyState extends State<Body> {
  final FullStoryItem story;
  List<dynamic> content = [];
  bool isLoading = true;
  Timer? readingTimer;
  int readingTime = 0; // minutes
  
  _BodyState({required this.story}){
    isLoading = true;
    FullStoryItem.fetchStoryBody(story.id)
    .then((value) => {
      setState(() {
        content = value;
        isLoading = false;
        startReadingTimer();
      })
    });
  }

  void startReadingTimer(){
    readingTimer = Timer.periodic(Duration(minutes: 1), (timer) {
      readingTime += 1;
      if (readingTime % 5 == 0){
        recodeUserInteractionsReading();
      }
    });
  }

  @override
  void dispose() {
    readingTimer?.cancel();
    super.dispose();
  }

  void recodeUserInteractionsReading(){
    UserInteractionTracker.OnReadForNMins(story.id, readingTime);
  }

  List<Widget> bodyContent(List<dynamic> content){
    List<Widget> contentWidgets = [];
    for (var item in content){
      if (item["type"] == "text"){
        contentWidgets.add(
          TextParagraphWidget(text: item["content"])
        );
      }
    }
    contentWidgets.add(LoveThisStoryBtn(story:this.story));
    return contentWidgets;
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Widget> contentWidgets = bodyContent(content);
    if (isLoading){
      return Background(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Background(
      child: Container(
        height: size.height,
        padding: const EdgeInsets.only(top: 24.0, left: 16.0, right: 16.0, bottom: 24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [...contentWidgets]
              /*[Padding(
                padding:
                    const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Chapter 1',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Color(0xFF000000).withOpacity(0.8),
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Color(0xFF000000).withOpacity(0.6),
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                child: Container(
                  alignment: Alignment.center,
                  height: size.height * 0.055,
                  // decoration:
                  //     BoxDecoration(border: Border.all(color: Colors.grey)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.arrow_back_ios,
                          color: Color(0XFF000000),
                          size: 20,
                        ),
                        //SizedBox(width: 4.0),
                        Text(
                          "1/85",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color(0XFF818181),
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                          ),
                        ),
                        //SizedBox(width: 4.0),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Color(0XFF000000),
                          size: 20,
                        ),
                      ]),
                ),
              ),
            ],*/
          ),
        )
      ),
    );
  }
}
