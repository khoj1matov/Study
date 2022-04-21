import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:study/core/constants/color_const.dart';
import 'package:study/provider/bottom_navigation_bar_provider.dart';
import 'package:study/screens/home/home_page.dart';
import 'package:study/screens/pages/calendar_page.dart';
import 'package:study/screens/pages/comment_page.dart';
import 'package:study/screens/pages/profile_page.dart';

class TabBarsPages extends StatelessWidget {
  TabBarsPages({Key? key}) : super(key: key);

  List<Widget> _pages = [
    HomePage(),
    CalendarPage(),
    CommentPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[context.watch<BottomNavigationProvider>().selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/home.svg",
              color:
                  context.watch<BottomNavigationProvider>().selectedIndex == 0
                      ? ColorConst.selectColor
                      : ColorConst.unselectedColor,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/calendar.svg",
              color:
                  context.watch<BottomNavigationProvider>().selectedIndex == 1
                      ? ColorConst.selectColor
                      : ColorConst.unselectedColor,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/comment.svg",
              color:
                  context.watch<BottomNavigationProvider>().selectedIndex == 2
                      ? ColorConst.selectColor
                      : ColorConst.unselectedColor,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/profile.svg",
              color:
                  context.watch<BottomNavigationProvider>().selectedIndex == 3
                      ? ColorConst.selectColor
                      : ColorConst.unselectedColor,
            ),
            label: '',
          ),
        ],
        currentIndex: context.watch<BottomNavigationProvider>().selectedIndex,
        onTap: (index) {
          context.read<BottomNavigationProvider>().onTapedIndex(index);
        },
      ),
    );
  }
}
