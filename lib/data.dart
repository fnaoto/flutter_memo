import 'package:shared_preferences/shared_preferences.dart';

class Memo {
  String id;
  String text;

  Memo(this.id, this.text);

  Memo.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        text = json['text'];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'text': text,
    };
  }
}

Future<List<Memo>> getAllMemos() async {
  Set<String> allKeys;
  List<Memo> memoMaps;

  final SharedPreferences prefs = await SharedPreferences.getInstance();
  allKeys = prefs.getKeys();
  allKeys.forEach((String key) {
    Memo memo = Memo.fromJson({'id': key, "text": prefs.getString(key)});
    memoMaps.add(memo);
  });
  print("get all keys");
  return memoMaps;
}

Future<String> getMemo(String key) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  print("get memo: $key");
  return prefs.getString(key);
}

Future storeMemo(String key, String value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(key, value);
  print("update memo: $key");
}

Future deleteMemo(String key) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove(key);
}
