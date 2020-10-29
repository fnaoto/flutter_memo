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
        body: createCardGridView(_memo, _onTap),
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
      _memo.addText("");
      moveToNextPage(
          new Editor(_memo.getText(), _memo.currentIndex, _onChanged));
    });
  }

  void _onChanged(String text, int index) {
    setState(() {
      _memo.updateText(text, index);
    });
  }

  void _onTap(String text, int index) {
    moveToNextPage(new Editor(text, index, _onChanged));
  }

  void moveToNextPage(Widget widget) {
    Navigator.of(context).push(MaterialPageRoute<void>(
      builder: (BuildContext context) {
        return widget;
      },
    ));
  }
}
