import 'package:auto_size_text/auto_size_text.dart';
import 'package:crimson_labs/app/core/components/buttons/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:crimson_labs/app/core/components/appbar/custom_appbar.dart';
import 'package:crimson_labs/app/modules/products/stores/cart_store.dart';

import '../../components/cart_item_widget.dart';
import 'cart_controller.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends ModularState<CartPage, CartController> {

  final _cartStore = Modular.get<CartStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Cart"),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(top: 5),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Observer(
                builder: (context) {
                  if (_cartStore.cart.length == 0) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeText(
                          "There's no items in cart",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 5),
                        MainButton(
                          text: "Open Products List",
                          onTap: () {
                            Modular.to.pop();
                            Modular.link.pushNamed("/list");
                          },
                        )
                      ],
                    );
                  }
                  return Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05,
                    ),
                    child: ListView.builder(
                      itemCount: _cartStore.cart.length,
                      itemBuilder: (context, index) {
                        return CartItemWidget(
                          item: _cartStore.cart[index],
                          index: index,
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            Observer(builder: (_) {
              if (_cartStore.cart.isNotEmpty) {
                return Container(
                  height: 70,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Container(
                            child: AutoSizeText(
                              "Total Price:",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: AutoSizeText(
                                "\$${_cartStore.totalPrice.toStringAsFixed(2)}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            child: AutoSizeText(
                              "Total Items:",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: AutoSizeText(
                                _cartStore.totalItems == 1
                                ? "${_cartStore.totalItems} item"
                                : "${_cartStore.totalItems} items",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }
              return Container();
            }),
          ],
        ),
      ),
    );
  }
}
