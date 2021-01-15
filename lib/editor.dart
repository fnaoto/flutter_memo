import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_memo/memo.dart';

class Editor extends StatelessWidget {
  final String text;
  final MemoModel memo;
  final Function onChangedTextField;
  final Function onPressedDeleteButton;
  final Function onPressedPinnedButton;

  Editor(
      {this.text,
      this.memo,
      this.onChangedTextField,
      this.onPressedDeleteButton,
      this.onPressedPinnedButton});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Editor'),
        actions: <Widget>[
          ElevatedButton.icon(
              onPressed: () {
                onPressedDeleteButton(memo);
                moveToPreviousPage(context);
              },
              icon: const Icon(Icons.delete, size: 20),
              label: const Text('')),
          ElevatedButton.icon(
            onPressed: () {
              onPressedPinnedButton(memo);
              moveToPreviousPage(context);
            },
            icon: const Icon(Icons.push_pin, size: 20),
            label: const Text(''),
          ),
        ],
        leading: ElevatedButton.icon(
          onPressed: () => moveToPreviousPage(context),
          icon: const Icon(Icons.arrow_back, size: 20),
          label: const Text(''),
        ),
      ),
      body: new Container(
          padding: const EdgeInsets.all(5.0),
          child: new TextField(
            controller: TextEditingController(text: text),
            style: new TextStyle(color: Colors.black),
            onChanged: (text) {
              onChangedTextField(text: text, memo: memo);
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
