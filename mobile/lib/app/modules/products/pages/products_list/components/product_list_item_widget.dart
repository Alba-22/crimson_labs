import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:crimson_labs/app/modules/products/models/product_response_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductListItemWidget extends StatelessWidget {

  final Products item;

  const ProductListItemWidget({
    Key key,
    @required this.item,
  }) : super(key: key);

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
                    "\$${item.price.toStringAsFixed(2)}",
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.grey[600]
                    ),
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
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
