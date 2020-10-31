import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Data {
  Future<SharedPreferences> _getInstance() => SharedPreferences.getInstance();

  Future<List<String>> getStringListData(String key) async {
    var perfs = await _getInstance();
    var textList = perfs.getStringList(key);
    debugPrint("getStringListData: " + textList.toString());
    return textList;
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
}
