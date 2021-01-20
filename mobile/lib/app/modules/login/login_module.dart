import 'package:flutter_modular/flutter_modular.dart';

import 'package:crimson_labs/app/modules/login/repositories/login_repository.dart';
import 'package:crimson_labs/app/modules/login/repositories/login_repository_interface.dart';

import 'login_controller.dart';
import 'login_page.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
    Bind<ILoginRepository>((i) => LoginRepository(i.get())),
    Bind((i) => LoginController(i.get(), i.get(), i.get())),
  ];

  @override
  List<ModularRouter> get routers => [
    ModularRouter(Modular.initialRoute, child: (_, args) => LoginPage()),
  ];

  static Inject get to => Inject<LoginModule>.of();
}
