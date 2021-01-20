import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:crimson_labs/app/core/components/buttons/main_button.dart';
import 'package:crimson_labs/app/core/utils/constants.dart';

class CommonDialog extends StatelessWidget {
  final String text;
  final String subtext;
  final DialogType type;

  const CommonDialog({
    Key key,
    @required this.text,
    this.subtext,
    @required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double DIALOG_WIDTH = 300;
    const double DIALOG_HEIGHT = 300;
    const double ICON_SIZE = 100;
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Builder(
        builder: (context) {
          return FittedBox(
            child: Container(
              width: DIALOG_WIDTH,
              height: DIALOG_HEIGHT,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                height: DIALOG_HEIGHT,
                width: DIALOG_WIDTH,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Builder(
                        builder: (_) {
                          if (type == DialogType.error) {
                            return Icon(
                              Icons.close,
                              color: Colors.red,
                              size: ICON_SIZE,
                            );
                          }
                          else if (type == DialogType.ok) {
                            return Icon(
                              Icons.done,
                              color: Colors.green,
                              size: ICON_SIZE,
                            );
                          }
                          else {
                            return Icon(
                              Icons.error_outline,
                              color: Colors.lightBlue,
                              size: ICON_SIZE,
                            );
                          }
                        },
                      ),
                    ),
                    AutoSizeText(
                      "$text",
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 5),
                    subtext != null
                    ? AutoSizeText(
                      "$subtext",
                      maxLines: 3,
                      textAlign: TextAlign.center,
                    )
                    : Container(),
                    SizedBox(height: 25),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: MainButton(
                        text: "Back",
                        fontSize: 16,
                        onTap: () => Get.back(),
                        width: (DIALOG_WIDTH - 110),
                      ),
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
