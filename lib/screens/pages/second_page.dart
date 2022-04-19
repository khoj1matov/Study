import 'package:flutter/material.dart';
import 'package:study/core/constants/color_const.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/opoxon2.png"),
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
              ),
            ),
          ),
          Expanded(
            child: Column(),
          ),
        ],
      ),
    );
  }
}
