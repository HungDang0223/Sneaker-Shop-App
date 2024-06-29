import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sneaker_shop_app/theme/custom_app_theme.dart';

import '../../../utils/constants.dart';

PreferredSize? customAppBar(ctx) {
  final width = MediaQuery.of(ctx).size.width;
  final height = MediaQuery.of(ctx).size.height;
  return PreferredSize(
    preferredSize: Size.fromHeight(height/15),
    child: AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: Text(
          "Discover",
          style: AppThemes.homeAppBar(width)
        ),
      ),
      actions: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: IconButton(
                icon: FaIcon(
                  CupertinoIcons.search,
                  color: AppConstantsColor.darkTextColor,
                  size: width/14,
                ),
                onPressed: () {},
              ),
            ),
            
            Padding(
              padding: EdgeInsets.only(top: 8.0, right: 4),
              child: IconButton(
                icon: FaIcon(
                  CupertinoIcons.bell,
                  color: AppConstantsColor.darkTextColor,
                  size: width/14,
                ),
                onPressed: () {},
              ),
            ),
          ],
        )
      ],
    ),
  );
}
