import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:study/core/components/my_text_style_comp.dart';
import 'package:study/core/constants/color_const.dart';

class ThreePage extends StatelessWidget {
  const ThreePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/opoxon4.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    ColorConst.startPageColor1.withOpacity(0.2),
                    ColorConst.startPageColor2.withOpacity(1),
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SvgPicture.asset(
                      "assets/icons/start.svg",
                      height: 35,
                      width: 35,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "Study",
                      style: MyTextStyleComp.firstPageStudy,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 35, right: 35, top: 40, bottom: 55),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Get the best class, with the best teacher",
                  style: MyTextStyleComp.findYourFavourite,
                ),
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sit enim, ac amet ultrices.",
                  style: MyTextStyleComp.loremIpsum,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 3,
                      backgroundColor: ColorConst.startPageColor3,
                    ),
                    const SizedBox(width: 5),
                    CircleAvatar(
                      radius: 3,
                      backgroundColor: ColorConst.startPageColor3,
                    ),
                    const SizedBox(width: 5),
                    CircleAvatar(
                      radius: 5,
                      backgroundColor: ColorConst.startPageColor1,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      child: Text(
                        "Sign In",
                        style: MyTextStyleComp.skip,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          '/signIn',
                        );
                      },
                    ),
                    TextButton(
                      child: Text(
                        "Sign Up",
                        style: MyTextStyleComp.skip,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          '/signUp',
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
