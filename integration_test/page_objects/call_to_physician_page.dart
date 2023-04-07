import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:medcheck/common/common_widgets.dart';
import 'package:medcheck/widgets/user/user_custom_info_card.dart';

// Used singleton pattern which ensures that a class has only one instance
// and also provides a global point of access to it.
class CallToPhysicianPage {
  static CallToPhysicianPage? _instance;

  factory CallToPhysicianPage(WidgetTester tester) =>
      _instance ??= CallToPhysicianPage._(tester);

  CallToPhysicianPage._(this.tester);

  WidgetTester tester;

  final nestedScrollView = find.byType(NestedScrollView);
  final Finder category = find.text('Уролог');
  final physicianTile = find.byKey(const Key('physicianCardKey')).first;
  final primaryButton = find.byType(PrimaryButton);
  final workPhone = find.byType(UserCustomInfoCard).first;
}
