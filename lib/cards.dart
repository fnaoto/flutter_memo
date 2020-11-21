import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'memo.dart';

StaggeredGridView createCardGridView(Memo memo, Function _onTap) {
  List<Card> ccl = createCardList(memo, _onTap);
  return StaggeredGridView.countBuilder(
    crossAxisCount: 4,
    itemCount: ccl.length,
    itemBuilder: (BuildContext context, int index) => ccl[index],
    staggeredTileBuilder: (int index) => new StaggeredTile.fit(2),
    mainAxisSpacing: 1.0,
    crossAxisSpacing: 1.0,
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
            child: Text(text, maxLines: 3),
            onTap: () => _onTap(text, index),
          ),
        ),
      ),
    );
  });

  return _cardList;
}
