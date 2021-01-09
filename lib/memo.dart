import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'data.dart';

class MemoModel {
  MemoModel({this.pin = false, this.text = ""});

  bool pin;
  String text;
}

class Memo {
  int currentIndex = 0;
  String dataKeyName = "memo";
  List<MemoModel> memoList = new List<MemoModel>();
  Data data = new Data();

  Future<void> initText() async {
    currentIndex = await data.getIntData(dataKeyName);
    for (int i = 0; i < currentIndex; i++) {
      memoList[i].text = await data.getStringData(i.toString());
      memoList[i].pin = await data.getBoolData(i.toString());
    }
    debugPrint("initText: " + currentIndex.toString());
  }

  void addText(String text) {
    memoList.add(MemoModel());
    currentIndex = memoList.length;
    memoList[currentIndex].text = text;
    memoList[currentIndex].pin = false;
    data.updateStringData(currentIndex.toString(), text);
    data.updateBoolData(currentIndex.toString(), false);
  }

  List<String> getAllText() {
    List<String> textList = new List<String>();
    memoList.forEach((memo) {
      textList.add(memo.text);
    });
    return textList;
  }

  void updateText(String text, int index) {
    memoList[index].text = text;
    data.updateStringData(index.toString(), text);
  }

  void deleteText(int index) {
    memoList.removeAt(index);
    data.updateIntData(dataKeyName, --currentIndex);
  }

  void addPin(int index) {
    memoList[index].pin = true;
    data.updateBoolData(index.toString(), true);
  }
}
