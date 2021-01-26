import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:crimson_labs/app/core/components/buttons/main_button.dart';

class ProductOptionsDialog extends StatelessWidget {
  
  final Function onDelete;
  final String itemName;

  const ProductOptionsDialog({
    Key key,
    @required this.onDelete,
    @required this.itemName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double DIALOG_WIDTH = 300;
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Builder(
        builder: (context) {
          return FittedBox(
            child: Container(
              width: DIALOG_WIDTH,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: AutoSizeText(
                        "More Options".toUpperCase(),
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Container(
                      child: AutoSizeText(
                        "$itemName",
                        maxLines: 1,
                      ),
                    ),
                    SizedBox(height: 20),
                    MainButton(
                      text: "Delete Item",
                      width: double.infinity,
                      onTap: onDelete,
                    ),
                    SizedBox(height: 5),
                    MainButton(
                      text: "Back",
                      width: double.infinity,
                      onTap: Modular.to.pop,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
