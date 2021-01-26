// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CartStore on _CartStoreBase, Store {
  Computed<ObservableList<Product>> _$cartComputed;

  @override
  ObservableList<Product> get cart =>
      (_$cartComputed ??= Computed<ObservableList<Product>>(() => super.cart,
              name: '_CartStoreBase.cart'))
          .value;
  Computed<int> _$totalItemsComputed;

  @override
  int get totalItems =>
      (_$totalItemsComputed ??= Computed<int>(() => super.totalItems,
              name: '_CartStoreBase.totalItems'))
          .value;
  Computed<double> _$totalPriceComputed;

  @override
  double get totalPrice =>
      (_$totalPriceComputed ??= Computed<double>(() => super.totalPrice,
              name: '_CartStoreBase.totalPrice'))
          .value;

  final _$_cartAtom = Atom(name: '_CartStoreBase._cart');

  @override
  ObservableList<Product> get _cart {
    _$_cartAtom.reportRead();
    return super._cart;
  }

  @override
  set _cart(ObservableList<Product> value) {
    _$_cartAtom.reportWrite(value, super._cart, () {
      super._cart = value;
    });
  }

  final _$_totalItemsAtom = Atom(name: '_CartStoreBase._totalItems');

  @override
  int get _totalItems {
    _$_totalItemsAtom.reportRead();
    return super._totalItems;
  }

  @override
  set _totalItems(int value) {
    _$_totalItemsAtom.reportWrite(value, super._totalItems, () {
      super._totalItems = value;
    });
  }

  final _$_totalPriceAtom = Atom(name: '_CartStoreBase._totalPrice');

  @override
  double get _totalPrice {
    _$_totalPriceAtom.reportRead();
    return super._totalPrice;
  }

  @override
  set _totalPrice(double value) {
    _$_totalPriceAtom.reportWrite(value, super._totalPrice, () {
      super._totalPrice = value;
    });
  }

  final _$_CartStoreBaseActionController =
      ActionController(name: '_CartStoreBase');

  @override
  dynamic addItemToCart(Product item) {
    final _$actionInfo = _$_CartStoreBaseActionController.startAction(
        name: '_CartStoreBase.addItemToCart');
    try {
      return super.addItemToCart(item);
    } finally {
      _$_CartStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic increaseQuantity(int index) {
    final _$actionInfo = _$_CartStoreBaseActionController.startAction(
        name: '_CartStoreBase.increaseQuantity');
    try {
      return super.increaseQuantity(index);
    } finally {
      _$_CartStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic decreaseQuantity(int index) {
    final _$actionInfo = _$_CartStoreBaseActionController.startAction(
        name: '_CartStoreBase.decreaseQuantity');
    try {
      return super.decreaseQuantity(index);
    } finally {
      _$_CartStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cart: ${cart},
totalItems: ${totalItems},
totalPrice: ${totalPrice}
    ''';
  }
}
