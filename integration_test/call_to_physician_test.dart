/* External dependencies */
import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';

/* Local dependencies */
import 'package:medcheck/helpers/localization.dart';
import 'package:medcheck/main.dart' as app;
import 'page_objects/call_to_physician_page.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Find physician\'s phone and calling test', (tester) async {
    CallToPhysicianPage objects = CallToPhysicianPage(tester);

    await app.main();
    await tester.pumpAndSettle();

    // Scroll down by y
    await tester.fling(
      objects.nestedScrollView,
      const Offset(0, -2000),
      500000,
    );
    await tester.pumpAndSettle();

    expect(find.text(SS.translate.Search), findsOneWidget);

    // Open category of 'Уролог'
    await tester.tap(objects.category);
    await tester.pumpAndSettle();

    // Open first doctor detail page in list
    await tester.tap(objects.physicianTile);
    await tester.pumpAndSettle();

    // Find 'CALL' button
    expect(objects.primaryButton, findsOneWidget);

    // Click to 'CALL' button
    await tester.tap(objects.primaryButton);
    await tester.pumpAndSettle();

    // Find phone number
    expect(objects.workPhone, findsOneWidget);

    // Click phone number to call
    await tester.tap(objects.workPhone);
  });
}
