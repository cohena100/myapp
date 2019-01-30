import 'package:flutter/material.dart';

class ModelContext extends InheritedWidget {
  const ModelContext({
    Key key,
    @required this.color,
    @required Widget child,
  })  : assert(color != null),
        assert(child != null),
        super(key: key, child: child);

  final int color;

  static ModelContext of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(ModelContext);
  }

  @override
  bool updateShouldNotify(ModelContext old) => color != old.color;
}
