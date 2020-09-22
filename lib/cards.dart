import 'package:flutter/material.dart';

ListView cardListView(List<Card> cardList) {
  return ListView(
    children: cardList,
  );
}

ListView createCardListView(List<String> textList) {
  return cardListView(createCardList(textList));
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
