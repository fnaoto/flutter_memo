import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<String> _textList = new List<String>();

List<String> getStringListData(String key) {
  _getString(key);
  return _textList;
}

void _getString(String key) {
  SharedPreferences.getInstance().then((prefs) {
    if (prefs.containsKey(key)) {
      _textList = prefs.getStringList(key);
      debugPrint("Get text list: $_textList");
    } else {
      debugPrint("Fail to get key: $key");
    }
  });
}

void storeStringListData(String key, List<String> value) async {
  final prefs = await SharedPreferences.getInstance();
  final update = await prefs.setStringList(key, value);

  if (!update) {
    debugPrint("Fail to update key: $key");
  }
}

void deleteStringListData(String key) async {
  final key = "memo";
  final prefs = await SharedPreferences.getInstance();
  final remove = await prefs.remove(key);

  if (!remove) {
    debugPrint("Fail to delete key: $key");
  }
}
