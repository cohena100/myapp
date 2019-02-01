import 'dart:async';

import 'package:flutter/material.dart';
import 'package:myapp/model/model.dart';
import 'package:myapp/model/blocs/feed_bloc.dart';
import 'package:myapp/model/proxies/local_db_proxy.dart';
import 'package:rxdart/rxdart.dart';

class FeedsPage extends StatefulWidget {
  @override
  FeedsPageState createState() => FeedsPageState();
}

class FeedsPageState extends State<FeedsPage> {
  StreamSubscription<int> timer;

  @override
  void initState() {
    timer = Observable.periodic(Duration(seconds: 5), (i) => i)
        .listen((i) => model.feedBloc.operationSink.add(FeedBlocOperation.one));
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    model.feedBloc.operationSink.add(FeedBlocOperation.one);
    return StreamBuilder(
      stream: model.feedBloc.feedStream,
      initialData: [],
      builder: (context, snapshot) {
        final progressIndicator = CircularProgressIndicator();
        final List items = snapshot.data;
        final visible = items.length == 0 ? true : false;
        return Column(
          children: [
            Expanded(
                child: ListView(
              children:
                  model.feedBloc.loadFeedElements().map((item) => buildItem(item as FeedElement)).toList(),
            )),
            Center(
                child: Visibility(
              child: progressIndicator,
              visible: visible,
            ))
          ],
        );
      },
    );
  }

  Widget buildItem(FeedElement feedElement) {
    return ListTile(
      title: Text(feedElement.title),
      onTap: () => model.feedBloc.saveFeedElement(feedElement),
    );
  }
}
