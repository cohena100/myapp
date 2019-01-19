import 'package:flutter/material.dart';
import 'package:myapp/src/feed.dart';
import 'package:webfeed/webfeed.dart';

class FeedsPage extends StatefulWidget {
  @override
  FeedsPageState createState() => FeedsPageState();
}

class FeedsPageState extends State<FeedsPage> {
  List<String> items = [];

  void setup() async {
    final RssFeed feed = await getFeed();
    setState(() {
      items = feed.items.map((item) => item.title).toList();
    });
  }

  @override
  void initState() {
    setup();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return items.length == 0
        ? Center(child: CircularProgressIndicator())
        : ListView(
            children: items.map(buildItem).toList(),
          );
  }

  Widget buildItem(String item) {
    return ListTile(title: Text(item));
  }
}
