import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'app_harness.dart';

void main() {
  testWidgets('a fresh install offers sync setup once; skipping goes to the app', (tester) async {
    final app = AppHarness(tester)..phone();
    await app.open(onboarded: false);
    await app.run();
    expect(find.text('Welcome to Bhojana'), findsOneWidget);
    expect(find.text('Shopping lists'), findsNothing);

    await app.tapText('Not now, use this device only');
    expect(find.text('Welcome to Bhojana'), findsNothing);
    expect(tester.takeException(), isNull);
    // The answer is remembered, so the next start goes straight to the app.
    final saved = await tester.runAsync(() => app.session.db.localSetting('onboarding.sync'));
    expect(saved, isNotNull);
    await app.close();
  });

  testWidgets('setup walks welcome, server, and back', (tester) async {
    final app = AppHarness(tester)..phone();
    await app.open(onboarded: false);
    await app.run();
    await app.tapText('Set up sync');
    expect(find.text('Your sync server'), findsOneWidget);
    expect(find.widgetWithText(TextFormField, 'Server address or setup link'), findsOneWidget);

    // Too short an address is refused before any request is made.
    await app.tapText('Check server');
    expect(find.text('Enter the server address'), findsOneWidget);

    await app.tapText("I don't have a server yet");
    expect(find.textContaining('npm run setup'), findsOneWidget);

    await app.tapText('Back');
    expect(find.text('Welcome to Bhojana'), findsOneWidget);
    expect(tester.takeException(), isNull);
    await app.close();
  });
}
