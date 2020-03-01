import 'package:flutter/material.dart';

ListView cardList(int _count) => ListView(
      children: List.generate(_count, (index) => _cardView(index)),
    );

Card _cardView(int index) => Card(
      child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            print('Card tapped.');
          },
          child: Container(
            margin: EdgeInsets.all(10.0),
            child: ListTile(
              title: Text("タイトル"),
              leading: Icon(Icons.message),
              subtitle: Text("サブタイトル"),
            ),
          )),
    );
