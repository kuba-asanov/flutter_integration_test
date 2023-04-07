import 'package:flutter/material.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';

/* Local dependencies */
import 'package:medcheck/helpers/localization.dart';
import 'package:medcheck/main.dart' as app;

import 'helpers/heplers.dart';
import 'helpers/sign_in.dart';
import 'page_objects/create_physician_page.dart';
import 'page_objects/create_proaccount_page.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Integration test to create Doctor account', (tester) async {
    CreateProAccountPage commonObjects = CreateProAccountPage(tester);
    CreatePhysicianPage objects = CreatePhysicianPage(tester);

    await app.main();
    await tester.pumpAndSettle();

    // Sign-in process
    await signIn(tester);

    // Opening settings page
    await tester.tap(commonObjects.setting);
    await tester.pumpAndSettle();

    // Click create pro account button
    await tester.tap(commonObjects.createAccount);
    await tester.pumpAndSettle();

    // Begin to create pharmacist account
    await tester.tap(commonObjects.createProAccount);
    await tester.pumpAndSettle();

    // Choose account type to create
    await tester.tap(find.text(SS.translate.Physician));
    await tester.pumpAndSettle();

    await tester.tap(commonObjects.startButton);
    await tester.pumpAndSettle();

    // Fill doctor data
    await tester.enterText(objects.firstNameTextfield, 'Kuba');
    await tester.pumpAndSettle();

    await tester.enterText(objects.lastNameTextfield, 'Asanov');
    await tester.pumpAndSettle();

    await tester.enterText(objects.patronymicTextfield, 'Abdukadyrovich');
    await tester.pumpAndSettle();

    await tester.tap(objects.nextButton1);
    await tester.pumpAndSettle();

    await tester.enterText(objects.textFieldWithAutoComplete, 'Therapist');
    await tester.pumpAndSettle();

    await tester.tap(objects.experience);
    await tester.pumpAndSettle();

    await tester.fling(
      objects.scrollablePicker,
      const Offset(0, 100),
      1000,
    );
    await tester.pumpAndSettle();

    await tester.tap(objects.okButton);
    await tester.pumpAndSettle();

    await tester.tap(objects.nextButton1);
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
    await tester.tap(commonObjects.deleteBtn);
    await tester.pumpAndSettle();

    // Click delete confirm button
    await tester.tap(commonObjects.deleteConfirmBtn);
    await tester.pumpAndSettle();

    // See patient profile
    expect(find.text(SS.translate.patientAccount), findsOneWidget);
    expect(find.text(SS.translate.settings), findsOneWidget);
  });
}
