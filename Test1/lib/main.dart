import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(TestJulien());

class TestJulien extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test Julien',
      theme: ThemeData(brightness: Brightness.dark),
      home: TestJulienHomepage(
        title: 'Apprendre à calculer',
      ),
    );
  }
}

class TestJulienHomepage extends StatefulWidget {
  TestJulienHomepage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() {
    return _TestJulienState();
  }
}

TextStyle _inputStyle =
    new TextStyle(fontWeight: FontWeight.bold, fontSize: 40);

TextStyle _buttonStyle =
    new TextStyle(fontWeight: FontWeight.bold, fontSize: 20);

class _TestJulienState extends State<TestJulienHomepage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Widget buildNumberButtons(num value) {
    return Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey), color: Colors.black26),
        margin: EdgeInsets.all(5),
        child: FlatButton(
            child: Text(value.toString(), style: _buttonStyle),
            onPressed: () => _addToDisplay(value)));
  }

  @override
  initState() {
    super.initState();

    _selectNewOperation();
  }

  _TestJulienState() {
    //_selectNewOperation();
  }

  _selectNewOperation() {
    Random r = new Random();
    int test = r.nextInt(2);

    if (test % 2 == 0) {
      // Addition
      String operand = '+';
      int left = r.nextInt(10);
      int right = r.nextInt(10);

      expectedResult = left + right;
      setState(() {
        operation = '$left $operand $right';
      });
    } else {
      // soustraction
      String operand = '-';
      int left = r.nextInt(10);
      int right = r.nextInt(10);

      if (left >= right) {
        operation = '$left $operand $right';
        expectedResult = left - right;
      } else {
        operation = '$right $operand $left';
        expectedResult = right - left;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        children: <Widget>[
          // display
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          color: Colors.black26),
                      alignment: AlignmentDirectional.center,
                      child: Text('$operation', style: _inputStyle)))
            ],
          ),

          // display
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.blueAccent))),
                      alignment: AlignmentDirectional.center,
                      child: Text('$input', style: _inputStyle)))
            ],
          ),

          // 1 -> 3
          Container(
              padding: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  buildNumberButtons(1),
                  buildNumberButtons(2),
                  buildNumberButtons(3),
                ],
              )),

          // 4 -> 6
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buildNumberButtons(4),
              buildNumberButtons(5),
              buildNumberButtons(6),
            ],
          ),

          // 7 -> 9
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buildNumberButtons(7),
              buildNumberButtons(8),
              buildNumberButtons(9),
            ],
          ),

          // 0
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buildNumberButtons(0),
            ],
          ),

          // Clear & Send
          Container(
              padding: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(
                      //child: Text('Effacer', style: _buttonStyle),
                      icon: Icon(Icons.clear),
                      iconSize: 40,
                      color: Colors.redAccent,
                      onPressed: () => _clear()),
                  IconButton(
                      //child: Text('Vérifier', style: _buttonStyle),
                      icon: Icon(Icons.search),
                      iconSize: 40,
                      color: Colors.blueAccent,
                      onPressed: () => input != '' ? _compare() : null)
                ],
              )),
        ],
      ),
    );
  }

  final errorSnack = SnackBar(
      backgroundColor: Colors.red,
      content: Text(
        'Erreur - Essaye encore !',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ));

  final successSnack = SnackBar(
      duration: Duration(seconds: 1),
      backgroundColor: Colors.green,
      content: Text(
        'Bien joué !',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ));

  _clear() {
    setState(() {
      input = '';
    });
  }

  _compare() {
    if (int.parse(input) == expectedResult) {
      _scaffoldKey.currentState.showSnackBar(successSnack);
      _clear();
      _selectNewOperation();
    } else {
      _scaffoldKey.currentState.showSnackBar(errorSnack);
      _clear();
    }
  }

  _addToDisplay(int value) {
    setState(() {
      input = input + value.toString();
    });
  }

  String input = '';
  String operation = '';
  int expectedResult = 0;
}
