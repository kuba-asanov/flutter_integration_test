/* External dependencies */
import 'package:flutter/material.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';

/* Local dependencies */
import 'package:medcheck/helpers/localization.dart';
import 'package:medcheck/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Integration test to create Pharmacist account', (tester) async {
    await app.main();
    await tester.pumpAndSettle();

    // Skipping onboarding
    await tester.tap(find.byIcon(Icons.close));
    await tester.pumpAndSettle();

    expect(find.text(SS.translate.Search), findsOneWidget);

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
    final selectPharmacist = find.text(SS.translate.pharmacist);
    await tester.tap(selectPharmacist);
    await tester.pumpAndSettle();

    final startButton = find.byKey(const Key('PrimaryButtonNextPage'));
    await tester.tap(startButton);
    await tester.pumpAndSettle();

    // Fill pharmacist data
    final firstNameTextfield = find.byKey(const Key('firstNameController'));
    await tester.enterText(firstNameTextfield, 'Kuba');
    await tester.pumpAndSettle();

    final lastNameTextfield = find.byKey(const Key('lastNameController'));
    await tester.enterText(lastNameTextfield, 'Asanov');
    await tester.pumpAndSettle();

    final patronymicTextfield = find.byKey(const Key('patronymicController'));
    await tester.enterText(patronymicTextfield, 'Abdukadyrovich');
    await tester.pumpAndSettle();

    final nextButton1 = find.byKey(const Key('PrimaryButtonOnCreatePharmPage'));
    await tester.tap(nextButton1);
    await tester.pumpAndSettle();

    final birthday = find.byKey(const Key('BirthDay'));
    await tester.tap(birthday);
    await tester.pumpAndSettle();

    final scrollablePicker = find.byKey(const ValueKey('bithdayDateKey'));
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

    final institutionOfEducation =
        find.byKey(const Key('institutionOfEducation'));
    await tester.enterText(institutionOfEducation, 'KSMA Akhunbaev');
    await tester.pumpAndSettle();

    final departmentOfPharm = find.byKey(const Key('departmentOfPharm'));
    await tester.enterText(departmentOfPharm, 'Pharmacy');
    await tester.pumpAndSettle();

    final educationYearsSince = find.byKey(const Key('educationYearsSince'));
    await tester.tap(educationYearsSince);
    await tester.pumpAndSettle();

    final educationYearsScrollable =
        find.byKey(const ValueKey('educationYearsSelect'));
    await tester.fling(
      educationYearsScrollable,
      const Offset(0, 100),
      1000,
    );
    await tester.pumpAndSettle();

    await tester.tap(okButton);
    await tester.pumpAndSettle();

    final educationYearsUntil = find.byKey(const Key('educationYearsUntil'));
    await tester.tap(educationYearsUntil);
    await tester.pumpAndSettle();

    await tester.fling(
      educationYearsScrollable,
      const Offset(0, 50),
      1000,
    );
    await tester.tap(okButton);
    await tester.pumpAndSettle();

    await tester.tap(nextButton1);
    await tester.pumpAndSettle();

    final nameOfTheInstitution = find.byKey(const Key('nameOfTheInstitution'));
    await tester.enterText(nameOfTheInstitution, '4 State Hospital');

    await tester.pumpAndSettle();

    final position = find.byKey(const Key('position'));
    await tester.enterText(position, 'Pharmacist');

    await tester.pumpAndSettle();

    final experienceSince = find.byKey(const Key('experienceSince'));
    await tester.tap(experienceSince);
    await tester.pumpAndSettle();

    await tester.fling(
      educationYearsScrollable,
      const Offset(0, 50),
      1000,
    );
    await tester.pumpAndSettle();
    await tester.tap(okButton);
    await tester.pumpAndSettle();

    final experienceUntil = find.byKey(const Key('experienceUntil'));
    await tester.tap(experienceUntil);
    await tester.pumpAndSettle();

    await tester.fling(
      educationYearsScrollable,
      const Offset(0, 20),
      1000,
    );
    await tester.tap(okButton);
    await tester.pumpAndSettle();

    await tester.tap(nextButton1);
    await tester.pumpAndSettle();
    await tester.tap(nextButton1);
    await tester.pumpAndSettle();

    // See onboarding of Meducation section for pharmacists
    final onBoardingNextButton = find.byKey(const Key('onBoardingNextButton'));

    await tester.tap(onBoardingNextButton);
    await tester.pumpAndSettle();

    await tester.tap(onBoardingNextButton);
    await tester.pumpAndSettle();

    await tester.tap(onBoardingNextButton);
    await tester.pumpAndSettle();

    await tester.tap(onBoardingNextButton);
    await tester.pumpAndSettle();

    await tester.tap(onBoardingNextButton);
    await tester.pumpAndSettle();

    // opening Profile page
    await tester.tap(profilebutton);
    await tester.pumpAndSettle();

    // See created pharmacist profile
    expect(find.text('Kuba Asanov Abdukadyrovich'), findsOneWidget);

    // Delete pharmacist account
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
