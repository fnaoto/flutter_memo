import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'data.dart';

class Memo {
  int currentIndex = 0;
  String dataKeyName = "memo";
  List<String> textList = new List<String>();
  Data data = new Data();

  Future<void> initText() async {
    textList = await data.getStringListData(dataKeyName);
    currentIndex = textList.length - 1;
    debugPrint("initText: " + textList.toString());
  }

  void addText(String text) {
    textList.add(text);
    currentIndex = textList.length - 1;
    data.updateStringListData(dataKeyName, textList);
  }

  String getText() {
    return textList[currentIndex];
  }

  void updateText(String text, int index) {
    textList[index] = text;
    data.updateStringListData(dataKeyName, textList);
  }

  void deleteText(int index) {
    textList.removeAt(index);
    data.updateStringListData(dataKeyName, textList);
  }
}
