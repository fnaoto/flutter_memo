import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final String _text;
  final int _currentIndex;
  final Function _onChanged;
  final Function _onPressed;

  Editor(this._text, this._currentIndex, this._onChanged, this._onPressed);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Editor'),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              _onPressed(_currentIndex);
              moveToPreviousPage(context);
            },
            child: Icon(Icons.delete),
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
            controller: TextEditingController(text: _text),
            style: new TextStyle(color: Colors.black),
            onChanged: (text) {
              _onChanged(text, _currentIndex);
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
