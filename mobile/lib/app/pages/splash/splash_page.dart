import 'package:crimson_labs/app/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'splash_controller.dart';

class SplashPage extends StatefulWidget {

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends ModularState<SplashPage, SplashController> {

  @override
  void initState() { 
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setEnabledSystemUIOverlays([]);
    controller.manageSplash();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF121212),
        child: Stack(
          children: [
            Center(
              child: Image.asset(
                "${Paths.icon}/crimson_vertical.png",
                scale: 2,
              ),
            ),
            Center(
              child: Container(
                height: 300,
                width: 300,
                child: CircularProgressIndicator(
                  strokeWidth: 10,
                  valueColor: AlwaysStoppedAnimation(Theme.of(context).primaryColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
