// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_add_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $ProductsAddController = BindInject(
  (i) => ProductsAddController(i<IProductsRepository>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductsAddController on _ProductsAddControllerBase, Store {
  Computed<bool> _$canNextComputed;

  @override
  bool get canNext => (_$canNextComputed ??= Computed<bool>(() => super.canNext,
          name: '_ProductsAddControllerBase.canNext'))
      .value;
  Computed<bool> _$addingProductLoadingComputed;

  @override
  bool get addingProductLoading => (_$addingProductLoadingComputed ??=
          Computed<bool>(() => super.addingProductLoading,
              name: '_ProductsAddControllerBase.addingProductLoading'))
      .value;

  final _$nameControllerAtom =
      Atom(name: '_ProductsAddControllerBase.nameController');

  @override
  TextEditingController get nameController {
    _$nameControllerAtom.reportRead();
    return super.nameController;
  }

  @override
  set nameController(TextEditingController value) {
    _$nameControllerAtom.reportWrite(value, super.nameController, () {
      super.nameController = value;
    });
  }

  final _$descriptionControllerAtom =
      Atom(name: '_ProductsAddControllerBase.descriptionController');

  @override
  TextEditingController get descriptionController {
    _$descriptionControllerAtom.reportRead();
    return super.descriptionController;
  }

  @override
  set descriptionController(TextEditingController value) {
    _$descriptionControllerAtom.reportWrite(value, super.descriptionController,
        () {
      super.descriptionController = value;
    });
  }

  final _$priceControllerAtom =
      Atom(name: '_ProductsAddControllerBase.priceController');

  @override
  MoneyMaskedTextController get priceController {
    _$priceControllerAtom.reportRead();
    return super.priceController;
  }

  @override
  set priceController(MoneyMaskedTextController value) {
    _$priceControllerAtom.reportWrite(value, super.priceController, () {
      super.priceController = value;
    });
  }

  final _$tagsControllerAtom =
      Atom(name: '_ProductsAddControllerBase.tagsController');

  @override
  TextEditingController get tagsController {
    _$tagsControllerAtom.reportRead();
    return super.tagsController;
  }

  @override
  set tagsController(TextEditingController value) {
    _$tagsControllerAtom.reportWrite(value, super.tagsController, () {
      super.tagsController = value;
    });
  }

  final _$_canNextAtom = Atom(name: '_ProductsAddControllerBase._canNext');

  @override
  bool get _canNext {
    _$_canNextAtom.reportRead();
    return super._canNext;
  }

  @override
  set _canNext(bool value) {
    _$_canNextAtom.reportWrite(value, super._canNext, () {
      super._canNext = value;
    });
  }

  final _$_addingProductLoadingAtom =
      Atom(name: '_ProductsAddControllerBase._addingProductLoading');

  @override
  bool get _addingProductLoading {
    _$_addingProductLoadingAtom.reportRead();
    return super._addingProductLoading;
  }

  @override
  set _addingProductLoading(bool value) {
    _$_addingProductLoadingAtom.reportWrite(value, super._addingProductLoading,
        () {
      super._addingProductLoading = value;
    });
  }

  final _$addProductAsyncAction =
      AsyncAction('_ProductsAddControllerBase.addProduct');

  @override
  Future<void> addProduct() {
    return _$addProductAsyncAction.run(() => super.addProduct());
  }

  final _$_ProductsAddControllerBaseActionController =
      ActionController(name: '_ProductsAddControllerBase');

  @override
  dynamic checkValidation() {
    final _$actionInfo = _$_ProductsAddControllerBaseActionController
        .startAction(name: '_ProductsAddControllerBase.checkValidation');
    try {
      return super.checkValidation();
    } finally {
      _$_ProductsAddControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nameController: ${nameController},
descriptionController: ${descriptionController},
priceController: ${priceController},
tagsController: ${tagsController},
canNext: ${canNext},
addingProductLoading: ${addingProductLoading}
    ''';
  }
}
