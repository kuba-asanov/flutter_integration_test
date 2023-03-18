/* External dependencies */
import 'package:flutter/material.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';

/* Local dependencies */
import 'package:medcheck/helpers/localization.dart';
import 'package:medcheck/main.dart' as app;

import 'helpers/heplers.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Integration test to create Doctor account', (tester) async {
    await app.main();
    await tester.pumpAndSettle();

    // Skipping onboarding
    await tester.tap(find.byIcon(Icons.close));
    await tester.pumpAndSettle();

    // Sign-in process
    final Finder profilebutton = find.text(SS.translate.profile);
    await tester.tap(profilebutton);
    await tester.pumpAndSettle();

    final buttonSignIn = find.byKey(const ValueKey('signinButton'));
    await tester.tap(buttonSignIn);
    await tester.pumpAndSettle();
    await tester.pumpAndSettle(const Duration(seconds: 3));

    // Opening settings page
    final setting = find.byKey(const ValueKey('setting'));
    await tester.tap(setting);
    await tester.pumpAndSettle();

    // Click create pro account button
    final createAccount = find.byKey(const Key("pro-account"));
    await tester.tap(createAccount);
    await tester.pumpAndSettle();

    // Begin to create pharmacist account
    final startProAccount = find.byKey(const ValueKey('create_proAccount'));
    await tester.tap(startProAccount);
    await tester.pumpAndSettle();

    // Choose account type to create
    final selectPhysician = find.text(SS.translate.Physician);
    await tester.tap(selectPhysician);
    await tester.pumpAndSettle();

    final startButton = find.byKey(const Key('PrimaryButtonNextPage'));
    await tester.tap(startButton);
    await tester.pumpAndSettle();

    // Fill doctor data
    final firstNameTextfield = find.byKey(const Key('firstNameController'));
    await tester.enterText(firstNameTextfield, 'Kuba');
    await tester.pumpAndSettle();

    final lastNameTextfield = find.byKey(const Key('lastNameController'));
    await tester.enterText(lastNameTextfield, 'Asanov');
    await tester.pumpAndSettle();

    final patronymicTextfield = find.byKey(const Key('patronymicController'));
    await tester.enterText(patronymicTextfield, 'Abdukadyrovich');
    await tester.pumpAndSettle();

    final nextButton1 = find.byKey(const ValueKey('next'));
    await tester.tap(nextButton1);
    await tester.pumpAndSettle();

    final textFieldWithAutoComplete =
        find.byKey(const ValueKey('textFieldWithAutoComplete'));
    await tester.enterText(textFieldWithAutoComplete, 'therapist');
    await tester.pumpAndSettle();

    final experience = find.byKey(const ValueKey('experience'));
    await tester.tap(experience);
    await tester.pumpAndSettle();

    final scrollablePicker = find.byKey(const ValueKey('picker'));
    await tester.fling(
      scrollablePicker,
      const Offset(0, 100),
      1000,
    );
    await tester.pumpAndSettle();

    final okButton = find.byKey(const ValueKey('okButton'));
    await tester.tap(okButton);
    await tester.pumpAndSettle();

    await tester.tap(nextButton1);
    await tester.pumpAndSettle();
    await addDelay(2000);

    // See created doctor profile
    expect(find.text('Kuba Asanov Abdukadyrovich'), findsOneWidget);

    // Delete doctor account
    await tester.fling(find.byType(ListView), const Offset(0, -200), 5000);
    await tester.pumpAndSettle();

    // Find and open settings button
    final settings = find.text(SS.translate.settings);
    expect(settings, findsOneWidget);
    await tester.tap(settings);
    await tester.pumpAndSettle();

    // Click delete button
    final deleteBtn = find.byKey(const ValueKey('delete_pro_account'));
    await tester.tap(deleteBtn);
    await tester.pumpAndSettle();

    // Click delete confirm button
    final deleteConfirmBtn = find.byKey(const Key('deleteButtonKey'));
    await tester.tap(deleteConfirmBtn);
    await tester.pumpAndSettle();

    // See patient profile
    expect(find.text(SS.translate.patientAccount), findsOneWidget);
    expect(find.text(SS.translate.settings), findsOneWidget);
  });
}
