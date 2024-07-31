import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:story/constants.dart';

class UserAuth {
  static var isTokenLoaded = false;
  static var token;
  static var user = {};

  Future<String?> loadToken() async {
    // Load token from storage
    final storage = new FlutterSecureStorage();
    token = await storage.read(key: "user_token");
    isTokenLoaded = true;
    return token ?? '';
  }

  Future<void> saveToken(String token) async {
    // Save token to storage
    final storage = new FlutterSecureStorage();
    await storage.write(key: "user_token", value: token);
    isTokenLoaded = true;
  }

  Future<void> deleteToken() async {
    // Delete token from storage
    final storage = new FlutterSecureStorage();
    await storage.delete(key: "user_token");
    token = null;
    isTokenLoaded = false;
  }


  Future<bool> isAuthenticated() async {
    // Check if token is present
    if (!isTokenLoaded) {
      await loadToken();
    }

    if (token == null) {
      return false;
    }

    // Check if token is valid
    final validate_url = Uri.parse(kServerDomain + "/api/articles/get-suggested");//"/api/user/get-current-user"); 
    final response = await http.post(validate_url, headers: {
      "Authorization": "Bearer " + token,
      "ngrok-skip-browser-warning": "true"
    });
    if (response.statusCode == 200) {
      // set user data from response // json
      user = jsonDecode(response.body);
      return true;
    } else {
      // check network error
      if (response.statusCode == 401) {
        await deleteToken();
      }
      return false;
    }
  }
}