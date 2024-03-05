import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  static setData(String key, dynamic value) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }

  static getData(String key) async {
    var prefs = await SharedPreferences.getInstance();
    String? data = prefs.getString(key);
    return json.decode(data!);
  }

  static removeData(String key) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  static clear() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
