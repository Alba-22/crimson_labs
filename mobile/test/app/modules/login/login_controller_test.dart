import 'package:crimson_labs/app/modules/login/repositories/login_repository_interface.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:crimson_labs/app/app_module.dart';
import 'package:crimson_labs/app/modules/login/login_controller.dart';
import 'package:crimson_labs/app/modules/login/login_module.dart';

import 'repositories/login_repository_mock.dart';

void main() {
  initModule(AppModule());
  initModule(LoginModule(), changeBinds: [
    Bind<ILoginRepository>((i) => LoginRepositoryMock()),
  ]);
  LoginController loginController;
  setUp(() {
    loginController = LoginModule.to.get<LoginController>();
  });

  group('LoginController Test', () {
    test("Check Instances", () {
      expect(loginController, isInstanceOf<LoginController>());
    });

    test("Login Action", () {
      
      // loginController.emailController.text = "alba@test.io";
      // loginController.passwordController.text = "123456789";

      // loginController.login();

    });
  });
}
