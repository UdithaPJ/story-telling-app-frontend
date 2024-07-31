

import 'dart:convert';

import 'package:story/constants.dart';
import 'package:http/http.dart' as http;
import 'package:story/scripts/user_auth.dart';

class UserInteractionTracker {

  static void trackUserInteraction(String story_id, String action, int? duration) async {
    final String token = (await UserAuth().loadToken()) ?? "";
    final Uri url = Uri.parse(kServerDomain + "/api/user/ints/record");
    final response = await http.post(url, 
      headers: {
        "Authorization": "Bearer " + token,
        "ngrok-skip-browser-warning": "true",
      "Content-Type": "application/json",
      },
      body: jsonEncode({
        "story_id": story_id,
        "action": action,
        "duration": duration
      })
    );
    print(response.body);
  }

  static void OnClickReadStory(String storyId) {
    trackUserInteraction(storyId, 'read', 0);
  }

  static void OnReadForNMins(String storyId, int minutes) {
    trackUserInteraction(storyId, 'read', minutes);
  }
}