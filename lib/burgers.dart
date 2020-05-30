import 'package:flutter/material.dart';
import 'package:flutter_sample/myDrawer.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class BurgerJson {
  String id;
  String title;
  String description;
  String imageName;

  BurgerJson({this.id, this.title, this.description, this.imageName});
  factory BurgerJson.fromJson(Map<String, dynamic> parsedJson) {
    return BurgerJson(
        id: parsedJson['_id'],
        title: parsedJson['title'],
        description: parsedJson['description'],
        imageName: parsedJson['imageName']);
  }
}

class Burgers extends StatefulWidget {
  @override
  BurgersState createState() => BurgersState();
}

class BurgersState extends State<Burgers> {

  // jsonデータ
  List<BurgerJson> _json = [];

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
      _json =
          parsed.map<BurgerJson>((json) => BurgerJson.fromJson(json)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('burgers')),
        drawer: MyDrawer(),
        body: GridView.count(
            padding: EdgeInsets.all(4.0),
            crossAxisCount: 2,
            childAspectRatio: 1.0,
            children: _getListData()));
  }

  _getListData() {
    List<Card> widgets = [];

    _json.forEach((element) {
      widgets.add(
        Card(
            child: Column(children: <Widget>[
          Flexible(
            child: Image.asset(
              'assets/images/${element.imageName}',
              fit: BoxFit.cover,
            ),
          ),
          ListTile(
            title: Text(element.title),
            subtitle: Text(element.description),
          ),
        ])),
      );
    });

    return widgets;
  }
}
