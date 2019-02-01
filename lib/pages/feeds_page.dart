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
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FlatButton(
                onPressed: () {
                  model.feedBloc.operationSink.add(FeedBlocOperation.one);
                },
                child: Text('One')),
            FlatButton(
                onPressed: () {
                  model.feedBloc.operationSink.add(FeedBlocOperation.two);
                },
                child: Text('Two')),
          ],
        ),
        Expanded(
          child: StreamBuilder(
            stream: model.feedBloc.feedStream,
            initialData: [],
            builder: (context, snapshot) {
              final List items = snapshot.data;
              if (items.length == 0) {
                return Center(child: CircularProgressIndicator());
              }
              return ListView(
                children: items
                    .map((item) => buildItem(item as FeedElement))
                    .toList(),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget buildItem(FeedElement feedElement) {
    return ListTile(
      title: Text(feedElement.title),
      onTap: () => model.feedBloc.saveFeedElement(feedElement),
    );
  }
}
