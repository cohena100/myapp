import 'package:flutter/material.dart';
import 'package:myapp/widgets/current_time.dart';
import 'package:myapp/model/model.dart';

class HomePage extends StatelessWidget {
  List<Widget> setup() {
    final currentTime = CurrentTime(key: Key('CurrentTime'));
    final feedElement = model.feedBloc.loadFeedElement();
    final widgets = feedElement == null
        ? [currentTime]
        : [currentTime, Text(feedElement.title, textAlign: TextAlign.center)];
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: setup(),
      ),
    );
  }
}
