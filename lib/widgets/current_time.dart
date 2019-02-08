import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

class CurrentTime extends StatefulWidget {

  CurrentTime({Key key}):super(key: key);

  @override
  CurrentTimeState createState() => new CurrentTimeState();
}

class CurrentTimeState extends State<CurrentTime> {
  StreamSubscription<int> timer;

  @override
  void initState() {
    this.timer = Observable.periodic(Duration(seconds: 1), (i) => i)
        .listen((i) => this.setState(() {}));
    super.initState();
  }

  @override
  dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Text(DateFormat.jms().format(new DateTime.now()));
  }
}
