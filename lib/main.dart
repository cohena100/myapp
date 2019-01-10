import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/rxdart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome',
      home: Scaffold(
        appBar: AppBar(title: Text('Welcome!'), centerTitle: true),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CurrentTime(),
            ],
          ),
        ),
      ),
    );
  }
}

class CurrentTime extends StatefulWidget {
  @override
  CurrentTimeState createState() => new CurrentTimeState();
}

class CurrentTimeState extends State<CurrentTime> {
  final timer = Observable.periodic(Duration(seconds: 1), (i) => i);

  @override
  void initState() {
    super.initState();
    timer.listen((i) => this.setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Text(DateFormat.jms().format(new DateTime.now()));
  }
}
