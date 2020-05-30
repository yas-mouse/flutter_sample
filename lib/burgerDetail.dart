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
        body: Card(
            child: Column(children: <Widget>[
          Flexible(
              child: Hero(
            child: Image.asset(
              'assets/images/${_burgerJson.imageName}',
              fit: BoxFit.cover,
            ),
            tag: 'image_tag_${_burgerJson.id}',
          )),
          ListTile(
            title: Text(_burgerJson.title),
            subtitle: Text(_burgerJson.description),
          )
        ])));
  }
}
