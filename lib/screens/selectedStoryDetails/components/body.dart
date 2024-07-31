import 'package:flutter/material.dart';
import 'package:story/components/StoryComments/story_comments_container.dart';
import 'package:story/components/signin_button.dart';
import 'package:story/constants.dart';
import 'package:story/screens/selectedStoryDetails/components/background.dart';
import 'package:story/scripts/data_objects/full_story_item.dart';
import 'package:story/scripts/user_interaction_tracker.dart';

class Body extends StatefulWidget {
  final Widget child;
  final String id;

  const Body({
    super.key,
    required this.child,
    required this.id,
  });

  @override
  _BodyState createState() => _BodyState(id);
}

class _BodyState extends State<Body> with TickerProviderStateMixin {
  FullStoryItem? story;
  var isLoading = true;
  String id = "1";
  bool isLoadingComments = true;

  _BodyState(this.id){
    this.initState();
  }

  void loadComments() {
    // load comments
    story?.loadComments().then((value) => {
      setState(() {
        isLoadingComments = false;
      })
    });
  }

  @override
  void initState() {
    super.initState();
    
    // fetch story details
    story = null;
    FullStoryItem.fetchStory(id).then((value) => {
        setState(() {
            story = value;
            isLoading = false;
        }),
        loadComments()
    }).catchError((error){
        setState(() {
            isLoading = false;
        });
    });
    
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TabController _tabController = TabController(length: 3, vsync: this);
    if (isLoading) {
      return Background(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    if (story == null) {
      return Background(
        child: Center(
          child: Text("Story not found"),
        ),
      );
    }

    return Background(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: size.width,
            height: size.height * 0.37,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 0.25, color: Color(0XFF818181)),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Column(
                children: [
                  Container(
                    width: size.width * 0.35,
                    height: size.height * 0.25,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image:
                              AssetImage((story!.thumbnail == "")?'assets/images/story-image-list.jpg':kServerDomain + story!.thumbnail)),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    story!.title,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.8),
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 7.0),
                  Text(
                    story?.user_name??"",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color(0XFF818181),
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: size.width,
            height: size.height * 0.07,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 0.25, color: Color(0XFF818181)),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.remove_red_eye,
                              color: Color(0XFF818181).withOpacity(0.75),
                            ),
                            SizedBox(width: 4.0),
                            Text(
                              "Reads",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Color(0XFF818181),
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "12.1K",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color(0XFF000000).withOpacity(0.6),
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.favorite,
                              color: ((story!.didILiked)?Color.fromARGB(255, 255, 71, 71).withOpacity(0.75):Color(0XFF818181).withOpacity(0.75)),
                            ),
                            SizedBox(width: 4.0),
                            Text(
                              "Likes",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Color(0XFF818181),
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          story!.likes.toString(),
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color(0XFF000000).withOpacity(0.6),
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.comment,
                              color: Color(0XFF818181).withOpacity(0.75),
                            ),
                            SizedBox(width: 4.0),
                            Text(
                              "Comments",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Color(0XFF818181),
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          story!.comments.toString(),
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color(0XFF000000).withOpacity(0.6),
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: size.width,
            height: size.height * 0.05,
            //color: Colors.grey[200],
            child: TabBar(
              controller: _tabController,
              labelColor: Color(0XFF00B4D8),
              unselectedLabelColor: Color(0XFF818181),
              indicatorColor: Color(0XFF00B4D8),
              tabs: [
                Tab(text: 'Description'),
                Tab(text: 'Table of Content'),
                Tab(text: 'Comments'),
              ],
            ),
          ),
          Container(
            height: size.height * 0.24, // Set desired height here
            child: TabBarView(
              controller: _tabController,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20.0, // Space from the top
                    left: 16.0, // Space from the left
                    right: 16.0, // Space from the right
                  ),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      story!.content,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Color(0xFF818181).withOpacity(0.75),
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20.0,
                    left: 16.0, // Space from the left
                    right: 16.0, // Space from the left and right
                  ),
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              //
                            },
                            child: Container(
                              margin: const EdgeInsets.only(
                                  left: 10.0, right: 10.0),
                              width: size.width * 0.55,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color:
                                      Color(0XFF818181), // Color of the border
                                  width: 0.25, // Width of the border
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x40FFFFFF),
                                    blurRadius: 4.0,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 5.0,
                                  bottom: 5.0,
                                  // left: 3.0,
                                  // right: 3.0,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Part 1 - Name of the Part',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color:
                                            Color(0xFF818181).withOpacity(0.75),
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 7.0,
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20.0,
                    left: 5.0, // Space from the left
                    right: 5.0, // Space from the left and right
                  ),
                  child: StoryCommentsContainer(story: story!)
                  /*ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              //
                            },
                            child: Container(
                              margin: const EdgeInsets.only(
                                  left: 10.0, right: 10.0),
                              width: size.width * 0.97,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color:
                                      Color(0XFF818181), // Color of the border
                                  width: 0.25, // Width of the border
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x40FFFFFF),
                                    blurRadius: 4.0,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 5.0,
                                  bottom: 5.0,
                                  left: 13.0,
                                  right: 13.0,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'User Name',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                        color:
                                            Color(0xFF818181).withOpacity(0.75),
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                    SizedBox(height: 7),
                                    Text(
                                      'Embark on an epic adventure in Chronicles of Everglade: a mystical realm where ancient prophecies and hidden magic converge. As a young hero',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                        color:
                                            Color(0xFF818181).withOpacity(0.75),
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.normal,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 7.0,
                          ),
                        ],
                      );
                    },
                  ),*/
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: GetStartedButton(
                text: 'START READING',
                press: () {
                  UserInteractionTracker.OnClickReadStory(story!.id);
                  Navigator.pushNamed(context, '/selectedStory', arguments: {'story': story});
                },
                color: Color(0XFF00B4D8),
                textColor: Colors.white,
                width: 0.5),
          )
        ],
      ),
    );
  }
}
