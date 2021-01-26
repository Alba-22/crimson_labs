// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_list_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $ProductsListController = BindInject(
  (i) => ProductsListController(i<IProductsRepository>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductsListController on _ProductsListControllerBase, Store {
  Computed<ObservableList<Product>> _$productListComputed;

  @override
  ObservableList<Product> get productList => (_$productListComputed ??=
          Computed<ObservableList<Product>>(() => super.productList,
              name: '_ProductsListControllerBase.productList'))
      .value;
  Computed<bool> _$productListLoadingComputed;

  @override
  bool get productListLoading => (_$productListLoadingComputed ??=
          Computed<bool>(() => super.productListLoading,
              name: '_ProductsListControllerBase.productListLoading'))
      .value;
  Computed<String> _$fetchingErrorComputed;

  @override
  String get fetchingError =>
      (_$fetchingErrorComputed ??= Computed<String>(() => super.fetchingError,
              name: '_ProductsListControllerBase.fetchingError'))
          .value;

  final _$_productsAtom = Atom(name: '_ProductsListControllerBase._products');

  @override
  ObservableList<Product> get _products {
    _$_productsAtom.reportRead();
    return super._products;
  }

  @override
  set _products(ObservableList<Product> value) {
    _$_productsAtom.reportWrite(value, super._products, () {
      super._products = value;
    });
  }

  final _$_productListLoadingAtom =
      Atom(name: '_ProductsListControllerBase._productListLoading');

  @override
  bool get _productListLoading {
    _$_productListLoadingAtom.reportRead();
    return super._productListLoading;
  }

  @override
  set _productListLoading(bool value) {
    _$_productListLoadingAtom.reportWrite(value, super._productListLoading, () {
      super._productListLoading = value;
    });
  }

  final _$_fetchingErrorAtom =
      Atom(name: '_ProductsListControllerBase._fetchingError');

  @override
  String get _fetchingError {
    _$_fetchingErrorAtom.reportRead();
    return super._fetchingError;
  }

  @override
  set _fetchingError(String value) {
    _$_fetchingErrorAtom.reportWrite(value, super._fetchingError, () {
      super._fetchingError = value;
    });
  }

  final _$fetchProductListAsyncAction =
      AsyncAction('_ProductsListControllerBase.fetchProductList');

  @override
  Future<void> fetchProductList() {
    return _$fetchProductListAsyncAction.run(() => super.fetchProductList());
  }

  @override
  String toString() {
    return '''
productList: ${productList},
productListLoading: ${productListLoading},
fetchingError: ${fetchingError}
    ''';
  }
}
