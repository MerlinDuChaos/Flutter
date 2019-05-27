import 'package:flutter/material.dart';

void main() => runApp(TestJulien());

class TestJulien extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test Julien',
      theme: ThemeData(brightness: Brightness.dark),
      home: TestJulienHomepage(
        title: 'TestJulien Homepage',
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

class TestButton extends StatelessWidget {
  final String label;
  final VoidCallback onClicked;
  TestButton(this.label, [this.onClicked]);

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.all(5),
      color: Colors.red,
      child: FlatButton(
        child: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        onPressed: this.onClicked,
      ),
    );
  }
}

TextStyle _displayStyle =
    new TextStyle(fontWeight: FontWeight.bold, fontSize: 40);

class _TestJulienState extends State<TestJulienHomepage> {
  Widget buildNumberButtons(num value) {
    return FlatButton(
        child: Text(value.toString()), onPressed: () => _addToDisplay(value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        children: <Widget>[
          // display
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Text('$display', style: _displayStyle)],
          ),

          // 1 -> 3
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              buildNumberButtons(1),
              buildNumberButtons(2),
              buildNumberButtons(3),
            ],
          ),

          // 4 -> 6
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              buildNumberButtons(4),
              buildNumberButtons(5),
              buildNumberButtons(6),
            ],
          ),

          // 7 -> 9
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
              FlatButton(child: Text('0'), onPressed: () => _addToDisplay(0))
            ],
          ),

          // Clear & Send
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FlatButton(child: Text('Effacer'), onPressed: () => _clear()),
              FlatButton(child: Text('Envoyer'), onPressed: () => {})
            ],
          ),

          /*
          Container(
              color: Colors.blue,
              child: Column(children: <Widget>[
                Row(children: <Widget>[
                  Expanded(
                      child: Container(
                          child: Text('$display',
                              style: TextStyle(
                                backgroundColor: Colors.cyan,
                                fontWeight: FontWeight.bold,
                                fontSize: 40,
                              ))))
                ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TestButton('1', () => _addToDisplay(1)),
                      TestButton('2', () => _addToDisplay(2)),
                      TestButton('3', () => _addToDisplay(3)),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TestButton('4', () => _addToDisplay(4)),
                      TestButton('5', () => _addToDisplay(5)),
                      TestButton('6', () => _addToDisplay(6)),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TestButton('7', () => _addToDisplay(7)),
                      TestButton('8', () => _addToDisplay(8)),
                      TestButton('9', () => _addToDisplay(9)),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TestButton('0', () => _addToDisplay(0)),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TestButton('Effacer', () => _clear()),
                      TestButton('Envoyer', () => {}),
                    ]),
              ]))
              */
        ],
      ),
    );
  }

  _clear() {
    setState(() {
      display = '';
    });
  }

  _addToDisplay(int value) {
    setState(() {
      display = display + value.toString();
    });
  }

  String display = '';

  // Widget testButton = Container(
  //   child: Text(

  //   ),
  // );

}

// import 'package:flutter/material.dart';

// //void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//         brightness: Brightness.dark
//         //accentColor: Colors.yellow
//         //typography: Typography.blackMountainView
//       ),
//       home: MyHomePage(title: 'Flutter Demo Julien'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'You have clicked the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.display1,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
