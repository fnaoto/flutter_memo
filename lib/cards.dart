import 'package:flutter/material.dart';

GridView createCardGridView(List<String> textList) {
  return GridView.count(
    crossAxisCount: 2,
    children: createCardList(textList),
  );
}

List<Card> createCardList(List<String> textList) {
  var _cardList = new List<Card>();

  textList.forEach((String text) {
    _cardList.add(
      Card(
        child: Padding(padding: const EdgeInsets.all(16.0), child: Text(text)),
      ),
    );
  });

  return _cardList;
}
