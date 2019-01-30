import 'package:myapp/model/blocs/feed_bloc.dart';
import 'package:myapp/model/proxies/network_proxy.dart';

class Model {
  FeedBloc feedBloc;

  Model() {
    final networkProxy = NetworkProxy();
    feedBloc = FeedBloc(networkProxy);
  }
}

final model = Model();
