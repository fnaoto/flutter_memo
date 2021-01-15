import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'data.dart';
import 'dart:convert';

class MemoModel {
  bool pin;
  String text;

  MemoModel({this.pin = false, this.text = ""});

  MemoModel.fromJson(String jsonString)
      : pin = json.decode(jsonString)['pin'],
        text = json.decode(jsonString)['text'];

  String toJson() {
    return json.encode({"pin": pin, "text": text});
  }
}

class Memo {
  String dataKeyName = "memo";
  List<String> _textList = new List<String>.empty(growable: true);
  List<MemoModel> _memoList = new List<MemoModel>.empty(growable: true);
  Data data = new Data();

  Future<void> initText() async {
    _textList = await data.getStringListData(dataKeyName);
    debugPrint("initText: " + _textList.toString());
    for (var text in _textList) {
      _memoList.add(new MemoModel.fromJson(text));
    }
  }

  void addText({String text, bool pin}) {
    MemoModel memo = new MemoModel(pin: pin, text: text);
    _memoList.add(memo);
    _textList.add(memo.toJson());
    data.updateStringListData(dataKeyName, _textList);
  }

  String getCurrentText() {
    return _memoList.last.text;
  }

  MemoModel getCurrentMemo() {
    return _memoList.last;
  }

  List<MemoModel> getMemoList() {
    return getPinnedMemoList() + getUnPinnedMemoList();
  }

  List<MemoModel> getPinnedMemoList() {
    List<MemoModel> memoList = [];
    for (var memo in _memoList) {
      if (memo.pin) memoList.add(memo);
    }
    return memoList;
  }

  List<MemoModel> getUnPinnedMemoList() {
    List<MemoModel> memoList = [];
    for (var memo in _memoList) {
      if (!memo.pin) memoList.add(memo);
    }
    return memoList;
  }

  void updateText({String text, bool pin, MemoModel memo}) {
    for (int i = 0; i < _memoList.length; i++) {
      if (_memoList[i].text == memo.text) {
        _memoList[i].text = text;
        _memoList[i].pin = pin;
        _textList[i] = _memoList[i].toJson();
      }
    }
    data.updateStringListData(dataKeyName, _textList);
  }

  void deleteText(MemoModel memo) {
    _textList.remove(memo.toJson());
    _memoList.remove(memo);
    data.updateStringListData(dataKeyName, _textList);
  }
}
