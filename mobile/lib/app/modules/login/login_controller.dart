import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';

import 'package:crimson_labs/app/core/components/dialogs/common_dialog.dart';
import 'package:crimson_labs/app/core/services/local_storage/local_storage_interface.dart';
import 'package:crimson_labs/app/core/stores/user_store.dart';
import 'package:crimson_labs/app/core/utils/constants.dart';
import 'package:crimson_labs/app/core/utils/validators.dart';
import 'package:crimson_labs/app/modules/login/models/login_payload_model.dart';
import 'package:crimson_labs/app/modules/login/repositories/login_repository_interface.dart';

part 'login_controller.g.dart';

@Injectable()
class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {

  ILoginRepository _loginRepository;
  ILocalStorage _localStorage;
  UserStore _userStore;

  _LoginControllerBase(this._loginRepository, this._localStorage, this._userStore);
  
  @observable
  TextEditingController emailController = new TextEditingController();

  @observable
  TextEditingController passwordController = new TextEditingController();

  @observable
  bool _loginLoading = false;

  @observable
  bool _canNext = false;

  @action
  Future<void> login() async {
    _loginLoading = true;
    final payload = LoginPayloadModel(
      email: emailController.text,
      password: passwordController.text,
    );
    final loginResponse = await _loginRepository.login(payload);
    if (loginResponse.statusCode == 200) {
      await _localStorage.put("token", loginResponse.data.token);
      await _localStorage.put("userId", loginResponse.data.id);
      final userData = await _userStore.loadUserInfo();
      if (userData) {
        Get.offNamed("/home");
      }
      else {
        await Get.dialog(CommonDialog(
          text: "Error!",
          subtext: "It was impossible to load user data",
          type: DialogType.error,
        ));
      }
    }
    else if (loginResponse.statusCode == 404 && loginResponse.data.message == "User or password invalid") {
      Get.dialog(CommonDialog(
        text: "Invalid Credentials!",
        subtext: "Verify if email and password are correct.",
        type: DialogType.info,
      ));
    }
    else {
      debugPrint("Error: ${loginResponse?.errorMessage}");
      Get.dialog(CommonDialog(
        text: "Error!",
        subtext: "There was an error during login.",
        type: DialogType.error,
      ));
    }
    _loginLoading = false;
  }

  @action
  checkValidation() {
    _canNext = validateEmail(emailController.text) == null &&
    validatePassword(passwordController.text) == null;
  }

  @computed
  bool get canNext => _canNext;
  
  @computed
  bool get loginLoading => _loginLoading;

}
