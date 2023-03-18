/* External dependencies */
import 'package:flutter/material.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';

/* Local dependencies */
import 'package:medcheck/helpers/localization.dart';
import 'package:medcheck/main.dart' as app;
import 'package:medcheck/widgets/article/date_widget.dart';

import 'helpers/heplers.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('There are three bottom navigator tabs: Search, Articles, Profile', () {
    testWidgets('by default in Search page', (tester) async {
      await app.main();
      await tester.pumpAndSettle();

      // Skipping onboarding
      await tester.tap(find.byIcon(Icons.close));
      await tester.pumpAndSettle();

      expect(find.text(SS.translate.Search), findsOneWidget);

      // opening Articles page
      final Finder articlebutton = find.text(SS.translate.Articles);
      await tester.tap(articlebutton);
      await tester.pumpAndSettle();

      // Find list of article and publish date widget
      expect(find.byType(DateWidget).first, findsOneWidget);
      expect(find.byKey(const Key('articlesListKey')), findsOneWidget);

      // opening Profile page
      final Finder profilebutton = find.text(SS.translate.profile);
      await tester.tap(profilebutton);
      await tester.pumpAndSettle();

      expect(find.text(SS.translate.fullAccess), findsOneWidget);

      // opening Search page
      final Finder searchbutton = find.text(SS.translate.Search);
      await tester.tap(searchbutton);
      await tester.pumpAndSettle();
    });
  });
}
