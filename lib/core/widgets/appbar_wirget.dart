import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:study/core/components/my_text_style_comp.dart';
import 'package:study/core/constants/color_const.dart';

import '../../provider/sign_in_provider.dart';

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

  static AppBar myappbar(BuildContext context) {
    return AppBar(
      backgroundColor: ColorConst.kPrimaryTransparent,
      elevation: 0,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hi, ${context.watch<SigninProvider>().nameController.text}',
            style: MyTextStyleComp.skipContinue,
          ),
          const SizedBox(height: 5),
          Text(
            "Here is your activity today, ",
            style: MyTextStyleComp.loremIpsum,
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: InkWell(
            child: SvgPicture.asset("assets/icons/qongiro.svg"),
            onTap: () {},
          ),
        )
      ],
    );
  }

}