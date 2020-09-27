import 'data.dart';

class Memo {
  bool isLoading = true;
  String text = "";
  int currentIndex = 0;
  String dataKeyName = "memo";

  Memo({this.isLoading, this.text, this.currentIndex});

  var _textList = new List<String>();

  void initText() {
    _textList = getStringList(dataKeyName);
    currentIndex = _textList.length - 1;
    isLoading = false;
  }

  void addText(String text) {
    _textList.add(text);
    currentIndex = _textList.length - 1;
    storeStringList(dataKeyName, _textList);
  }

  String getText() {
    return _textList[currentIndex];
  }

  void updateText(String text) {
    _textList[currentIndex] = text;
    storeStringList(dataKeyName, _textList);
  }
}
