import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// Used singleton pattern which ensures that a class has only one instance
// and also provides a global point of access to it.
class CreateProAccountPage {
  static CreateProAccountPage? _instance;

  factory CreateProAccountPage(WidgetTester tester) =>
      _instance ??= CreateProAccountPage._(tester);

  CreateProAccountPage._(this.tester);

  WidgetTester tester;

  // Starting create pro account objects
  final setting = find.byKey(const ValueKey('setting'));
  final createAccount = find.byKey(const Key("pro-account"));
  final createProAccount = find.byKey(const ValueKey('create_proAccount'));
  final startButton = find.byKey(const Key('PrimaryButtonNextPage'));

  // Deleting pro account objects
  final deleteBtn = find.byKey(const ValueKey('delete_pro_account'));
  final deleteConfirmBtn = find.byKey(const Key('deleteButtonKey'));
}
