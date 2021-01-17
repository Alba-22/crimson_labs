import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'splash_controller.g.dart';

@Injectable()
class SplashController = _SplashControllerBase with _$SplashController;

abstract class _SplashControllerBase with Store {

  manageSplash() async {
    Future.delayed(
      Duration(milliseconds: 1000),
      () async {
        await SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom, SystemUiOverlay.top]);
        Modular.to.pushReplacementNamed("/login");
      }
    );
  }

}
