import 'package:flutter/material.dart';
import 'memo.dart';

GridView createCardGridView(List<Memo> memoList, Function _onTap) {
  return GridView.count(
    crossAxisCount: 2,
    children: createCardList(memoList, _onTap),
  );
}

List<Card> createCardList(List<Memo> memoList, Function _onTap) {
  var _cardList = new List<Card>();

  memoList.forEach((Memo memo) {
    _cardList.add(
      Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
            child: Text(memo.getText()),
            onTap: () => _onTap(memo),
          ),
        ),
      ),
    );
  });

  return _cardList;
}
