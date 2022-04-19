import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:study/core/components/my_text_style_comp.dart';
import 'package:study/core/constants/color_const.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/opoxon.png"),
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
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/icons/start.svg"),
                    const SizedBox(width: 10),
                    Text(
                      "Study",
                      style: TextStyle(
                        color: ColorConst.kPrimaryWhite,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 40,
                    right: 40,
                    bottom: 50,
                  ),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.27,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Hello and welcome here!",
                          style: MyTextStyleComp.startPageHello,
                        ),
                        Text(
                          " Get an overview of how you are performing and motivate yourself to achieve even moew.",
                          style: MyTextStyleComp.startPageGetAn,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: ColorConst.startPageElevated,
                            elevation: 0,
                            fixedSize: const Size(150, 56),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text("Let's start"),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
