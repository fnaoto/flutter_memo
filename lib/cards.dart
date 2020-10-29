import 'package:flutter/material.dart';
import 'memo.dart';

GridView createCardGridView(Memo memo, Function _onTap) {
  return GridView.count(
    crossAxisCount: 2,
    children: createCardList(memo, _onTap),
  );
}

List<Card> createCardList(Memo memo, Function _onTap) {
  var _cardList = new List<Card>();

  memo.textList.asMap().forEach((int index, String text) {
    _cardList.add(
      Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
            child: Text(text),
            onTap: () => _onTap(text, index),
          ),
        ),
      ),
    );
  });

  return _cardList;
}
