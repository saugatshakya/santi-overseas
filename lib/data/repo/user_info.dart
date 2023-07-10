import 'package:shared_preferences/shared_preferences.dart';

class UserInfo {
  SharedPreferences? _prefs;
  init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  saveUserInfo(String userInfo) async {
    _prefs = await SharedPreferences.getInstance();
    _prefs!.setString("userInfo", userInfo);
  }

  getUserInfo() async {
    _prefs = await SharedPreferences.getInstance();
    String? data = _prefs!.getString("userInfo");
    return data;
  }

  clearUserInfo() async {
    _prefs = await SharedPreferences.getInstance();
    _prefs!.remove("userInfo");
  }
}

final UserInfo repo = UserInfo();
