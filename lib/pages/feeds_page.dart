import 'package:flutter/material.dart';
import 'package:myapp/model/model.dart';
import 'package:myapp/model/blocs/feed_bloc.dart';
import 'package:myapp/model/proxies/local_db_proxy.dart';

class FeedsPage extends StatefulWidget {
  @override
  FeedsPageState createState() => FeedsPageState();
}

class FeedsPageState extends State<FeedsPage> {
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
                  items.map((item) => buildItem(item as FeedElement)).toList(),
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
