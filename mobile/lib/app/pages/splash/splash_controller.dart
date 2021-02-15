import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';

import 'package:crimson_labs/app/core/components/dialogs/common_dialog.dart';
import 'package:crimson_labs/app/core/services/local_storage/local_storage_interface.dart';
import 'package:crimson_labs/app/core/stores/user_store.dart';
import 'package:crimson_labs/app/core/utils/constants.dart';

part 'splash_controller.g.dart';

@Injectable()
class SplashController = _SplashControllerBase with _$SplashController;

abstract class _SplashControllerBase with Store {

  ILocalStorage _localStorage;
  UserStore _userStore;

  _SplashControllerBase(this._localStorage, this._userStore);

  manageSplash() async {
    // await _localStorage.delete("token");
    final String token = await _localStorage.get("token");
    if (token != null && token != "") {
      Future.delayed(Duration(milliseconds: 1000))
      .then((value) async {
        final userData = await _userStore.loadUserInfo();
        if (userData) {
          Modular.to.pushReplacementNamed("/home");
        }
        else {
          Modular.to.pushReplacementNamed("/login");
          Get.dialog(CommonDialog(
            text: "Error!",
            subtext: "Your session expired.\nPlease sign in again.",
            type: DialogType.error,
          ));
        }
      });
    }
    else {
      Future.delayed(Duration(milliseconds: 1000))
      .then((value) async {
        Modular.to.pushReplacementNamed("/login");
      });
    }
  }

}
