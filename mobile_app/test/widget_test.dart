import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:neuronote/main.dart';

void main() {
  testWidgets('App launches on Home tab', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: NeuroNoteApp()));

    expect(find.text('NeuroNote'), findsOneWidget);
    expect(find.byIcon(Icons.home), findsOneWidget);
    expect(find.byIcon(Icons.mic), findsOneWidget);
  });
}
