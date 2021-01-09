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

  Future<String> getStringData(String key) async {
    var perfs = await _getInstance();
    var getString = perfs.getString(key);
    debugPrint("getStringData: " + getString);
    return getString;
  }

  Future<int> getIntData(String key) async {
    var perfs = await _getInstance();
    var getInt = perfs.getInt(key);
    debugPrint("getIntData: " + getInt.toString());
    return getInt;
  }

  Future<bool> getBoolData(String key) async {
    var perfs = await _getInstance();
    var getBool = perfs.getBool(key);
    debugPrint("getBoolData: " + getBool.toString());
    return getBool;
  }

  void updateStringListData(String key, List<String> value) async {
    final perfs = await _getInstance();
    final update = await perfs.setStringList(key, value);

    if (!update) {
      debugPrint("Fail to update key: $key");
    }
  }

  void updateStringData(String key, String value) async {
    final perfs = await _getInstance();
    final update = await perfs.setString(key, value);

    if (!update) {
      debugPrint("Fail to update key: $key");
    }
  }

  void updateIntData(String key, int value) async {
    final perfs = await _getInstance();
    final update = await perfs.setInt(key, value);

    if (!update) {
      debugPrint("Fail to update key: $key");
    }
  }

  void updateBoolData(String key, bool value) async {
    final perfs = await _getInstance();
    final update = await perfs.setBool(key, value);

    if (!update) {
      debugPrint("Fail to update key: $key");
    }
  }

  void deleteData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final remove = await prefs.remove(key);

    if (!remove) {
      debugPrint("Fail to delete key: $key");
    }
  }
}
