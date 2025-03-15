import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String buttonText = '';

  @override
  void initState() {
    super.initState();
    loadButtonText();
  }

  Future<void> loadButtonText() async {
    final loadedString = await rootBundle.loadString('assets/strings.txt');
    setState(() {
      buttonText = loadedString;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo'),
      ),
      body: Center(
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(buttonText),
            // ...existing code...
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ...existing code...
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}