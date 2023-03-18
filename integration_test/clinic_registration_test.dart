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

  testWidgets('Integration test to create Clinic account', (tester) async {
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
    await tester.pumpAndSettle(const Duration(seconds: 1));

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
    final clinicButton = find.text(SS.translate.clinic);
    expect(clinicButton, findsOneWidget);
    await tester.tap(clinicButton);
    await tester.pumpAndSettle();

    final startButton = find.byKey(const Key('PrimaryButtonNextPage'));
    await tester.tap(startButton);
    await tester.pumpAndSettle();

    // Fill clinic data
    final clinicNameTextfield = find.byKey(const Key('clinicNameController'));
    await tester.enterText(clinicNameTextfield, 'On clinic');
    await tester.pumpAndSettle();

    final buttonNextPage = find.byKey(const ValueKey('next'));
    await tester.tap(buttonNextPage);
    await tester.pumpAndSettle();

    final clinicAddressCity =
        find.byKey(const Key('clinicAddressCityController'));
    await tester.enterText(clinicAddressCity, 'Бишкек');

    final clinicAdressStreet =
        find.byKey(const Key('clinicAddressStreetController'));
    await tester.enterText(clinicAdressStreet, 'Фатьянова 170');
    await tester.pumpAndSettle();

    await tester.tap(buttonNextPage);
    await tester.pumpAndSettle();

    final textFieldWithAutoComplete =
        find.byKey(const Key('textFieldWithAutoComplete'));
    await tester.enterText(textFieldWithAutoComplete, 'Стоматология');

    await tester.tap(textFieldWithAutoComplete);
    await tester.pumpAndSettle();

    await tester.tap(buttonNextPage);
    await tester.pumpAndSettle();

    final addPhoto = find.text(SS.translate.addPhoto);
    expect(addPhoto, findsOneWidget);
    await tester.tap(addPhoto);
    await tester.pumpAndSettle();

    await tester.tap(buttonNextPage);
    await tester.pumpAndSettle();

    await tester.tap(buttonNextPage);
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
