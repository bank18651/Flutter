import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelper {
  static final String _keyAccessToken = 'accessToken';

  Future<String> getAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyAccessToken);
  }

  void saveAccessToken(String accessToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyAccessToken, accessToken);
  }

  void clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
