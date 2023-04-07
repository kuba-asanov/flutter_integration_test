/* External dependencies */
import 'package:flutter/material.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';

/* Local dependencies */
import 'package:medcheck/helpers/localization.dart';
import 'package:medcheck/main.dart' as app;
import 'helpers/sign_in.dart';
import 'page_objects/create_clinic_page.dart';
import 'page_objects/create_proaccount_page.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Integration test to create Clinic account', (tester) async {
    CreateProAccountPage commonObjects = CreateProAccountPage(tester);
    CreateClinicPage objects = CreateClinicPage(tester);

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
    final clinicButton = find.text(SS.translate.clinic);
    expect(clinicButton, findsOneWidget);
    await tester.tap(clinicButton);
    await tester.pumpAndSettle();

    await tester.tap(commonObjects.startButton);
    await tester.pumpAndSettle();

    // Fill clinic data
    await tester.enterText(objects.clinicNameTextfield, 'On clinic');
    await tester.pumpAndSettle();

    await tester.tap(objects.buttonNextPage);
    await tester.pumpAndSettle();

    await tester.enterText(objects.clinicAddressCity, 'Бишкек');

    await tester.enterText(objects.clinicAdressStreet, 'Фатьянова 170');
    await tester.pumpAndSettle();

    await tester.tap(objects.buttonNextPage);
    await tester.pumpAndSettle();

    await tester.enterText(objects.textFieldWithAutoComplete, 'Стоматология');

    await tester.tap(objects.textFieldWithAutoComplete);
    await tester.pumpAndSettle();

    await tester.tap(objects.buttonNextPage);
    await tester.pumpAndSettle();

    final addPhoto = find.text(SS.translate.addPhoto);
    expect(addPhoto, findsOneWidget);
    await tester.tap(addPhoto);
    await tester.pumpAndSettle();

    await tester.tap(objects.buttonNextPage);
    await tester.pumpAndSettle();

    await tester.tap(objects.buttonNextPage);
    await tester.pumpAndSettle();

    // See created clinic profile
    expect(find.text('On clinic'), findsOneWidget);
    expect(find.text(SS.translate.basicInfo), findsOneWidget);
    expect(
        find.text(SS.translate.pagePhysicianProfileServices), findsOneWidget);
    expect(find.text(SS.translate.contacts), findsOneWidget);

    // Delete clinic account
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
