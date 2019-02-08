// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/main.dart';
import 'package:mockito/mockito.dart';
import 'package:myapp/model/proxies/network_proxy.dart';
import 'package:myapp/src/feed_sample.dart';

class MockNetworkProxy extends Mock implements NetworkProxyProvider {}

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    final networkProxy = MockNetworkProxy();
    when(networkProxy
            .getFeeds(['http://feeds.reuters.com/reuters/businessNews']))
        .thenAnswer((_) async => feedBusiness);
    when(networkProxy
            .getFeeds(['http://feeds.reuters.com/reuters/entertainment']))
        .thenAnswer((_) async => feedEntertainment);
    when(networkProxy
            .getFeeds(['http://feeds.reuters.com/reuters/environment']))
        .thenAnswer((_) async => feedEnvironment);
    await tester.pumpWidget(MyApp());
    expect(find.byKey(Key('CurrentTime')), isNotNull);
    await tester.tap(find.text('Feeds'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));
    expect(
        find.text('U.S. chipmakers may give clues on China hazard'), isNotNull);
    await tester.tap(find.text('Two Feeds'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));
    expect(find.text('EPA wins new chance to argue against pesticide ban'),
        isNotNull);
    expect(
        find.text(
            'Diversity feted as Oscar nominees gather for class photo, and lunch'),
        isNotNull);
    await tester.tap(find.text('Home'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));
    expect(find.byKey(Key('CurrentTime')), isNotNull);
    await tester.tap(find.text('Feeds'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));
    expect(
        find.text('U.S. chipmakers may give clues on China hazard'), isNotNull);
  });
}
