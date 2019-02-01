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
    model.feedBloc.feedType.add(FeedsBlocOperation.one);
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FlatButton(
                onPressed: () {
                  model.feedBloc.feedType.add(FeedsBlocOperation.one);
                },
                child: Text('One')),
            FlatButton(
                onPressed: () {
                  model.feedBloc.feedType.add(FeedsBlocOperation.two);
                },
                child: Text('Two')),
          ],
        ),
        Expanded(
          child: StreamBuilder(
            stream: model.feedBloc.feed,
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

  Widget buildItem(FeedElement element) {
    return ListTile(title: Text(element.title));
  }
}
