/* External dependencies */
import 'package:flutter/material.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';

/* Local dependencies */
import 'package:medcheck/helpers/localization.dart';
import 'package:medcheck/main.dart' as app;

import 'helpers/sign_in.dart';
import 'page_objects/create_pharmacist_page.dart';
import 'page_objects/create_proaccount_page.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Integration test to create Pharmacist account', (tester) async {
    CreateProAccountPage commonObjects = CreateProAccountPage(tester);
    CreatePharmacistPage objects = CreatePharmacistPage(tester);

    await app.main();
    await tester.pumpAndSettle();

    expect(find.text(SS.translate.Search), findsOneWidget);

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
    final selectPharmacist = find.text(SS.translate.pharmacist);
    await tester.tap(selectPharmacist);
    await tester.pumpAndSettle();

    await tester.tap(commonObjects.startButton);
    await tester.pumpAndSettle();

    // Fill pharmacist data
    await tester.enterText(objects.firstNameTextfield, 'Kuba');
    await tester.pumpAndSettle();

    await tester.enterText(objects.lastNameTextfield, 'Asanov');
    await tester.pumpAndSettle();

    await tester.enterText(objects.patronymicTextfield, 'Abdukadyrovich');
    await tester.pumpAndSettle();

    await tester.tap(objects.nextButton1);
    await tester.pumpAndSettle();

    await tester.tap(objects.birthday);
    await tester.pumpAndSettle();

    await tester.fling(
      objects.scrollablePicker,
      const Offset(0, 100),
      1000,
    );

    await tester.tap(objects.okButton);
    await tester.pumpAndSettle();

    await tester.tap(objects.nextButton1);
    await tester.pumpAndSettle();

    await tester.enterText(objects.institutionOfEducation, 'KSMA Akhunbaev');
    await tester.pumpAndSettle();

    await tester.enterText(objects.departmentOfPharm, 'Pharmacy');
    await tester.pumpAndSettle();

    await tester.tap(objects.educationYearsSince);
    await tester.pumpAndSettle();

    await tester.fling(
      objects.educationYearsScrollable,
      const Offset(0, 100),
      1000,
    );
    await tester.pumpAndSettle();

    await tester.tap(objects.okButton);
    await tester.pumpAndSettle();

    await tester.tap(objects.educationYearsUntil);
    await tester.pumpAndSettle();

    await tester.fling(
      objects.educationYearsScrollable,
      const Offset(0, 50),
      1000,
    );
    await tester.tap(objects.okButton);
    await tester.pumpAndSettle();

    await tester.tap(objects.nextButton1);
    await tester.pumpAndSettle();

    await tester.enterText(objects.address, 'Bishkek');
    await tester.pumpAndSettle();

    await tester.tap(objects.region);
    await tester.pumpAndSettle();

    await tester.fling(
      objects.regionPicker,
      const Offset(0, -100),
      1000,
    );
    await tester.pumpAndSettle();

    await tester.tap(objects.okButton);
    await tester.pumpAndSettle();

    await tester.enterText(objects.nameOfTheInstitution, '4 State Hospital');
    await tester.pumpAndSettle();

    await tester.enterText(objects.position, 'Pharmacist');
    await tester.pumpAndSettle();

    await tester.tap(objects.experienceSince);
    await tester.pumpAndSettle();

    await tester.fling(
      objects.educationYearsScrollable,
      const Offset(0, 50),
      1000,
    );
    await tester.pumpAndSettle();
    await tester.tap(objects.okButton);
    await tester.pumpAndSettle();

    await tester.tap(objects.experienceUntil);
    await tester.pumpAndSettle();

    await tester.fling(
      objects.educationYearsScrollable,
      const Offset(0, 40),
      1000,
    );
    await tester.pumpAndSettle();
    await tester.tap(objects.okButton);
    await tester.pumpAndSettle();

    await tester.tap(objects.nextButton1);
    await tester.pumpAndSettle();
    await tester.tap(objects.nextButton1);
    await tester.pumpAndSettle();

    // See onboarding of Meducation section for pharmacists

    await tester.tap(objects.onBoardingNextButton);
    await tester.pumpAndSettle();

    await tester.tap(objects.onBoardingNextButton);
    await tester.pumpAndSettle();

    await tester.tap(objects.onBoardingNextButton);
    await tester.pumpAndSettle();

    await tester.tap(objects.onBoardingNextButton);
    await tester.pumpAndSettle();

    await tester.tap(objects.onBoardingNextButton);
    await tester.pumpAndSettle();

    // opening Profile page
    final Finder profilebutton = find.text(SS.translate.profile);
    await tester.tap(profilebutton, warnIfMissed: false);
    await tester.pumpAndSettle();

    // See created pharmacist profile
    // expect(find.text('Kuba Asanov Abdukadyrovich'), findsOneWidget);

    // Delete pharmacist account
    await tester.fling(
      find.byType(ListView),
      const Offset(0, -200),
      5000,
    );
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
