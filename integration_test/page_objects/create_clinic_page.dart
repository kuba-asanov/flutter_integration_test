import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// Used singleton pattern which ensures that a class has only one instance
// and also provides a global point of access to it.
class CreateClinicPage {
  static CreateClinicPage? _instance;

  factory CreateClinicPage(WidgetTester tester) =>
      _instance ??= CreateClinicPage._(tester);

  CreateClinicPage._(this.tester);

  WidgetTester tester;

  final clinicNameTextfield = find.byKey(const Key('clinicNameController'));
  final buttonNextPage = find.byKey(const ValueKey('next'));
  final clinicAddressCity =
      find.byKey(const Key('clinicAddressCityController'));
  final clinicAdressStreet =
      find.byKey(const Key('clinicAddressStreetController'));
  final textFieldWithAutoComplete =
      find.byKey(const Key('textFieldWithAutoComplete'));
}
