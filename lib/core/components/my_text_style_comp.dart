import 'package:flutter/material.dart';
import 'package:study/core/constants/color_const.dart';
import 'package:study/core/constants/font_const.dart';

class MyTextStyleComp {
  static TextStyle get startPageHello => TextStyle(
        color: ColorConst.kPrimaryWhite,
        fontSize: FontConst.kMediumLargeFont,
        fontWeight: FontWeight.w600,
      );
  static TextStyle get startPageGetAn => TextStyle(
        color: ColorConst.showModalColor,
        fontSize: 13,
        fontWeight: FontWeight.w400,
      );

  static TextStyle get firstPageStudy => TextStyle(
        color: ColorConst.kPrimaryWhite,
        fontSize: 22,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get findYourFavourite => TextStyle(
        color: ColorConst.kPrimaryBlack,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      );

  static TextStyle get loremIpsum => TextStyle(
        color: ColorConst.loremIpsum,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      );

  static TextStyle get skip => TextStyle(
        color: ColorConst.startPageColor1,
        fontSize: 17,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get emailAndPassword => TextStyle(
        color: ColorConst.kPrimaryBlack,
        fontSize: 18,
      );

  static TextStyle get forgetPassword => TextStyle(
        color: ColorConst.startPageColor2,
        fontSize: 20,
      );

}
