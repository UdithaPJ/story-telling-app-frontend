


import 'package:flutter/material.dart';
import 'package:story/components/StoryComments/story_comment_single.dart';
import 'package:story/scripts/data_objects/comment_single.dart';
import 'package:story/scripts/data_objects/full_story_item.dart';

class StoryCommentsContainer extends StatefulWidget {
  final FullStoryItem story;

  const StoryCommentsContainer({Key? key, required this.story}) : super(key: key);

  @override
  State<StoryCommentsContainer> createState() => _StoryCommentsContainerState(story:story);
}


class _StoryCommentsContainerState extends State<StoryCommentsContainer> {
  bool isLoadingComments = true;
  final FullStoryItem story;

  _StoryCommentsContainerState({required this.story}){
    story.loadComments().then((value) => 
      setState(() {
        isLoadingComments = false;
      })
    );
  }


  @override
  Widget build(BuildContext context) {

    if (isLoadingComments){
      return Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return ListView.builder(
      itemCount: story.commentsList.length,
      itemBuilder: (context, index){
        return StoryCommentComponent(comment: story.commentsList[index]);
      });
  }
}