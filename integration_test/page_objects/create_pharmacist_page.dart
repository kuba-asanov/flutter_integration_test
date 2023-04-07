import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// Used singleton pattern which ensures that a class has only one instance
// and also provides a global point of access to it.
class CreatePharmacistPage {
  static CreatePharmacistPage? _instance;

  factory CreatePharmacistPage(WidgetTester tester) =>
      _instance ??= CreatePharmacistPage._(tester);

  CreatePharmacistPage._(this.tester);

  WidgetTester tester;

  final firstNameTextfield = find.byKey(const Key('firstNameController'));
  final lastNameTextfield = find.byKey(const Key('lastNameController'));
  final patronymicTextfield = find.byKey(const Key('patronymicController'));
  final nextButton1 = find.byKey(const Key('PrimaryButtonOnCreatePharmPage'));
  final birthday = find.byKey(const Key('BirthDay'));
  final scrollablePicker = find.byKey(const ValueKey('bithdayDateKey'));
  final okButton = find.byKey(const ValueKey('okButton'));
  final institutionOfEducation =
      find.byKey(const Key('institutionOfEducation'));
  final departmentOfPharm = find.byKey(const Key('departmentOfPharm'));
  final educationYearsSince = find.byKey(const Key('educationYearsSince'));
  final educationYearsScrollable =
      find.byKey(const ValueKey('educationYearsSelect'));
  final educationYearsUntil = find.byKey(const Key('educationYearsUntil'));
  final address = find.byKey(const Key('addressCityController'));
  final region = find.byKey(const Key('RegionKey'));
  final regionPicker = find.byKey(const ValueKey('RegionPickerKey'));
  final nameOfTheInstitution = find.byKey(const Key('nameOfTheInstitution'));
  final position = find.byKey(const Key('position'));
  final experienceSince = find.byKey(const Key('experienceSince'));
  final experienceUntil = find.byKey(const Key('experienceUntil'));
  final onBoardingNextButton = find.byKey(const Key('onBoardingNextButton'));
}
