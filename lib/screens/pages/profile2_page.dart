import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:study/core/components/my_text_style_comp.dart';
import 'package:study/core/constants/font_const.dart';
import 'package:study/core/widgets/appbar_wirget.dart';
import 'package:study/provider/upload_provider.dart';

class Profile2Page extends StatelessWidget {
  const Profile2Page({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        context: context,
        title: "Profile",
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 1,
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Stack(
                  children: [
                    const Center(
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: Color(0XFFFFFFFF),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 60, bottom: 40),
                      child: Center(
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: const Color(0XFFFFFFFF),
                          child: SvgPicture.asset("assets/icons/camera.svg"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 8,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      textFromField(
                          "Name",
                          context.watch<UploadProvider>().nameController,
                          context),
                      textFromField(
                          "Email",
                          context.watch<UploadProvider>().emailController,
                          context),
                      textFromField(
                          "Date of brith",
                          context.watch<UploadProvider>().dateOfBrithController,
                          context),
                      textFromField(
                          "Phone Number",
                          context.watch<UploadProvider>().phoneController,
                          context),
                      textFromField(
                          "Student ID",
                          context.watch<UploadProvider>().studentIdController,
                          context),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding textFromField(
    String title,
    TextEditingController controllers,
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.only(top: 7, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: MyTextStyleComp.profilePageListTile,
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: controllers,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(FontConst.kExtraSmallFont),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
