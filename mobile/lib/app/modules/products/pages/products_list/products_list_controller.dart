import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'package:crimson_labs/app/modules/products/models/product_response_model.dart';
import 'package:crimson_labs/app/modules/products/repositories/products_repository_interface.dart';

part 'products_list_controller.g.dart';

@Injectable()
class ProductsListController = _ProductsListControllerBase with _$ProductsListController;

abstract class _ProductsListControllerBase with Store {
  IProductsRepository _crudRepository;

  _ProductsListControllerBase(this._crudRepository);

  @observable
  ObservableList<Product> _products;

  @observable
  bool _productListLoading = false;

  @observable
  String _fetchingError;

  @action
  Future<void> fetchProductList() async {
    _productListLoading = true;
    _fetchingError = null;
    await _crudRepository.getAllProducts()
    .then((value) {
      if (value.statusCode == 200) {
        _products = value.data.products.asObservable();
      }
      else {
        _fetchingError = "There was an internal error while loading products.";
      }
    })
    .catchError((e) {
      _fetchingError = "${e.toString().replaceAll("Exception:", "")}";
    });
    _productListLoading = false;
  }

  @computed
  ObservableList<Product> get productList => _products;

  @computed
  bool get productListLoading => _productListLoading;

  @computed
  String get fetchingError => _fetchingError;
}
