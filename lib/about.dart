import 'package:flutter/material.dart';
import 'package:flutter_sample/myDrawer.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: Builder(builder: (BuildContext context) {
        return Center(
          child: RaisedButton(
            onPressed: () {
              final snackBar = SnackBar(
                content: Text('This is an about page.'),
                action: SnackBarAction(
                  label: 'Undo',
                  onPressed: () {
                    // Some code to undo the change.
                  },
                ),
              );
              Scaffold.of(context).showSnackBar(snackBar);
            },
            child: Text('Show snackbar'),
          ),
        );
      }),
      drawer: MyDrawer(),
    );
  }
}
