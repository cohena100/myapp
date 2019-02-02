import 'dart:async';

import 'package:flutter/material.dart';
import 'package:myapp/model/model.dart';
import 'package:myapp/model/proxies/local_db_proxy.dart';
import 'package:myapp/pages/item_page.dart';
import 'package:rxdart/rxdart.dart';

class FeedsPage extends StatefulWidget {
  @override
  FeedsPageState createState() => FeedsPageState();
}

class FeedsPageState extends State<FeedsPage> {
  StreamSubscription<int> timer;

  @override
  void initState() {
    timer = Observable.periodic(Duration(seconds: 20), (i) => i).listen((i) =>
        model.feedBloc.operationSink
            .add(['http://feeds.reuters.com/reuters/businessNews']));
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    model.feedBloc.operationSink
        .add(['http://feeds.reuters.com/reuters/businessNews']);
    return StreamBuilder(
      stream: model.feedBloc.feedStream,
      initialData: [],
      builder: (context, snapshot) {
        final progressIndicator = CircularProgressIndicator();
        final List items = snapshot.data;
        final visible = items.length == 0 ? true : false;
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                  child: ListView(
                children: model.feedBloc
                    .loadFeedElements()
                    .map((item) => buildItem(item, context))
                    .toList(),
              )),
              Center(
                  child: Visibility(
                child: progressIndicator,
                visible: visible,
              ))
            ],
          ),
        );
      },
    );
  }

  Widget buildItem(FeedElement feedElement, BuildContext context) {
    return ListTile(
      title: Text(feedElement.title),
      onTap: () {
        model.feedBloc.saveFeedElement(feedElement);
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  ItemPage(description: feedElement.description)),
        );
      },
    );
  }
}
