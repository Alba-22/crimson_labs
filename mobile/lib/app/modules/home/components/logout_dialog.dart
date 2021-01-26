import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:crimson_labs/app/core/components/buttons/main_button.dart';

class LogoutDialog extends StatelessWidget {

  final Function onAccept;
  final Function onDeny;

  const LogoutDialog({
    Key key,
    @required this.onAccept,
    @required this.onDeny,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double DIALOG_WIDTH = 300;
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
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                width: DIALOG_WIDTH,
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Icon(
                        Icons.help_outline,
                        color: Theme.of(context).primaryColor,
                        size: ICON_SIZE,
                      ),
                    ),
                    AutoSizeText(
                      "You really want to logout?",
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MainButton(
                          text: "No",
                          inverted: true,
                          fontSize: 16,
                          onTap: onDeny,
                          width: ((DIALOG_WIDTH / 2) - 15),
                        ),
                        SizedBox(width: 10),
                        MainButton(
                          text: "Yes",
                          fontSize: 16,
                          onTap: onAccept,
                          width: ((DIALOG_WIDTH / 2) - 15),
                        ),
                      ],
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
