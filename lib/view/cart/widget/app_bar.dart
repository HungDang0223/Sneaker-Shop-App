import 'package:flutter/material.dart';
import '../../../data/dummy_data.dart';
import '../../../theme/custom_app_theme.dart';

PreferredSize? customBagAppBar(ctx) {
  final width = MediaQuery.of(ctx).size.width;
  final height = MediaQuery.of(ctx).size.height;
  return PreferredSize(
    preferredSize: Size.fromHeight(height/15),
    child: AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: Text(
          "Giỏ hàng",
          style: AppThemes.appBarText(width)
        ),
      ),
    ),
  );
}