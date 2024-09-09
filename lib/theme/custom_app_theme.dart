import 'package:flutter/material.dart';

import '../utils/constants.dart';

class AppThemes {

  static TextStyle hightlightText(double w) => TextStyle(
    fontSize: w/30,
    fontWeight: FontWeight.w300,
    color: AppConstantsColor.hightlightTextColor
  );

  /// Home
  static TextStyle homeAppBar(double w) => TextStyle(
    fontSize: w/12,
    fontWeight: FontWeight.bold,
    color: AppConstantsColor.darkTextColor,
  );
  static TextStyle homeProductName(double w) => TextStyle(
    color: AppConstantsColor.lightTextColor,
    fontSize: w/20,
    fontWeight: FontWeight.w500,
  );
  static TextStyle homeProductModel(double w) => TextStyle(
      color: AppConstantsColor.lightTextColor,
      fontWeight: FontWeight.bold,
      fontSize: w/16);
  static TextStyle homeProductPrice(double w) => TextStyle(
      color: AppConstantsColor.lightTextColor,
      fontWeight: FontWeight.w400,
      fontSize: w/24);
  static TextStyle homeMoreText(double w) => TextStyle(
      fontSize: w/15,
      color: AppConstantsColor.darkTextColor,
      fontWeight: FontWeight.bold);
  static TextStyle homeGridNewText(double w) => TextStyle(
    color: AppConstantsColor.lightTextColor,
    fontWeight: FontWeight.w500,
    fontSize: w/40,
  );
  static TextStyle homeGridNameAndModel(double w) => TextStyle(
    fontSize: w/30,
    color: AppConstantsColor.darkTextColor,
    fontWeight: FontWeight.bold,
  );
  static TextStyle homeGridPrice(double w) => TextStyle(
    fontSize: w/32,
    color: AppConstantsColor.darkTextColor,
    fontWeight: FontWeight.bold,
  );

  /// Details
  static TextStyle detailsAppBar(double w) => TextStyle(
    color: AppConstantsColor.lightTextColor,
    fontWeight: FontWeight.w600,
    fontSize: w/15,
  );
  static TextStyle detailsMoreText(double w) => TextStyle(
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.underline,
      color: Colors.blue,
      height: 1);
  static TextStyle detailsProductPrice(double w) => TextStyle(
      fontWeight: FontWeight.w500,
      height: 1);
  static TextStyle detailsProductDescriptions =
      TextStyle(color: Colors.grey[600]);

  /// Bag

  static TextStyle bagEmptyListTitle(double w) =>
      TextStyle(fontSize: w/10, fontWeight: FontWeight.w500);
  static TextStyle bagEmptyListSubTitle(double w) =>
      TextStyle(fontSize: w/20, fontWeight: FontWeight.w400);
  static TextStyle bagTitle(double w) => TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: w/10,
  );
  static TextStyle bagTotal(double w) => TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: w/8,
  );
  static TextStyle bagProductModel(double w) => TextStyle(
    fontSize: w/22,
    fontWeight: FontWeight.w500,
    color: AppConstantsColor.darkTextColor,
  );
  static TextStyle bagProductPrice(double w) => TextStyle(
    fontSize: w/22,
    fontWeight: FontWeight.bold,
    color: AppConstantsColor.darkTextColor,
  );
  static TextStyle bagProductNumOfShoe(double w) =>
      TextStyle(fontSize: w/22, fontWeight: FontWeight.bold);
  static TextStyle bagTotalPrice(double w) => TextStyle(
      color: AppConstantsColor.darkTextColor,
      fontWeight: FontWeight.w600,
      fontSize: w/18);
  static TextStyle bagSumOfItemOnBag(double w) => TextStyle(
      color: AppConstantsColor.darkTextColor,
      fontWeight: FontWeight.bold,
      fontSize: w/22);

  /// Profile
  static TextStyle profileAppBarTitle(double w) => TextStyle(
    fontSize: w/20,
    fontWeight: FontWeight.bold,
    color: AppConstantsColor.whiteTextColor,
  );
  static TextStyle profileRepeatedListTileTitle(double w) => TextStyle(
    fontWeight: FontWeight.bold,
    color: AppConstantsColor.darkTextColor,
    fontSize: w/23);
  static TextStyle profileDevName(double w) =>
    TextStyle(fontSize: w/21, fontWeight: FontWeight.w700, color: Colors.white);

// Log in, out
  static TextStyle logAppBarTitle(double w) => TextStyle(
    fontSize: w/18,
    color: AppConstantsColor.hightlightTextColor,
    fontWeight: FontWeight.w500
  );
  static TextStyle logTitle(double w) => TextStyle(
    fontSize: w/12,
    color: AppConstantsColor.darkTextColor,
    fontWeight: FontWeight.w800
  );
  static TextStyle logNormalText(double w) => TextStyle(
    fontSize: w/17,
    color: AppConstantsColor.darkTextColor,
    fontWeight: FontWeight.w800
  );
  static TextStyle logButton(double w) => TextStyle(
    fontSize: w/16,
    color: AppConstantsColor.whiteTextColor,
    fontWeight: FontWeight.w600
  );
// for all
  static TextStyle normalText(double w) => TextStyle(
    fontSize: w/23,
    color: AppConstantsColor.darkTextColor,
    fontWeight: FontWeight.normal
  );
  static TextStyle boldText(double w) => TextStyle(
    fontSize: w/22,
    color: AppConstantsColor.darkTextColor,
    fontWeight: FontWeight.bold
  );
  static TextStyle superBoldText(double w) => TextStyle(
    fontSize: w/16,
    color: AppConstantsColor.darkTextColor,
    fontWeight: FontWeight.bold
  );
  static TextStyle appBarText(double w) => TextStyle(
    fontSize: w/12,
    color: AppConstantsColor.darkTextColor,
    fontWeight: FontWeight.w800
  );
  static TextStyle lightBlackText(double w) => TextStyle(
    fontSize: w/26,
    color: AppConstantsColor.darkTextColor,
    fontWeight: FontWeight.w400
  );
  static TextStyle lightWhiteText(double w) => TextStyle(
    fontSize: w/30,
    color: AppConstantsColor.whiteTextColor,
    fontWeight: FontWeight.w400
  );
  static TextStyle semiLightText(double w) => TextStyle(
    fontSize: w/30,
    color: Colors.grey[400],
    fontWeight: FontWeight.w400
  );
  static TextStyle hintText(double w) => TextStyle(
      fontSize: w/24,
      color: Colors.grey[300],
      fontWeight: FontWeight.w500
  );
}
