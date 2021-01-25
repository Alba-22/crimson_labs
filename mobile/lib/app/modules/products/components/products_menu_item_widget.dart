import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ProductsMenuItemWidget extends StatelessWidget {

  final String title;
  final Function onTap;
  final IconData icon;
  final bool fontAwesomeIcon;

  const ProductsMenuItemWidget({
    Key key,
    @required this.title,
    @required this.onTap,
    @required this.icon,
    this.fontAwesomeIcon = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 3),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Expanded(
                child: AutoSizeText(
                  "$title",
                  maxLines: 1,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  icon,
                  color: Theme.of(context).primaryColor,
                  size: fontAwesomeIcon
                  ? 14
                  : 24,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
