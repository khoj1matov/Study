import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:study/core/components/my_text_style_comp.dart';
import 'package:study/core/constants/color_const.dart';
import 'package:study/provider/sign_in_provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorConst.kPrimaryTransparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/icons/profile_study.svg"),
            const SizedBox(width: 10),
            Text(
              "Study",
              style: TextStyle(
                color: ColorConst.kPrimaryBlack,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Divider(
              thickness: 0.1,
              color: ColorConst.kPrimaryBlack,
              height: 10,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
            child: ListTile(
              leading: const CircleAvatar(
                radius: 30,
                backgroundColor: Color(0XFFFFFFFF),
              ),
              title: Text(
                "Welcome",
                style: MyTextStyleComp.gridViewTextStyle,
              ),
              subtitle: Text(
                "Wblabla",
                style: MyTextStyleComp.gridWiev2(
                  ColorConst.kPrimaryBlack,
                ),
              ),
              trailing: IconButton(
                iconSize: 45,
                icon: SvgPicture.asset(
                  "assets/icons/logOut.svg",
                ),
                onPressed: () {
                  context.read<SigninProvider>().signOut(context);
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Divider(
              thickness: 0.1,
              color: ColorConst.kPrimaryBlack,
              height: 10,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 30),
            child: Column(
              children: [
                listTilles("profile_user", "Profile", context, "/profile2"),
                const SizedBox(height: 10),
                listTilles("shield", "Account", context, ""),
                const SizedBox(height: 10),
                listTilles("settings", "Settings", context, ""),
                const SizedBox(height: 10),
                listTilles("about", "About", context, ""),
              ],
            ),
          ),
          InkWell(
            child: SvgPicture.asset("assets/icons/banner.svg"),
            onTap: () {},
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  child: Row(
                    children: const [
                      Text("Privacy Policy"),
                      Icon(Icons.chevron_right),
                    ],
                  ),
                  onTap: () {},
                ),
                InkWell(
                  child: Row(
                    children: const [
                      Text("Terms"),
                      Icon(Icons.chevron_right),
                    ],
                  ),
                  onTap: () {},
                ),
                InkWell(
                  child: Row(
                    children: const [
                      Text("English"),
                      Icon(Icons.chevron_right),
                    ],
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  InkWell listTilles(
      String svg, String title, BuildContext context, String route) {
    return InkWell(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: ColorConst.profileCirleBackGround,
          child: SvgPicture.asset("assets/icons/$svg.svg"),
        ),
        title: Text(
          title,
          style: MyTextStyleComp.profilePageListTile,
        ),
        trailing: const Icon(Icons.chevron_right),
      ),
      onTap: () {
        Navigator.pushNamed(context, route);
      },
    );
  }
}
