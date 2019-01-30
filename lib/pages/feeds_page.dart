import 'package:flutter/material.dart';
import 'package:myapp/model/model.dart';
import 'package:myapp/model/blocs/feed_bloc.dart';

class FeedsPage extends StatefulWidget {
  @override
  FeedsPageState createState() => FeedsPageState();
}

class FeedsPageState extends State<FeedsPage> {
  @override
  Widget build(BuildContext context) {
    model.feedBloc.feedType.add(FeedType.one);
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            FlatButton(
                onPressed: () {
                  model.feedBloc.feedType.add(FeedType.one);
                },
                child: Text('One')),
            FlatButton(
                onPressed: () {
                  model.feedBloc.feedType.add(FeedType.two);
                },
                child: Text('Two')),
          ],
        ),
        Expanded(
          child: StreamBuilder<List<String>>(
            stream: model.feedBloc.feed,
            initialData: [],
            builder: (context, snapshot) {
              final List<String> items = snapshot.data;
              if (items.length == 0) {
                return Center(child: CircularProgressIndicator());
              }
              return ListView(
                children: items.map(buildItem).toList(),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget buildItem(String item) {
    return ListTile(title: Text(item));
  }
}
