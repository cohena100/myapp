import 'package:myapp/model/blocs/feed_bloc.dart';
import 'package:myapp/model/proxies/local_db_proxy.dart';
import 'package:myapp/model/proxies/network_proxy.dart';

class Model {
  FeedBloc feedBloc;

  Model() {
    final networkProxy = NetworkProxy();
    final localDBProxy = LocalDBProxy();
    feedBloc = FeedBloc(networkProxy, localDBProxy);
  }
}

final model = Model();
