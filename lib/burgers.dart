import 'dart:async' show Future;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_sample/myDrawer.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_sample/burgerDetail.dart';
import 'package:flutter_sample/model/burger.dart';

class Burgers extends StatefulWidget {
  @override
  BurgersState createState() => BurgersState();
}

class BurgersState extends State<Burgers> {
  // jsonデータ
  List<Burger> _json = [];

  @override
  void initState() {
    super.initState();

    this.loadAsset();
  }

  // json読み込み
  Future<void> loadAsset() async {
    String loadString = await rootBundle.loadString('assets/data/burger.json');
    final parsed = json.decode(loadString).cast<Map<String, dynamic>>();

    setState(() {
      _json = parsed.map<Burger>((json) => Burger.fromJson(json)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Burgers')),
        drawer: MyDrawer(),
        body: GridView.count(
            padding: EdgeInsets.all(4.0),
            crossAxisCount: 2,
            childAspectRatio: 1.0,
            shrinkWrap: true,
            children: _getListData()));
  }

  _getListData() {
    List<InkWell> widgets = [];

    _json.forEach((element) {
      widgets.add(InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => BurgerDetail(element)));
          },
          child: Container(
            child: Card(
                child: Column(children: <Widget>[
              Flexible(
                  child: Hero(
                child: Image.asset(
                  'assets/images/${element.imageName}',
                  fit: BoxFit.cover,
                ),
                tag: 'image_tag_${element.id}',
              )),
              ListTile(
                title: Text(element.title),
                subtitle: Text('¥${element.price}'),
              ),
            ])),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(5.0, 5.0),
                blurRadius: 10.0,
              )
            ]),
          )));
    });

    return widgets;
  }
}
