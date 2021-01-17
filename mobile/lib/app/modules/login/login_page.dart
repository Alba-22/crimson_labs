import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:crimson_labs/app/core/components/buttons/main_button.dart';
import 'package:crimson_labs/app/core/utils/constants.dart';

import 'components/login_background_painter.dart';
import 'components/login_field.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Theme.of(context).accentColor,
            child: Stack(
              children: [
                CustomPaint(
                  size: Size.infinite, // Gets size from parent
                  painter: LoginBackgroundPainter(context),
                ),
                Positioned(
                  top: 0,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Image.asset(
                      "${Paths.icon}/crimson_vertical.png",
                      height: MediaQuery.of(context).size.height * 0.28,
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.35,
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05
                    ),
                    child: Column(
                      children: [
                        LoginField(
                          icon: Icons.mail,
                          text: "E-mail",
                        ),
                        SizedBox(height: 15),
                        LoginField(
                          icon: Icons.lock,
                          text: "Password",
                          obscure: true,
                        ),
                        SizedBox(height: 15),
                        MainButton(
                          width: MediaQuery.of(context).size.width * 0.5 >= 250
                          ? MediaQuery.of(context).size.width * 0.5
                          : 250,
                          inverted: true,
                          text: "Entrar",
                          onTap: () {},
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
