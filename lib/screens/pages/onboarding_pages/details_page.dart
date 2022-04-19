import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study/provider/pageview_provider.dart';
import 'package:study/screens/pages/onboarding_pages/first_page.dart';
import 'package:study/screens/pages/onboarding_pages/second_page.dart';
import 'package:study/screens/pages/onboarding_pages/three_page.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage({Key? key}) : super(key: key);

  final PageController pageController = PageController();
  final List<Widget> _pages = [
    const FirstPage(),
    const SecondPage(),
    const ThreePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: _pages,
        onPageChanged: (index) {
          context.read<PageViewProvider>().onChangedPages(index);
        },
      ),
    );
  }
}
