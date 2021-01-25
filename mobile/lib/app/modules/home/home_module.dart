import 'package:crimson_labs/app/modules/products/products_module.dart';

import 'home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
    Bind((i) => HomeController()),
  ];

  @override
  List<ModularRouter> get routers => [
    ModularRouter(Modular.initialRoute, child: (_, args) => HomePage()),
    ModularRouter("/products", module: ProductsModule()),
  ];

  static Inject get to => Inject<HomeModule>.of();
}
