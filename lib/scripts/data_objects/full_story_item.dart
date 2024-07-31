
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:story/constants.dart';
import 'package:story/scripts/data_objects/comment_single.dart';
import 'package:story/scripts/user_auth.dart';

class FullStoryItem {
	String id;
	String user_id;
	String user_name;
	String title;
	String thumbnail;
	List<String> tags;
	int likes;
	int comments;
	String content;
	List<String>? body;
  bool didILiked = false;
  List<SingleComment> commentsList = [];

	FullStoryItem({
		required this.id,
		required this.user_id,
		required this.user_name,
		required this.title,
		required this.thumbnail,
		required this.tags,
		required this.likes,
		required this.comments,
		required this.content,
		this.body,
    this.didILiked = false,
	});

  Future<void> likeThisStory() async {
    final String token = (await UserAuth().loadToken()) ?? "";
    final Uri url = Uri.parse(kServerDomain + "/api/stories/add-delete-like");
    final response = await http.post(url, headers: {
      "Authorization": "Bearer " + token,
      "Content-Type": "application/json",
      "ngrok-skip-browser-warning": "true",
    }, body: jsonEncode({
      "story_id": id
    }));

    if (response.statusCode != 200){
      throw Exception("Failed to like the story");
    }

    var data = jsonDecode(response.body);
    this.likes = data["likes"];
    didILiked = data["liked"];
  }

  Future<bool> loadComments() async {
    try {
      commentsList = await SingleComment.fetchComments(id);
      return true;
    } catch (e) {
      return false;
    }
  }


	static Future<FullStoryItem?> fetchStory(String id) async {
		final String token = (await UserAuth().loadToken()) ?? "";
		final Uri url = Uri.parse(kServerDomain + "/api/articles/get-single");
		final response = await http.post(url, headers: {
			"Authorization": "Bearer " + token,
			"Content-Type": "application/json",
      "ngrok-skip-browser-warning": "true",
		}, body: jsonEncode({
			"story_id": id
		}));

		if (response.statusCode != 200){
			return null;
		}

		// {"articles":[]}
		var data = jsonDecode(response.body);
		if (data["story"] == null){
			return null;
		}

		return new FullStoryItem(
			id: data["story"]["_id"],
			user_id: data["story"]["user_id"],
			user_name: data["story"]["user_name"],	
			title: data["story"]["title"],
			thumbnail: data["story"]["thumbnail"]??"",
			tags: List<String>.from(data["story"]["tags"]),
			likes: data["story"]["likes"],
			comments: data["story"]["comments_count"],
			content: data["story"]["content"],
			body: [],
      didILiked: data["story"]["did_i_liked"]
		);
	}

  static Future<List<dynamic>> fetchStoryBody(String id) async{
    final String token = (await UserAuth().loadToken()) ?? "";
		final Uri url = Uri.parse(kServerDomain + "/api/articles/get-body");
		final response = await http.post(url, headers: {
			"Authorization": "Bearer " + token,
			"Content-Type": "application/json",
      "ngrok-skip-browser-warning": "true",
		}, body: jsonEncode({
			"story_id": id
		}));

		if (response.statusCode != 200){
			return [];
		}

    var data = jsonDecode(response.body);
		if (data["story"] == null){
			return [];
		}

    List<dynamic> body = [];
    for (var item in data["story"]){
      body.add({
        "type": item["type"],
        "content": item["content"]
      });
    }
    return body;
  } 

}