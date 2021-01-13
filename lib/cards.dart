import 'package:flutter/material.dart';
import 'package:flutter_memo/memo.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

StaggeredGridView createCardGridView(
    List<MemoModel> memoList, Function _onTap) {
  List<Card> ccl = createCardList(memoList, _onTap);
  return StaggeredGridView.countBuilder(
    crossAxisCount: 4,
    itemCount: ccl.length,
    itemBuilder: (BuildContext context, int index) => ccl[index],
    staggeredTileBuilder: (int index) => new StaggeredTile.fit(2),
    mainAxisSpacing: 1.0,
    crossAxisSpacing: 1.0,
  );
}

List<Card> createCardList(List<MemoModel> memoList, Function _onTap) {
  List<Card> _cardList = new List<Card>.empty(growable: true);

  memoList.forEach((MemoModel memo) {
    _cardList.add(
      Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
            child: Text(memo.text, maxLines: 10),
            onTap: () => _onTap(memo: memo),
          ),
        ),
      ),
    );
  });

  return _cardList;
}
