import 'package:flutter/material.dart';
import 'package:story/components/signin_button.dart';
import 'package:story/screens/selectedStoryDetails/components/background.dart';

class Body extends StatefulWidget {
  final Widget child;
  const Body({
    super.key,
    required this.child,
  });

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TabController _tabController = TabController(length: 3, vsync: this);
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
                              AssetImage('assets/images/story-image-list.jpg')),
                    ),
                    // child: Image.asset(
                    //   'assets/images/story-image-list.jpg',
                    // ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    "Story Title",
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
                    "Author Profile",
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
                              Icons.star,
                              color: Color(0XFF818181).withOpacity(0.75),
                            ),
                            SizedBox(width: 4.0),
                            Text(
                              "Votes",
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
                          "15.3K",
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
                              Icons.menu,
                              color: Color(0XFF818181).withOpacity(0.75),
                            ),
                            SizedBox(width: 4.0),
                            Text(
                              "Parts",
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
                          "60",
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
                Tab(text: 'Synopsis'),
                Tab(text: 'Table of Content'),
                Tab(text: 'Reviews'),
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
                      'Embark on an epic adventure in Chronicles of Everglade: a mystical realm where ancient prophecies and hidden magic converge. As a young hero Embark on an epic adventure in Chronicles of Everglade: a mystical realm where ancient prophecies and hidden magic converge. As a young hero ',
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
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: GetStartedButton(
                text: 'START READING',
                press: () {
                  Navigator.pushNamed(context, '/selectedStory');
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
