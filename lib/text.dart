import 'package:flutter/material.dart';

TextField textField(String _text) => TextField(
      controller: TextEditingController(text: _text),
      autocorrect: false,
      textInputAction: TextInputAction.send,
      decoration: InputDecoration(
        labelText: 'memo',
        hintText: '',
      ),
      style: TextStyle(
        color: Colors.black,
        fontSize: 18.0,
      ),
      cursorColor: Colors.blue,
      maxLines: 3,
    );
