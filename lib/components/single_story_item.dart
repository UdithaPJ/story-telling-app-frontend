

import 'package:flutter/material.dart';
import 'package:story/components/simple_text_button.dart';
import 'package:story/constants.dart';
import 'package:story/scripts/data_objects/simple_story_item.dart';

class SingleStoryItem extends StatelessWidget{
	final SimpleStoryItem story;

	SingleStoryItem({required this.story});

	@override
	Widget build(BuildContext context){
    	Size size = MediaQuery.of(context).size;
		return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/selectedStoryDetails', arguments: {"id": story.id??""});
                  },
                  child: Container(
                    width: size.width,
                    height: size.height * 0.27,
                    decoration: const BoxDecoration(
                      //color: Colors.white,
                      border: Border(
                        bottom: BorderSide(
                          color: Color(0XFF818181),
                          width: 0.25,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment
                              .start, // Align children to the start
                          children: [
                            (story.thumbnail == "")?
								Image.asset('assets/images/story-image-list.jpg', width: 150, height: 175):
								Image.network(kServerDomain + story.thumbnail, width: 150, height: 175),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    story.title,
                                    style: TextStyle(
                                      color: Color(0xFF3F3D56),
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'by ' + story.user_name,
                                    style: TextStyle(
										color: Color(0xFF818181),
										fontFamily: 'Lato',
										fontWeight: FontWeight.bold,
										fontSize: 13,
                                    ),
                                  ),
                                  SizedBox(height: 7),
                                  Text(
                                    story.likes.toString() + ' likes',
                                    style: TextStyle(
                                      color: Color(0xFF818181),
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13,
                                    ),
                                  ),
                                  SizedBox(height: 3),
                                  Text(
									"",
                                    style: TextStyle(
                                      color: Color(0xFF818181),
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.normal,
                                      fontSize: 11,
                                    ),
                                    //maxLines: 7,
                                  ),
                                  SizedBox(height: 3),
                                  Row(
                                    children: [
                                      SimpleTextButton(
                                        text: 'Read',
                                        color:
                                            Color(0XFF00B4D8).withOpacity(0.5),
                                        textColor: Colors.white,
                                        width: 0.24,
                                        height: 0.03,
                                        textSize: 10.0,
                                      ),
                                      SizedBox(width: 8.0), // Space between buttons
                                      
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
	}
}