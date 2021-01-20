import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:crimson_labs/app/core/repositories/user/user_repository.dart';
import 'package:crimson_labs/app/core/stores/user_store.dart';

import 'app_controller.dart';
import 'app_widget.dart';
import 'core/services/client_http/client_http_interface.dart';
import 'core/services/client_http/client_http_service.dart';
import 'core/services/local_storage/local_storage_interface.dart';
import 'core/services/local_storage/local_storage_service.dart';
import 'core/utils/constants.dart';
import 'modules/home/home_module.dart';
import 'modules/login/login_module.dart';
import 'pages/splash/splash_controller.dart';
import 'pages/splash/splash_page.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
    Bind((i) => AppController()),
    Bind<ILocalStorage>((i) => LocalStorageService()),
    Bind<IClientHttp>((i) => ClientHttpService("${Api.url}", i.get())),
    Bind((i) => UserStore(UserRepository(i.get()))),
    Bind((i) => SplashController(i.get(), i.get())),
  ];

  @override
  List<ModularRouter> get routers => [
    ModularRouter(Modular.initialRoute, child: (_, __) => SplashPage()),
    ModularRouter("/login", module: LoginModule()),
    ModularRouter("/home", module: HomeModule()),
  ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
