import 'package:flutter/material.dart';
import 'package:flutter_memo/data.dart';
import 'text.dart';

Future<ListView> futureCardList(int _count,
    {Future<List<Card>> initCardList}) async {
  Memo memo = Memo.fromJson({'id': '$_count', "text": ''});
  return ListView(
    children:
        List.generate(_count, (index) => cardView(memo)) + await initCardList,
  );
}

ListView cardList(int _count) {
  Memo memo = Memo.fromJson({'id': '$_count', "text": ''});
  return ListView(
    children: List.generate(_count, (index) => cardView(memo)),
  );
}

Card cardView(Memo memo) => Card(
      child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            print("Card tapped.");
            getMemo(memo.id);
          },
          onTapCancel: () {
            print("Card tapped canceld.");
            storeMemo(memo.id, memo.text);
          },
          child: Container(
            margin: EdgeInsets.all(10.0),
            child: textField(memo.text),
          )),
    );
