import 'package:flutter/material.dart';
import 'memos.dart';
import 'data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Memo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Memo Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  Future<List<Card>> _initCardList;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();
    _initCardList = initCardList();
  }

  Future<List<Card>> initCardList() async {
    List<Memo> allMemos = await getAllMemos();
    List<Card> _cardList;
    allMemos.forEach((Memo memo) {
      _cardList.add(cardView(memo));
    });
    return _cardList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder<List<Card>>(
        future: _initCardList,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? futureCardList(_counter, initCardList: _initCardList)
              : cardList(_counter);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
