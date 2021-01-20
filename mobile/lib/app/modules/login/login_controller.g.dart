// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $LoginController = BindInject(
  (i) => LoginController(
      i<ILoginRepository>(), i<ILocalStorage>(), i<UserStore>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginControllerBase, Store {
  Computed<bool> _$canNextComputed;

  @override
  bool get canNext => (_$canNextComputed ??= Computed<bool>(() => super.canNext,
          name: '_LoginControllerBase.canNext'))
      .value;
  Computed<bool> _$loginLoadingComputed;

  @override
  bool get loginLoading =>
      (_$loginLoadingComputed ??= Computed<bool>(() => super.loginLoading,
              name: '_LoginControllerBase.loginLoading'))
          .value;

  final _$emailControllerAtom =
      Atom(name: '_LoginControllerBase.emailController');

  @override
  TextEditingController get emailController {
    _$emailControllerAtom.reportRead();
    return super.emailController;
  }

  @override
  set emailController(TextEditingController value) {
    _$emailControllerAtom.reportWrite(value, super.emailController, () {
      super.emailController = value;
    });
  }

  final _$passwordControllerAtom =
      Atom(name: '_LoginControllerBase.passwordController');

  @override
  TextEditingController get passwordController {
    _$passwordControllerAtom.reportRead();
    return super.passwordController;
  }

  @override
  set passwordController(TextEditingController value) {
    _$passwordControllerAtom.reportWrite(value, super.passwordController, () {
      super.passwordController = value;
    });
  }

  final _$_loginLoadingAtom = Atom(name: '_LoginControllerBase._loginLoading');

  @override
  bool get _loginLoading {
    _$_loginLoadingAtom.reportRead();
    return super._loginLoading;
  }

  @override
  set _loginLoading(bool value) {
    _$_loginLoadingAtom.reportWrite(value, super._loginLoading, () {
      super._loginLoading = value;
    });
  }

  final _$_canNextAtom = Atom(name: '_LoginControllerBase._canNext');

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

  final _$loginAsyncAction = AsyncAction('_LoginControllerBase.login');

  @override
  Future<void> login() {
    return _$loginAsyncAction.run(() => super.login());
  }

  final _$_LoginControllerBaseActionController =
      ActionController(name: '_LoginControllerBase');

  @override
  dynamic checkValidation() {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.checkValidation');
    try {
      return super.checkValidation();
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
emailController: ${emailController},
passwordController: ${passwordController},
canNext: ${canNext},
loginLoading: ${loginLoading}
    ''';
  }
}
