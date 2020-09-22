import 'data.dart';

class Memo {
  bool isLoading = true;
  var textList = new List<String>();
  int currentIndex = 0;
  String dataKeyName = "memo";
  
  Memo({this.isLoading, this.textList, this.currentIndex});

  void initMemo() {
    textList = getStringList(dataKeyName);
    isLoading = false;
  }

  void addMemo(String memo) {
    textList.add(memo);
    currentIndex = textList.length - 1;
    storeStringList(dataKeyName, textList);
  }

  String getCurrentMemo() {
    return textList[currentIndex];
  }

  void updateCurrentMemo(String memo) {
    textList[currentIndex] = memo;
    storeStringList(dataKeyName, textList);
  }
}
