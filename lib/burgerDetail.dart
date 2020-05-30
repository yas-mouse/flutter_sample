import 'package:flutter/material.dart';
import 'package:flutter_sample/model/burger.dart';

class BurgerDetail extends StatefulWidget {
  BurgerDetail(this._burger);
  final Burger _burger;

  @override
  BurgerDetailState createState() => BurgerDetailState(_burger);
}

class BurgerDetailState extends State<BurgerDetail> {
  BurgerDetailState(this._burger);
  final Burger _burger;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('BurgerDetail')),
        body: Card(
            child: Column(children: <Widget>[
          Flexible(
              child: Hero(
            child: Image.asset(
              'assets/images/${_burger.imageName}',
              fit: BoxFit.cover,
            ),
            tag: 'image_tag_${_burger.id}',
          )),
          ListTile(
            title: Text(_burger.title),
            subtitle: Text(_burger.description),
            trailing: Text('¥${_burger.price}'),
          ),
          ButtonBar(
            children: <Widget>[
              FlatButton(
                splashColor: Colors.blue.shade100,
                child: const Text('Buy Now'),
                onPressed: () {},
              ),
              FlatButton(
                splashColor: Colors.blue.shade100,
                child: const Text('Add to cart'),
                onPressed: () {},
              ),
            ],
          ),
        ])));
  }
}
