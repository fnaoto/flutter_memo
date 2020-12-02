import 'package:flutter/material.dart';
import 'cards.dart';
import 'memo.dart';
import 'editor.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Memo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomeMemoPage(title: 'Memo'),
    );
  }
}

class MyHomeMemoPage extends StatefulWidget {
  MyHomeMemoPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomeMemoPage> createState() => _MyHomeMemoPageState();
}

class _MyHomeMemoPageState extends State<MyHomeMemoPage> {
  Memo _memo = new Memo();

  @override
  void initState() {
    super.initState();
    initMemo();
  }

  Future<void> initMemo() async {
    await _memo.initText();
    setState(() {
      this.build(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("build");
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: createCardGridView(_memo, _onTap),
      floatingActionButton: FloatingActionButton(
        onPressed: _addMemo,
        tooltip: 'Add memo',
        child: Icon(Icons.add),
      ),
    );
  }

  void _addMemo() {
    setState(() {
      _memo.addText("");
      moveToNextPage(new Editor(
          text: _memo.getText(),
          currentIndex: _memo.currentIndex,
          onChangedTextField: _onChangedTextField,
          onPressedDeleteButton: _onPressedDeleteButton,
          onPressedPinnedButton: _onPressedPinnedButton));
    });
  }

  void _onChangedTextField(String text, int index) {
    setState(() {
      _memo.updateText(text, index);
    });
  }

  void _onPressedDeleteButton(int index) {
    setState(() {
      _memo.deleteText(index);
    });
  }

  void _onPressedPinnedButton(String text, int index) {
    setState(() {
      _memo.updateText(text, index);
    });
  }

  void _onTap(String text, int index) {
    moveToNextPage(new Editor(
        text: text,
        currentIndex: index,
        onChangedTextField: _onChangedTextField,
        onPressedDeleteButton: _onChangedTextField));
  }

  void moveToNextPage(Widget widget) {
    Navigator.of(context).push(MaterialPageRoute<void>(
      builder: (BuildContext context) {
        return widget;
      },
    ));
  }
}
