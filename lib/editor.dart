import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final String text;
  final int currentIndex;
  final Function onChangedTextField;
  final Function onPressedDeleteButton;
  final Function onPressedPinnedButton;

  Editor(
      {this.text,
      this.currentIndex,
      this.onChangedTextField,
      this.onPressedDeleteButton,
      this.onPressedPinnedButton});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Editor'),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              onPressedDeleteButton(currentIndex);
              moveToPreviousPage(context);
            },
            child: Icon(Icons.delete),
          ),
          FlatButton(
            onPressed: () {
              onPressedPinnedButton(currentIndex);
              focusOwnWidget(context); //FIXME
            },
            child: Icon(Icons.push_pin),
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
            controller: TextEditingController(text: text),
            style: new TextStyle(color: Colors.black),
            onChanged: (text) {
              onChangedTextField(text, currentIndex);
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
