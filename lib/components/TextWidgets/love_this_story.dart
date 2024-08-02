import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:story/scripts/data_objects/full_story_item.dart';


class LoveThisStoryBtn extends StatefulWidget{
  FullStoryItem story;

  LoveThisStoryBtn({required this.story});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _LoveThisStoryBtnState(story:this.story);
  }
  
}

class _LoveThisStoryBtnState extends State{
  bool loved = false;
  FullStoryItem story;

  _LoveThisStoryBtnState({required this.story});

  @override
  void initState() {
    // TODO: implement initState
    if (story.didILiked){
      loved = true;
    }
    super.initState();
  }

  void onTap(){
    story.likeThisStory().then(
      (value) =>{
        setState(() {
          loved = story.didILiked;
        })
      }
    );
    setState(() {
      loved = !loved;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        child: TapRegion(child: Padding(
          padding: EdgeInsets.only(
            bottom: 8,
            left: 0,
            right: 0,
            top: 8
          ),
          child: Row(
            children: [
              Icon(
                Icons.favorite,
                color: (loved?Colors.red:Colors.black),
              ),
              Text(
                "Love this story",
                style: TextStyle(
                  color: (loved?Colors.red:Colors.black)
                ),
              )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
        ),
        ),
        onTapInside: (event) {
          onTap();
        },
      ),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey, width: 1))
      ),
    );
  }

}