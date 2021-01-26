import 'package:flutter_modular/flutter_modular.dart';

import 'package:crimson_labs/app/modules/products/pages/cart/cart_page.dart';
import 'package:crimson_labs/app/modules/products/pages/products_add/products_add_page.dart';

import 'pages/cart/cart_controller.dart';
import 'pages/products_add/products_add_controller.dart';
import 'pages/products_list/products_list_controller.dart';
import 'pages/products_list/products_list_page.dart';
import 'products_controller.dart';
import 'products_page.dart';
import 'repositories/products_repository.dart';
import 'repositories/products_repository_interface.dart';
import 'stores/cart_store.dart';

class ProductsModule extends ChildModule {
  @override
  List<Bind> get binds => [
    Bind((i) => CartStore()),
    Bind<IProductsRepository>((i) => ProductsRepository(i.get())),
    Bind((i) => ProductsController()),
    Bind((i) => CartController()),
    Bind((i) => ProductsAddController(i.get())),
    Bind((i) => ProductsListController(i.get()))
  ];

  @override
  List<ModularRouter> get routers => [
    ModularRouter(Modular.initialRoute, child: (_, args) => ProductsPage()),
    ModularRouter("/list", child: (_, args) => ProductsListPage()),
    ModularRouter("/create", child: (_, args) => ProductsAddPage()),
    ModularRouter("/cart", child: (_, args) => CartPage()),
  ];

  static Inject get to => Inject<ProductsModule>.of();
}
