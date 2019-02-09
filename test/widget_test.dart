// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart' hide group;
import 'package:test/test.dart' show group;
import 'package:myapp/main.dart';
import 'package:mockito/mockito.dart';
import 'package:myapp/model/proxies/network_proxy.dart';
import 'package:myapp/src/feed_sample.dart';
import 'package:myapp/model/model.dart';
import 'package:myapp/model/proxies/local_db_proxy.dart';
import 'package:myapp/model/blocs/feed_bloc.dart';

class MockNetworkProxy extends Mock implements NetworkProxyProvider {}

void main() {
  group('description', () {
    testWidgets('Counter increments smoke test', (WidgetTester tester) async {
      final networkProxy = MockNetworkProxy();
      when(networkProxy
              .getFeeds(['http://feeds.reuters.com/reuters/businessNews']))
          .thenAnswer((_) async {
        return Future.value([feedBusiness]);
      });
      when(networkProxy.getFeeds([
        'http://feeds.reuters.com/reuters/entertainment',
        'http://feeds.reuters.com/reuters/environment'
      ])).thenAnswer((_) async {
        return Future.value([feedEntertainment, feedEnvironment]);
      });
      model.feedBloc = FeedBloc(networkProxy, LocalDBProxy());
      await tester.pumpWidget(MyApp());
      expect(find.byKey(Key('CurrentTime')), findsOneWidget);
      await tester.tap(find.text('Feeds'));
      await tester.pumpAndSettle();
      final firstListItemText =
          'Supermarket retailer Casino to sell six stores to rival Leclerc';
      await tester.tap(find.byKey(Key(firstListItemText)));
      await tester.pumpAndSettle();
      expect(find.byKey(Key(firstListItemText)), findsOneWidget);
      final NavigatorState navigator =
          tester.state<NavigatorState>(find.byType(Navigator));
      navigator.pop();
      await tester.pumpAndSettle();
      expect(find.byKey(Key(firstListItemText)), findsOneWidget);
      await tester.tap(find.text('Home'));
      await tester.pumpAndSettle();
      expect(find.text(firstListItemText), findsOneWidget);
      await tester.tap(find.text('Feeds'));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(Key('Two Feeds')));
      await tester.pumpAndSettle();
      final firstFeedTitle = """Brazil evacuates towns near Vale, ArcelorMittal dams on fears of collapse""";
      expect(find.byKey(Key(firstFeedTitle)), findsOneWidget);
      await tester.drag(find.byType(ListView), const Offset(0.0, -2000.0));
      await tester.pumpAndSettle();
      final secondFeedTitle = """Grammy-nominated rapper 21 Savage arrested, faces deportation""";
      expect(find.byKey(Key(secondFeedTitle)), findsOneWidget);
    });
  });
}
