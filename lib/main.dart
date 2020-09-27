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
  _MyHomeMemoPageState createState() => _MyHomeMemoPageState();
}

class _MyHomeMemoPageState extends State<MyHomeMemoPage> {
  var _memo = new Memo();
  var _memoList = new List<Memo>();

  @override
  void initState() {
    super.initState();
    this._memo.initText();
  }

  @override
  Widget build(BuildContext context) {
    if (_memo.isLoading) {
      return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: CircularProgressIndicator());
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: createCardGridView(_memoList, _onTap),
        floatingActionButton: FloatingActionButton(
          onPressed: _addMemo,
          tooltip: 'Add memo',
          child: Icon(Icons.add),
        ),
      );
    }
  }

  void _addMemo() {
    setState(() {
      _memo = new Memo();
      _memo.initText();
      _memo.addText("");
      _memoList.add(_memo);
      moveToNextPage(new Editor(_memo, _onChanged));
    });
  }

  void _onChanged(String text, Memo memo) {
    setState(() {
      memo.updateText(text);
    });
  }

  void _onTap(Memo memo) {
    moveToNextPage(new Editor(memo, _onChanged));
  }

  void moveToNextPage(Widget widget) {
    Navigator.of(context).push(MaterialPageRoute<void>(
      builder: (BuildContext context) {
        return widget;
      },
    ));
  }
}
