import 'package:mobx/mobx.dart';

import 'package:crimson_labs/app/core/models/user_model.dart';
import 'package:crimson_labs/app/core/repositories/user/user_repository_interface.dart';

part 'user_store.g.dart';

class UserStore = _UserStoreBase with _$UserStore;

abstract class _UserStoreBase with Store {

  IUserRepository _userRepository;

  _UserStoreBase(this._userRepository);
  
  @observable
  UserModel _userInfo;

  @action
  Future<bool> loadUserInfo() async {
    final response = await _userRepository.getUserData();
    if (response.statusCode == 200) {
      _userInfo = response.data;
      return true;
    }
    return false;
  }

  @computed
  UserModel get userInfo => _userInfo;

}