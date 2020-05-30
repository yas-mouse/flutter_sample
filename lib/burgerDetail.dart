import 'package:flutter/material.dart';
import 'package:flutter_sample/burgers.dart';

class BurgerDetail extends StatefulWidget {
  BurgerDetail(this._burgerJson);
  final BurgerJson _burgerJson;


  @override
  BurgerDetailState createState() => BurgerDetailState(_burgerJson);
}

class BurgerDetailState extends State<BurgerDetail> {
  BurgerDetailState(this._burgerJson);
  final BurgerJson _burgerJson;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('BurgerDetail')),
        body:Center(
          child: Text(_burgerJson.title),
        ));
  }
}
