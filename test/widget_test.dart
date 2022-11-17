// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:dz_bloc/main.dart';

void main() {
  testWidgets('Icons test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    await tester.tap(find.byIcon(Icons.plus_one));
    await tester.pump();

    await tester.tap(find.byIcon(Icons.exposure_minus_1));
    await tester.pump();
  });

  testWidgets('Text test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.text('Clear'), findsOneWidget);
    expect(find.text('Counter example'), findsOneWidget);
    expect(find.text('1'), findsNothing);
  });
}
