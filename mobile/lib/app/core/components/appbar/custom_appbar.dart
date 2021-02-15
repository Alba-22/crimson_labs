import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:crimson_labs/app/core/utils/constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {

  final String title;

  const CustomAppBar({Key key, this.title}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Theme.of(context).backgroundColor,
      centerTitle: true,
      title: title != null
      ? Container(
        child: AutoSizeText(
          title.toUpperCase(),
          maxLines: 1,
          style: TextStyle(
            // color: Theme.of(context).primaryColor,
            color: Colors.black,
            fontWeight: FontWeight.normal,
            fontSize: 16,
          )
        ),
      )
      : Image.asset(
        "${Paths.icon}/crimson_logo.png",
        height: 40,
      ),
      leading: Modular.navigator.canPop()
      ? IconButton(
        onPressed: () => Modular.to.pop(),
        icon: Icon(
          Icons.arrow_back_ios,
          color: Theme.of(context).primaryColor,
        ),
      )
      : Container(),
    );
  }

}