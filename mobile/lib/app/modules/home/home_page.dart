import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:crimson_labs/app/core/components/appbar/custom_appbar.dart';

import 'components/home_item_widget.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xFFDC143C),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05,
        ),
        padding: EdgeInsets.only(top: 5),
        child: Column(
          children: [
            Container(
              child: AutoSizeText(
                "Welcome to CrimsonLabs",
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              child: AutoSizeText(
                "This is just an testing app used purelly for learning purposes.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[700],
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  HomeItemWidget(
                    title: "C.R.U.D. and Cart",
                    description: "Simple CRUD operations, forms and a cart system made with help of MobX.",
                    icon: FontAwesomeIcons.cartPlus,
                    onTap: () => Modular.link.pushNamed("/products"),
                  ),
                  HomeItemWidget(
                    title: "Images Operations",
                    description: "Use of camera, gallery, QR Code scan and more.",
                    icon: FontAwesomeIcons.images,
                    onTap: () {
                      
                    },
                  ),
                  HomeItemWidget(
                    title: "Settings",
                    description: "Change language, theme and more options.",
                    icon: Icons.settings,
                    onTap: () {
                      
                    },
                  ),
                  HomeItemWidget(
                    title: "Logout",
                    description: "Leave the app and finalize session.",
                    icon: Icons.logout,
                    onTap: () {
                      
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 30,
        color: Theme.of(context).primaryColor,
        child: Center(
          child: Text(
            "Made by Gustavo Alba",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
