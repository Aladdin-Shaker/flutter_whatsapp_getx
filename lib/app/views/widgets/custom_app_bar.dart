import 'package:flutter/material.dart';
import 'package:whats_app_clone/app/config/constants.dart';

AppBar customAppBar(
    {title, required leading, required actions, bkColor, bottom}) {
  return AppBar(
    leadingWidth: 75,
    titleSpacing: 0,
    backgroundColor: bkColor ?? kPrimaryColor,
    leading: leading,
    title: title,
    actions: actions,
    bottom: bottom,
  );
}
