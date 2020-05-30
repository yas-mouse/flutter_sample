import 'package:flutter/material.dart';
import 'package:flutter_sample/about.dart';
import 'package:flutter_sample/ramdomWords.dart';
import 'package:flutter_sample/burgers.dart';

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
        '/': (context) => Burgers(),
        '/about': (context) => About(),
        '/ramdomWords': (context) => RandomWords(),
      },
    );
  }
}
