/* External dependencies */
import 'package:flutter/material.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';

/* Local dependencies */
import 'package:medcheck/common/common_widgets.dart';
import 'package:medcheck/helpers/localization.dart';
import 'package:medcheck/main.dart' as app;
import 'package:medcheck/widgets/user/user_custom_info_card.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Find physician\'s phone and calling test', (tester) async {
    await app.main();
    await tester.pumpAndSettle();

    // Skipping onboarding
    await tester.tap(find.byIcon(Icons.close));
    await tester.pumpAndSettle();

    // Scroll down by y 
    await tester.fling(
      find.byType(NestedScrollView),
      const Offset(0, -2000),
      500000,
    );
    await tester.pumpAndSettle();

    expect(find.text(SS.translate.Search), findsOneWidget);

    // Open category of 'Уролог'
    final Finder category = find.text('Уролог');
    await tester.tap(category);
    await tester.pumpAndSettle();

    // Open first doctor detail page in list
    final physicianTile = find.byKey(const Key('physicianCardKey')).first;
    await tester.tap(physicianTile);
    await tester.pumpAndSettle();

    // Find 'CALL' button
    final primaryButton = find.byType(PrimaryButton);
    expect(primaryButton, findsOneWidget);

    // Click to 'CALL' button   
    await tester.tap(primaryButton);
    await tester.pumpAndSettle();

    // Find phone number
    final workPhone = find.byType(UserCustomInfoCard).first;
    expect(workPhone, findsOneWidget);

    // Click phone number to call    
    await tester.tap(workPhone);
  });
}
