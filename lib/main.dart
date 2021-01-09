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
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
              child: createCardGridView(_memo.getPinnedMemoList(), _onTap)),
          Expanded(
              child: createCardGridView(_memo.getUnPinnedMemoList(), _onTap)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addMemo,
        tooltip: 'Add memo',
        child: Icon(Icons.add),
      ),
    );
  }

  void _addMemo() {
    setState(() {
      _memo.addText(text: "", pin: false);
      moveToNextPage(new Editor(
          text: _memo.getCurrentText(),
          memo: _memo.getCurrentMemo(),
          onChangedTextField: _onChangedTextField,
          onPressedDeleteButton: _onPressedDeleteButton,
          onPressedPinnedButton: _onPressedPinnedButton));
    });
  }

  void _onChangedTextField({String text, MemoModel memo}) {
    setState(() {
      _memo.updateText(text: text, pin: memo.pin, memo: memo);
    });
  }

  void _onPressedDeleteButton(MemoModel memo) {
    setState(() {
      _memo.deleteText(memo);
    });
  }

  void _onPressedPinnedButton(MemoModel memo) {
    setState(() {
      _memo.updateText(text: memo.text, pin: !memo.pin, memo: memo);
    });
  }

  void _onTap({MemoModel memo}) {
    setState(() {
      moveToNextPage(new Editor(
          text: memo.text,
          memo: memo,
          onChangedTextField: _onChangedTextField,
          onPressedDeleteButton: _onPressedDeleteButton,
          onPressedPinnedButton: _onPressedPinnedButton));
    });
  }

  void moveToNextPage(Widget widget) {
    Navigator.of(context).push(MaterialPageRoute<void>(
      builder: (BuildContext context) {
        return widget;
      },
    ));
  }
}
