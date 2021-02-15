import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';

import 'package:crimson_labs/app/core/services/local_storage/local_storage_interface.dart';

import 'components/logout_dialog.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {

  ILocalStorage _localStorage;

  _HomeControllerBase(this._localStorage);

  @action
  Future<void> logout() async {
    Get.dialog(LogoutDialog(
      onAccept: () async {
        await _localStorage.delete("token");
        await _localStorage.delete("userId");
        Modular.to.pushNamedAndRemoveUntil("/login", ModalRoute.withName("/"));
      },
      onDeny: () {
        Modular.to.pop();
      },
    ));
  }

}
