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
}
