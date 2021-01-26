import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:crimson_labs/app/modules/products/models/product_response_model.dart';
import 'package:crimson_labs/app/modules/products/stores/cart_store.dart';

import '../components/product_options_dialog.dart';

class ProductListItemWidget extends StatelessWidget {

  final Product item;

  ProductListItemWidget({
    Key key,
    @required this.item,
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
                      fontSize: 16,
                    ),
                  ),
                ),
                Container(
                  child: AutoSizeText(
                    "${item.description}",
                    maxLines: 2,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                  ),
                ),
                Container(
                  child: AutoSizeText(
                    "\$${item.price.toStringAsFixed(2)}",
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
            onTap: () {
              _cartStore.addItemToCart(item);
              Get.snackbar(
                "", 
                "",
                backgroundColor: Theme.of(context).primaryColor,
                snackPosition: SnackPosition.BOTTOM,
                margin: EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                ),
                dismissDirection: SnackDismissDirection.HORIZONTAL,
                onTap: (_) {
                  Modular.to.pop();
                  Modular.to.pop();
                  Modular.link.pushNamed("/cart");
                },
                titleText: Text(
                  "Item Added",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                messageText: Text(
                  "${item.title} was added to the cart.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              );
            },
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                FontAwesomeIcons.cartPlus,
                color: Colors.white,
                size: 18,
              ),
            ),
          ),
          SizedBox(width: 5),
          GestureDetector(
            onTap: () {
              Get.dialog(ProductOptionsDialog(
                itemName: item.title,
                onDelete: () => Modular.to.pop()
              ));
            },
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
