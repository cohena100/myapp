import 'package:flutter/material.dart';
import 'package:myapp/widgets/current_time.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CurrentTime(),
        ],
      ),
    );
  }
}
