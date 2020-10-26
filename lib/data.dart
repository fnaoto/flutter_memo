import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<String> getStringList(String key) {
  var _memoList = new List<String>();

  SharedPreferences.getInstance().then((prefs) {
    if (prefs.containsKey(key)) {
      _memoList = prefs.getStringList(key);
    } else {
      debugPrint("Fail to get key: $key");
    }
  });

  print("get memo list: $_memoList");

  return _memoList;
}

void storeStringList(String key, List<String> value) async {
  final prefs = await SharedPreferences.getInstance();
  final update = await prefs.setStringList(key, value);

  if (!update) {
    debugPrint("Fail to update key: $key");
  }
}

void deleteStringList(String key) async {
  final key = "memo";
  final prefs = await SharedPreferences.getInstance();
  final remove = await prefs.remove(key);

  if (!remove) {
    debugPrint("Fail to delete key: $key");
  }
}
