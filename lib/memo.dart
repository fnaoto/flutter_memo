import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'data.dart';

class MemoModel {
  MemoModel({this.pin = false, this.text = ""});

  Data data = new Data();
  bool pin;
  String text;
  String hashListKey = "hashListKey";

  Future<void> initData() async {
    pin = await data.getBoolData("pin" + _createHash());
    text = await data.getStringData("text" + _createHash());
  }

  Future<List<String>> getHashKeyList() async {
    return await data.getStringListData(this.hashListKey);
  }

  void updateHashKeyList(List<String> value) {
    data.updateStringListData(this.hashListKey, value);
  }

  void updateData(String txt, bool pn) {
    data.updateBoolData("pin" + _createHash(), pn);
    data.updateStringData("text" + _createHash(), txt);
  }

  void deleteData() {
    data.deleteData("pin" + _createHash());
    data.deleteData("text" + _createHash());
  }

  String _createHash() {
    var bytes = utf8.encode(this.text + this.pin.toString());
    var digest = sha256.convert(bytes);
    return digest.toString();
  }
}

class Memo {
  int currentIndex = 0;
  String dataKeyName = "memo";
  List<MemoModel> memoList = new List<MemoModel>();

  Future<void> initText() async {
    currentIndex = await data.getIntData(dataKeyName);
    for (int i = 0; i < currentIndex; i++) {
      memoList[i].initData(i.toString());
    }
    debugPrint("initText: " + currentIndex.toString());
  }

  void addText(String text) {
    memoList.add(new MemoModel());
    currentIndex = memoList.length;
    memoList[currentIndex].text = text;
    memoList[currentIndex].pin = false;
    memoList[currentIndex].updateData(currentIndex.toString());
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
    memoList[index].updateData(index.toString());
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
