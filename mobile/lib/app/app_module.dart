import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:crimson_labs/app/app_widget.dart';
import 'package:crimson_labs/app/modules/login/login_module.dart';

import 'app_controller.dart';
import 'pages/splash/splash_controller.dart';
import 'pages/splash/splash_page.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
    Bind((i) => SplashController()),
    Bind((i) => AppController()),
  ];

  @override
  List<ModularRouter> get routers => [
    ModularRouter(Modular.initialRoute, child: (_, __) => SplashPage()),
    ModularRouter("/login", module: LoginModule()),
  ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
