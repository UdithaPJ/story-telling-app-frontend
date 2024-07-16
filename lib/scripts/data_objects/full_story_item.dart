
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:story/constants.dart';
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
		this.body
	});


	static Future<FullStoryItem?> fetchStory(String id) async {
		final String token = (await UserAuth().loadToken()) ?? "";
		final Uri url = Uri.parse(kServerDomain + "/api/articles/get-single");
		final response = await http.post(url, headers: {
			"Authorization": "Bearer " + token,
			"Content-Type": "application/json",
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
			body: List<String>.from(data["story"]["body"])
		);
	}
}