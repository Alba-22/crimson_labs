import 'package:flutter/material.dart';

import 'package:crimson_labs/app/core/utils/constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {

  @override
  Size get preferredSize => Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Theme.of(context).backgroundColor,
      centerTitle: true,
      title: Image.asset(
        "${Paths.icon}/crimson_logo.png",
        height: 40,
      ),
      leading: Navigator.canPop(context)
      ? IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icon(
          Icons.arrow_back_ios,
          color: Theme.of(context).primaryColor,
        ),
      )
      : Container(),
    );
  }

}