/* External dependencies */
import 'package:flutter/material.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';

/* Local dependencies */
import 'package:medcheck/helpers/localization.dart';
import 'package:medcheck/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Open article detail page and tap to web link', (tester) async {
    await app.main();
    await tester.pumpAndSettle();

    expect(find.text(SS.translate.Search), findsOneWidget);

    // Open articles list page
    final Finder articlebutton = find.text(SS.translate.Articles);
    await tester.tap(articlebutton);
    await tester.pumpAndSettle();

    expect(find.byType(ListView), findsOneWidget);

    // Open first article detail page
    final Finder itemFinder = find.byType(Card).first;
    await tester.tap(itemFinder);
    await tester.pumpAndSettle();

    // Scroll down
    await tester.fling(
      find.byType(SingleChildScrollView),
      const Offset(0, -3000),
      500000,
    );
    await tester.pumpAndSettle();

    // Find and click to web link of article
    final link = find.textContaining('https://www.medcheck.kg/articles/');
    expect(link, findsOneWidget);

    await tester.tap(link);
    await tester.pumpAndSettle();
  });
}
