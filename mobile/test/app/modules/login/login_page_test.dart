import 'package:crimson_labs/app/app_module.dart';
import 'package:crimson_labs/app/modules/login/components/login_field.dart';
import 'package:crimson_labs/app/modules/login/login_module.dart';
import 'package:crimson_labs/app/modules/login/login_page.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  initModule(AppModule());
  initModule(LoginModule());
  group("LoginPage Test", () {
    testWidgets('Enter email correct', (tester) async {
      // Builds UI
      await tester.pumpWidget(buildTestableWidget(LoginPage()));

      // Find widgets to test
      final emailField = find.byType(LoginField).at(0);

      // Execute test
      await tester.enterText(emailField, "alba@test.io");
      await tester.pump(); // Rebuilds Widget

      // Check Outputs
      expect(find.text("alba@test.io"), findsOneWidget);
      expect(find.text("Invalid email!"), findsNothing);
    });
    testWidgets('Enter email incorrect', (tester) async {
      // Builds UI
      await tester.pumpWidget(buildTestableWidget(LoginPage()));

      // Find widgets to test
      final emailField = find.byType(LoginField).at(0);

      // Execute test
      await tester.enterText(emailField, "alba@test");
      await tester.pump(); // Rebuilds Widget

      // Check Outputs
      expect(find.text("alba@test"), findsOneWidget);
      expect(find.text("Invalid email!"), findsOneWidget);
    });
    testWidgets('Enter password correct', (tester) async {
      // Builds UI
      await tester.pumpWidget(buildTestableWidget(LoginPage()));
      
      // Find widgets to test
      final passwordField = find.byType(LoginField).at(1);

      // Execute test
      await tester.enterText(passwordField, "123456789");
      await tester.pump(); // Rebuilds Widget

      // Check Outputs
      expect(find.text("123456789"), findsOneWidget);
      expect(find.text("Invalid password!"), findsNothing);
    });
    testWidgets('Enter password incorrect', (tester) async {
      // Builds UI
      await tester.pumpWidget(buildTestableWidget(LoginPage()));
      
      // Find widgets to test
      final passwordField = find.byType(LoginField).at(1);

      // Execute test
      await tester.enterText(passwordField, "123456");
      await tester.pump(); // Rebuilds Widget

      // Check Outputs
      expect(find.text("123456"), findsOneWidget);
      expect(find.text("Password too short!"), findsOneWidget);
    });
  });
}
