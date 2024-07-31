import 'package:flutter/material.dart';
import 'package:story/components/signin_button.dart';
import 'package:story/components/simple_text_button.dart';
import 'package:story/screens/storiesOnACategory/components/background.dart';

class Body extends StatefulWidget {
  final Widget child;
  const Body({
    Key? key,
    required this.child,
  });

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Map<String, String>> parts = [
    {'part': '', 'name': ''}
  ];

  List<String> categories = [
    'Adventure',
    'Fantasy',
    'Mystery',
    'Sci-Fi',
    'Romance'
  ];
  String selectedCategory = '';

  void addPart() {
    setState(() {
      parts.add({'part': '', 'name': ''});
    });
  }

  void selectCategory(String category) {
    setState(() {
      selectedCategory = category;
      categories.remove(category);
      categories.insert(0, category);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            children: <Widget>[
              Container(
                width: size.width,
                padding: EdgeInsets.symmetric(vertical: 20.0),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 0.5, color: Color(0XFF818181)),
                    bottom: BorderSide(width: 0.5, color: Color(0XFF818181)),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: size.width,
                        height: size.height * 0.01,
                      ),
                      Text(
                        "Add a Title",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color(0xFF3F3D56),
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Container(
                        width: size.width * 0.9,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Title of the Story',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide(
                                color: Color(0xFF818181),
                                width: 2.0,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide(
                                color: Color(0xFF2F2E41),
                                width: 2.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: size.width,
                padding: EdgeInsets.symmetric(vertical: 20.0),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 0.5, color: Color(0XFF818181)),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Select a Category",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color(0xFF3F3D56),
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Container(
                        height: 50.0,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: categories.length,
                          itemBuilder: (context, index) {
                            String category = categories[index];
                            bool isSelected = category == selectedCategory;
                            return Row(
                              children: <Widget>[
                                SimpleTextButton(
                                  text: isSelected ? category : '$category +',
                                  color: isSelected
                                      ? Colors.grey.withOpacity(0.3)
                                      : Color(0XFF818181).withOpacity(0.1),
                                  textColor: Colors.black,
                                  width: 0.35,
                                  height: 0.04,
                                  textSize: 13.0,
                                  onPressed: isSelected
                                      ? null
                                      : () {
                                          selectCategory(category);
                                        },
                                ),
                                SizedBox(width: 8.0),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: size.width,
                padding: EdgeInsets.symmetric(vertical: 20.0),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 0.5, color: Color(0XFF818181)),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: size.width,
                        height: size.height * 0.01,
                      ),
                      Text(
                        "Add a Synopsis",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color(0xFF3F3D56),
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Container(
                        width: size.width * 0.9,
                        child: TextField(
                          maxLines: null, // Allow multi-line input
                          decoration: InputDecoration(
                            hintText: 'Short Synopsis About the Story',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide(
                                color: Color(0xFF818181),
                                width: 2.0,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide(
                                color: Color(0xFF2F2E41),
                                width: 2.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: size.width,
                padding: EdgeInsets.symmetric(vertical: 20.0),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 0.5, color: Color(0XFF818181)),
                    bottom: BorderSide(width: 0.5, color: Color(0XFF818181)),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: size.width,
                        height: size.height * 0.01,
                      ),
                      Text(
                        "Add the Table of Content",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color(0xFF3F3D56),
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Container(
                        width: size.width * 0.9,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: parts.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: size.width * 0.2,
                                      child: TextField(
                                        onChanged: (value) {
                                          setState(() {
                                            parts[index]['part'] = value;
                                          });
                                        },
                                        decoration: InputDecoration(
                                          hintText: 'Part',
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            borderSide: BorderSide(
                                              color: Color(0xFF818181),
                                              width: 2.0,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            borderSide: BorderSide(
                                              color: Color(0xFF2F2E41),
                                              width: 2.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 15.0),
                                    Container(
                                      width: size.width * 0.5,
                                      child: TextField(
                                        onChanged: (value) {
                                          setState(() {
                                            parts[index]['name'] = value;
                                          });
                                        },
                                        decoration: InputDecoration(
                                          hintText: 'Name of the Part',
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            borderSide: BorderSide(
                                              color: Color(0xFF818181),
                                              width: 2.0,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            borderSide: BorderSide(
                                              color: Color(0xFF2F2E41),
                                              width: 2.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.add),
                                      onPressed: addPart,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 7.0),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                alignment: Alignment.center,
                child: GetStartedButton(
                    text: 'START WRITING',
                    press: () {
                      Navigator.pushNamed(context, '/previewStory');
                    },
                    color: Color(0XFF00B4D8),
                    textColor: Colors.white,
                    width: 0.5),
              )
            ],
          ),
        ),
      ),
    );
  }
}
