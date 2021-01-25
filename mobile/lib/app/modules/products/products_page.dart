import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:crimson_labs/app/core/components/appbar/custom_appbar.dart';
import 'package:crimson_labs/app/modules/products/components/products_menu_item_widget.dart';

import 'products_controller.dart';

class ProductsPage extends StatefulWidget {

  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends ModularState<ProductsPage, ProductsController> {

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
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              child: AutoSizeText(
                "C.R.U.D. and Cart",
                maxLines: 1,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(height: 5),
            Expanded(
              child: ListView(
                children: [
                  ProductsMenuItemWidget(
                    title: "Add Product",
                    onTap: () {},
                    icon: Icons.add,
                  ),
                  ProductsMenuItemWidget(
                    title: "List Product",
                    icon: FontAwesomeIcons.list,
                    fontAwesomeIcon: true,
                    onTap: () => Modular.link.pushNamed("/list"),
                  ),
                  ProductsMenuItemWidget(
                    title: "Open Cart",
                    icon: FontAwesomeIcons.cartArrowDown,
                    fontAwesomeIcon: true,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
