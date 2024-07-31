


import 'dart:convert';

import 'package:story/constants.dart';
import 'package:http/http.dart' as http;
import 'package:story/scripts/user_auth.dart';

class SingleComment {
  String id;
  String user_id;
  String user_name;
  String comment;
  String? reply_to;

  SingleComment({
    required this.id,
    required this.user_id,
    required this.user_name,
    required this.comment,
    this.reply_to
  });

  static Future<List<SingleComment>> fetchComments(String story_id) async {
		final String token = (await UserAuth().loadToken()) ?? "";
    final Uri url = Uri.parse(kServerDomain + "/api/stories/get-comments");

    final response = await http.post(url, headers: {
			"Authorization": "Bearer " + token,
      "Content-Type": "application/json",
      "ngrok-skip-browser-warning": "true"
    }, body: jsonEncode({
      "story_id": story_id
    }));

    if (response.statusCode != 200){
      return [];
    }

    var data = jsonDecode(response.body);
    if (data["comments"] == null){
      return [];
    }

    List<SingleComment> comments = [];
    for (var comment in data["comments"]){
      comments.add(new SingleComment(
        id: comment["_id"],
        user_id: comment["user_id"]??"",
        user_name: comment["user_name"]??"",
        comment: comment["comment"],
        reply_to: comment["reply_to"]??""
      ));
    }

    return comments;
  }
}