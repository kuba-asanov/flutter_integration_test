import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// Used singleton pattern which ensures that a class has only one instance
// and also provides a global point of access to it.
class CreatePhysicianPage {
  static CreatePhysicianPage? _instance;

  factory CreatePhysicianPage(WidgetTester tester) =>
      _instance ??= CreatePhysicianPage._(tester);

  CreatePhysicianPage._(this.tester);

  WidgetTester tester;

  final firstNameTextfield = find.byKey(const Key('firstNameController'));
  final lastNameTextfield = find.byKey(const Key('lastNameController'));
  final patronymicTextfield = find.byKey(const Key('patronymicController'));
  final nextButton1 = find.byKey(const ValueKey('next'));
  final textFieldWithAutoComplete =
      find.byKey(const ValueKey('textFieldWithAutoComplete'));
  final experience = find.byKey(const ValueKey('experience'));
  final scrollablePicker = find.byKey(const ValueKey('picker'));
  final okButton = find.byKey(const ValueKey('okButton'));
}
