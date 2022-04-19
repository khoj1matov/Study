import 'package:flutter/material.dart';
import 'package:study/core/constants/color_const.dart';

class ThemeComp {
  static ThemeData get myTheme => ThemeData(
        colorScheme: ColorScheme.light(
          primary: ColorConst.startPageColor2,
        ),
      );
}
