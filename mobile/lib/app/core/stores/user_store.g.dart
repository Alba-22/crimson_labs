// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserStore on _UserStoreBase, Store {
  Computed<UserModel> _$userInfoComputed;

  @override
  UserModel get userInfo =>
      (_$userInfoComputed ??= Computed<UserModel>(() => super.userInfo,
              name: '_UserStoreBase.userInfo'))
          .value;

  final _$_userInfoAtom = Atom(name: '_UserStoreBase._userInfo');

  @override
  UserModel get _userInfo {
    _$_userInfoAtom.reportRead();
    return super._userInfo;
  }

  @override
  set _userInfo(UserModel value) {
    _$_userInfoAtom.reportWrite(value, super._userInfo, () {
      super._userInfo = value;
    });
  }

  final _$loadUserInfoAsyncAction = AsyncAction('_UserStoreBase.loadUserInfo');

  @override
  Future<bool> loadUserInfo() {
    return _$loadUserInfoAsyncAction.run(() => super.loadUserInfo());
  }

  @override
  String toString() {
    return '''
userInfo: ${userInfo}
    ''';
  }
}
