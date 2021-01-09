import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'data.dart';
import 'dart:convert';

class MemoModel {
  bool pin;
  String text;

  MemoModel({this.pin = false, this.text = ""});

  MemoModel.fromJson(Map<String, dynamic> json)
      : pin = json['pin'],
        text = json['text'];

  Map<String, dynamic> toJson() => {'pin': pin, 'text': text};
  String toString() => "{'pin': ${this.pin}, 'text': ${this.text}}";
}

class Memo {
  int currentIndex = 0;
  String dataKeyName = "memo";
  List<String> textList = new List<String>();
  List<MemoModel> memoList = new List<MemoModel>();
  Data data = new Data();

  Future<void> initText() async {
    textList = await data.getStringListData(dataKeyName);
    debugPrint("initText: " + textList.toString());
    for (var text in textList) {
      memoList.add(new MemoModel.fromJson(json.decode(text)));
    }
    currentIndex = memoList.length - 1;
  }

  void addText(String text) {
    MemoModel memo = new MemoModel(pin: false, text: text);
    memoList.add(memo);
    textList.add(memo.toString());
    currentIndex = memoList.length - 1;
    data.updateStringListData(dataKeyName, textList);
  }

  String getText() {
    return memoList[currentIndex].text;
  }

  void updateText(String text, int index) {
    memoList[index].text = text;
    textList[index] = memoList[index].toString();
    data.updateStringListData(dataKeyName, textList);
  }

  void deleteText(int index) {
    textList.removeAt(index);
    memoList.removeAt(index);
    data.updateStringListData(dataKeyName, textList);
  }
}
