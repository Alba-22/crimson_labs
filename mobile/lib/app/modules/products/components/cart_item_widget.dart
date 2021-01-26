import 'package:auto_size_text/auto_size_text.dart';
import 'package:crimson_labs/app/modules/products/stores/cart_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:crimson_labs/app/modules/products/models/product_response_model.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CartItemWidget extends StatelessWidget {
  final Product item;
  final int index;

  CartItemWidget({
    Key key,
    @required this.item,
    @required this.index,
  }) : super(key: key);

  final _cartStore = Modular.get<CartStore>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: AutoSizeText(
                    "${item.title}",
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
                Container(
                  child: AutoSizeText(
                    "\$${item.price.toStringAsFixed(2)} per unit",
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => _cartStore.decreaseQuantity(index),
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Icons.remove,
                color: Colors.white,
              ),
            ),
          ),
          Observer(builder: (_) {
            return Container(
              width: 25,
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: Center(
                child: AutoSizeText(
                  "${_cartStore.cart[index].quantity}",
                  maxLines: 1,
                ),
              ),
            );
          }),
          GestureDetector(
            onTap: () => _cartStore.increaseQuantity(index),
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
