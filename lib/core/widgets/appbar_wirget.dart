import 'package:flutter/material.dart';
import 'package:study/core/constants/color_const.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  String title;
  bool? centerTitle;
  BuildContext context;
  List<Widget>? action;

  MyAppBar({
    Key? key,
    required this.title,
    this.centerTitle,
    required this.context,
    this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorConst.kPrimaryTransparent,
      elevation: 0,
      title: Text(
        title,
        style: TextStyle(
          color: ColorConst.kPrimaryBlack,
        ),
      ),
      centerTitle: centerTitle,
      actions: action,
      iconTheme: IconThemeData(
        color: ColorConst.kPrimaryBlack,
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(MediaQuery.of(context).size.height * 0.08);
}
