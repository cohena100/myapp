import 'package:flutter/material.dart';

class ItemPage extends StatelessWidget {
  final String description;

  ItemPage({Key key, @required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Item"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(description),
        ),
      ),
    );
  }
}
