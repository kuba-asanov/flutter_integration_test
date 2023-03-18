/* External dependencies */
import 'package:flutter/material.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';

/* Local dependencies */
import 'package:medcheck/main.dart' as app;
import 'package:medcheck/common/common_widgets.dart';
import 'package:medcheck/helpers/localization.dart';
import 'package:medcheck/common/elevated_card_widget.dart';

// Run this test with below command in terminal
// flutter test --dart-define=testing_mode=true integration_test/user_sign_in_test.dart

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  binding.testTextInput.register();

  testWidgets('User sign in integration test', (tester) async {
    await app.main();
    await tester.pumpAndSettle();

    // Skipping onboarding
    await tester.tap(find.byIcon(Icons.close));
    await tester.pumpAndSettle();

    // Selecting profile tab in bottom navigation bar
    await tester.tap(find.byKey(const Key('profile_tap')));
    await tester.pumpAndSettle();

    // Start signing in
    await tester.tap(find.byType(PrimaryButton));
    await tester.pumpAndSettle();

    // Entering phone number
    await tester.enterText(find.byKey(const Key("1st textField")), '777434530');
    await tester.pumpAndSettle();

    // Confirming phone number by tapping next button
    await tester.tap(find.byType(PrimaryButton));
    await tester.pumpAndSettle();

    // Entering sms confirmation code
    await tester.enterText(
        find.byKey(const Key("sms-confirm textField")), '3197');
    await tester.pumpAndSettle();

    // expecting MedcheckID card and Settings card
    expect(find.byType(ElevatedCardWidget), findsNWidgets(2));
  });
}
