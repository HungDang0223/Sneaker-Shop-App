import 'package:flutter/material.dart';
import '../../../data/dummy_data.dart';
import '../../../theme/custom_app_theme.dart';

PreferredSize? customBagAppBar(ctx) {
  final width = MediaQuery.of(ctx).size.width;
  final height = MediaQuery.of(ctx).size.height;
  int lengthsOfItemsOnBag = itemsOnBag.length;
  return PreferredSize(
    preferredSize: Size.fromHeight(height/15),
    child: AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: Text(
          "My Bag",
          style: AppThemes.appBarText(width)
        ),
      ),
      actions: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Total ${lengthsOfItemsOnBag} Items",
              style: AppThemes.bagTotalPrice(width),
            ),
            SizedBox(width: 15,)
          ],
        )
      ],
    ),
  );
}