

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:story/constants.dart';
import 'package:story/scripts/user_auth.dart';

class SimpleStoryItem{
	String? id;
	String user_id;
	String user_name;
	String title;
	String thumbnail;
	List<String> tags;
	int likes;
	int comments;

	SimpleStoryItem({
		this.id,
		required this.user_id,
		required this.user_name,
		required this.title,
		required this.thumbnail,
		required this.tags,
		required this.likes,
		required this.comments
	});

	static Future<List<SimpleStoryItem>> fetchStories() async {
		// Fetch stories from the server
		final String token = (await UserAuth().loadToken()) ?? "";
		final Uri url = Uri.parse(kServerDomain + "/api/articles/get-suggested");
		final response = await http.post(url, headers: {
		"Authorization": "Bearer " + token
		});

		if (response.statusCode != 200){
		throw Exception("Failed to load stories");
		}

		// {"articles":[]}
		var articles = jsonDecode(response.body);
		if (articles["articles"] == null){
		return [];
		}

		List<SimpleStoryItem> stories = [];
		for (var st in articles["articles"]){
		stories.add(SimpleStoryItem(
			id: st["_id"],
			user_id: st["user_id"],
			user_name: st["user_name"],
			title: st["title"],
			thumbnail: st["thumbnail"]??"",
			tags: List<String>.from(st["tags"]),
			likes: st["likes"],
			comments: st["comments_count"]
		));
		}
		
		return stories;
	}
}