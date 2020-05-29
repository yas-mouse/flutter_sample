import 'package:flutter/material.dart';
import 'package:flutter_sample/about.dart';
import 'package:flutter_sample/ramdomWords.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      theme: ThemeData(primaryColor: Colors.orange),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => RandomWords(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/firstpage': (context) => About(),
      },
    );
  }
}
