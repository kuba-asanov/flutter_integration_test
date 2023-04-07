/* External dependencies */
import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';

/* Local dependencies */
import 'package:medcheck/main.dart' as app;

import 'helpers/sign_in.dart';

// Run this test with below command in terminal
// flutter test --dart-define=testing_mode=true integration_test/user_sign_in_test.dart

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  binding.testTextInput.register();

  testWidgets('User sign in integration test', (tester) async {
    await app.main();
    await tester.pumpAndSettle();

    // Sign-in process
    await signIn(tester);
  });
}
