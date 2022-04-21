import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:study/core/components/my_text_style_comp.dart';
import 'package:study/core/constants/color_const.dart';
import 'package:study/core/constants/font_const.dart';
import 'package:study/provider/checkbox_provider.dart';
import 'package:study/provider/sign_in_provider.dart';

class ContinuePage extends StatelessWidget {
  ContinuePage({Key? key}) : super(key: key);

  final List<String> _titles = [
    "Mathematics",
    "Ecomony",
    "English",
    "Biology",
    "Geography",
  ];

  final List<String> _subtitles = [
    "Geometry, Algorithm",
    "Stock, Property, News",
    "Stock, Property, News",
    "Stock, Property, News",
    "Stock, Property, News",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: ColorConst.kPrimaryBlack),
        elevation: 0,
        backgroundColor: ColorConst.kPrimaryTransparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 3,
              backgroundColor: ColorConst.startPageColor3,
            ),
            const SizedBox(width: 5),
            CircleAvatar(
              radius: 5,
              backgroundColor: ColorConst.startPageColor1,
            ),
            const SizedBox(width: 5),
            CircleAvatar(
              radius: 3,
              backgroundColor: ColorConst.startPageColor3,
            ),
          ],
        ),
        actions: [
          TextButton(
            child: Text(
              "Skip",
              style: MyTextStyleComp.skipContinue,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/signIn');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 25, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Choose your topic interest',
              style: MyTextStyleComp.findYourFavourite,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sit enim, ac amet ultrices.",
                style: MyTextStyleComp.loremIpsum,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.59,
                child: ListView.builder(
                  itemBuilder: (_, __) => Column(
                    children: [
                      ListTile(
                        leading: SvgPicture.asset("assets/icons/icon$__.svg"),
                        title: Text(
                          _titles[__],
                          style: MyTextStyleComp.skipContinue,
                        ),
                        subtitle: Text(
                          _subtitles[__],
                          style: MyTextStyleComp.loremIpsum,
                        ),
                        trailing: Checkbox(
                          checkColor: Colors.white,
                          value:
                              context.watch<CheckBoxProvider>().chackContinue[__],
                          onChanged: (v) {
                            context
                                .read<CheckBoxProvider>()
                                .onCheckContinue(v!, __);
                          },
                        ),
                      ),
                      Divider(
                        height: 20,
                        thickness: 0.5,
                        color: ColorConst.kPrimaryBlack,
                      ),
                    ],
                  ),
                  itemCount: 5,
                ),
              ),
            ),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(330, 50),
                  primary: ColorConst.startPageColor2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      FontConst.kExtraSmallFont,
                    ),
                  ),
                ),
                child: const Text("Continue"),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/home',
                    (route) => false,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
