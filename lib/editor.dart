import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'memo.dart';

class Editor extends StatelessWidget {
  Memo _memo;
  Function _onChanged;

  Editor(this._memo, this._onChanged);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Editor'),
        actions: <Widget>[
          FlatButton(
            onPressed: () => focusOwnWidget(context),
            child: Icon(Icons.check),
          ),
        ],
        leading: FlatButton(
          onPressed: () => moveToPreviousPage(context),
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: new Container(
          padding: const EdgeInsets.all(16.0),
          child: new TextField(
            controller: TextEditingController(text: _memo.getText()),
            style: new TextStyle(color: Colors.black),
            onChanged: (text) {
              _onChanged(text, _memo);
            },
            autofocus: true,
            maxLines: 1000,
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
          )),
    );
  }

  void focusOwnWidget(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  void moveToPreviousPage(BuildContext context) {
    Navigator.of(context).pop();
  }
}
