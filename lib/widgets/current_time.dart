import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';
import 'package:myapp/model/model_context.dart';

class CurrentTime extends StatefulWidget {
  @override
  CurrentTimeState createState() => new CurrentTimeState();
}

class CurrentTimeState extends State<CurrentTime> {
  StreamSubscription<int> timer;

  CurrentTimeState() {
    this.timer = Observable.periodic(Duration(seconds: 1), (i) => i)
        .listen((i) => this.setState(() {}));
  }

  @override
  void initState() {
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
