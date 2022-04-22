import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:study/core/components/my_text_style_comp.dart';
import 'package:study/core/constants/color_const.dart';
import 'package:study/provider/sign_in_provider.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  String title;
  bool? centerTitle;
  BuildContext context;
  List<Widget>? action;
  static List<Map<String, dynamic>> blabla = [
    {"foiz": "89%", "name": "Presence"},
    {"foiz": "100%", "name": "Completeness"},
    {"foiz": "18", "name": "Assigments"},
    {"foiz": "12", "name": "Total Subject"},
  ];
  static List<Color> colors = [
    ColorConst.worning,
    ColorConst.completeness,
    ColorConst.asignments,
    ColorConst.subject
  ];

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
      backgroundColor: ColorConst.appBarBackground,
      elevation: 0,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
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
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: InkWell(
            child: SvgPicture.asset("assets/icons/qongiro.svg"),
            onTap: () {},
          ),
        ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(250),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.95,
          height: MediaQuery.of(context).size.height * 0.28,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 1.7,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (_, __) => Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.only(left: 22),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        blabla[__]["foiz"],
                        style: MyTextStyleComp.gridWiev2(colors[__]),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        blabla[__]["name"],
                        style: MyTextStyleComp.gridViewTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
              itemCount: 4,
            ),
          ),
        ),
      ),
    );
  }
}
