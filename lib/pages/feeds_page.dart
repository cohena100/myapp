import 'package:flutter/material.dart';
import 'package:myapp/src/feed.dart';
import 'package:webfeed/webfeed.dart';

class FeedsPage extends StatefulWidget {
  @override
  FeedsPageState createState() => FeedsPageState();
}

class FeedsPageState extends State<FeedsPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getFeed(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final RssFeed feed = snapshot.data;
          final items = feed.items.map((item) => item.title).toList();
          return ListView(
            children: items.map(buildItem).toList(),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget buildItem(String item) {
    return ListTile(title: Text(item));
  }
}
