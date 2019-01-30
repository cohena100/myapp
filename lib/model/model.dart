import 'package:myapp/model/feed_bloc.dart';

class Model {
  FeedBloc feedBloc;

  Model() {
    feedBloc = FeedBloc();
  }
}

final model = Model();