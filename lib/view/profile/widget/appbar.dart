// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sneaker_shop_app/theme/custom_app_theme.dart';

import '../../../utils/constants.dart';

PreferredSize? customAppBarProfile(ctx) {
  final width = MediaQuery.of(ctx).size.width;
  return PreferredSize(
    preferredSize: Size.fromHeight(60),
    child: AppBar(
     
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Padding(
        padding: EdgeInsets.only(
          top: 8.0,
        ),
        child: Text(
          "My Profile",
          style: AppThemes.profileAppBarTitle(width),
        ),
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.only(top: 8.0, right: 5),
          child: Icon(
            Icons.more_vert,
            color: AppConstantsColor.darkTextColor,
          ),
        )
      ],
    ),
  );
}
