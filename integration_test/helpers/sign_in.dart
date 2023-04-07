import 'package:flutter_test/flutter_test.dart';

import '../page_objects/user_sign_in_page.dart';

Future<void> signIn(WidgetTester tester) async {
  UserSignInPage objects = UserSignInPage(tester);

  // Selecting profile tab in bottom navigation bar
  await tester.tap(objects.profileTap);
  await tester.pumpAndSettle();

  // Start signing in
  await tester.tap(objects.button);
  await tester.pumpAndSettle();

  // Entering phone number
  await tester.enterText(objects.phoneTextField, '777434530');
  await tester.pumpAndSettle();

  // Confirming phone number by tapping next button
  await tester.tap(objects.button);
  await tester.pumpAndSettle();

  // Entering sms confirmation code
  await tester.enterText(objects.smsTextField, '3197');
  await tester.pumpAndSettle();

  // expecting MedcheckID card and Settings card
  expect(objects.elevatedCard, findsNWidgets(2));
}
