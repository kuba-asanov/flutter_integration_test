import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:medcheck/common/common_widgets.dart';
import 'package:medcheck/common/elevated_card_widget.dart';

// Used singleton pattern which ensures that a class has only one instance
// and also provides a global point of access to it.
class UserSignInPage {
  static UserSignInPage? _instance;

  factory UserSignInPage(WidgetTester tester) =>
      _instance ??= UserSignInPage._(tester);

  UserSignInPage._(this.tester);

  WidgetTester tester;

  final profileTap = find.byKey(const Key('profile_tap'));
  final button = find.byType(PrimaryButton);
  final phoneTextField = find.byKey(const Key("1st textField"));
  final smsTextField = find.byKey(const Key("sms-confirm textField"));
  final elevatedCard = find.byType(ElevatedCardWidget);
}
