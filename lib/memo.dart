import 'data.dart';

class Memo {
  bool isLoading = true;
  int currentIndex = 0;
  String dataKeyName = "memo";
  List<String> textList = new List<String>();

  Memo({this.isLoading, this.currentIndex});

  void initText() {
    textList = getStringListData(dataKeyName);
    currentIndex = textList.length - 1;
    isLoading = false;
  }

  void addText(String text) {
    textList.add(text);
    currentIndex = textList.length - 1;
    storeStringListData(dataKeyName, textList);
  }

  String getText() {
    return textList[currentIndex];
  }

  void updateText(String text, int index) {
    textList[index] = text;
    storeStringListData(dataKeyName, textList);
  }
}
