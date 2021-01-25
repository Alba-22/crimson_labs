import 'pages/cart/cart_controller.dart';
import 'pages/products_add/products_add_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'products_controller.dart';
import 'products_page.dart';
import 'pages/products_list/products_list_controller.dart';
import 'pages/products_list/products_list_page.dart';
import 'repositories/products_repository.dart';
import 'repositories/products_repository_interface.dart';

class ProductsModule extends ChildModule {
  @override
  List<Bind> get binds => [
    Bind<IProductsRepository>((i) => ProductsRepository(i.get())),
    Bind((i) => ProductsController()),
    Bind((i) => CartController()),
    Bind((i) => ProductsAddController()),
    Bind((i) => ProductsListController(i.get()))
  ];

  @override
  List<ModularRouter> get routers => [
    ModularRouter(Modular.initialRoute, child: (_, args) => ProductsPage()),
    ModularRouter("/list", child: (_, args) => ProductsListPage()),
  ];

  static Inject get to => Inject<ProductsModule>.of();
}
