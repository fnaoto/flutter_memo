import 'package:flutter/material.dart';

ListView cardList(int _count) => ListView(
      children: List.generate(_count, (index) => _cardView(index)),
    );

Card _cardView(int index) => Card(
      child: Column(children: <Widget>[
        Container(
          margin: EdgeInsets.all(10.0),
          child: ListTile(
            title: Text("タイトル"),
            leading: Icon(Icons.message),
            subtitle: Text("サブタイトル"),
          ),
        )
      ]),
    );
