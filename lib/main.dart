import 'package:flutter/material.dart';
import 'package:myapp/model/model_context.dart';
import 'package:myapp/pages/main_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ModelContext(
      color: 1,
      child: MaterialApp(
        title: 'Welcome',
        home: MainPage(),
      ),
    );
  }
}
