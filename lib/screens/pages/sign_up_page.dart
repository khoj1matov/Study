import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study/core/components/my_text_style_comp.dart';
import 'package:study/core/constants/color_const.dart';
import 'package:study/core/constants/font_const.dart';
import 'package:study/core/widgets/appbar_wirget.dart';
import 'package:study/provider/checkbox_provider.dart';
import 'package:study/provider/sign_in_provider.dart';
import 'package:study/service/firebase_servoce.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  void initState() {
    super.initState();
    FireService.auth.authStateChanges().listen(
      (User? user) {
        if (user == null) {
          debugPrint("User is currently signed out!");
        } else {
          debugPrint("User is signed in");
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'Sign Up',
        context: context,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.79,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Expanded(
                  flex: 8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name",
                        style: MyTextStyleComp.emailAndPassword,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 20),
                        child: TextFormField(
                          controller:
                              context.watch<SigninProvider>().nameController,
                          decoration: InputDecoration(
                            hintText: 'Your name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                FontConst.kExtraSmallFont,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "Email",
                        style: MyTextStyleComp.emailAndPassword,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 20),
                        child: TextFormField(
                          controller:
                              context.watch<SigninProvider>().emailController,
                          decoration: InputDecoration(
                            hintText: 'study@email.com',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                FontConst.kExtraSmallFont,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "Password",
                        style: MyTextStyleComp.emailAndPassword,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 20),
                        child: TextFormField(
                          controller: context
                              .watch<SigninProvider>()
                              .passwordController,
                          decoration: InputDecoration(
                            hintText: 'Your password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                FontConst.kExtraSmallFont,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "Phone",
                        style: MyTextStyleComp.emailAndPassword,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 20),
                        child: TextFormField(
                          controller:
                             context.watch<SigninProvider>().phoneController,
                          decoration: InputDecoration(
                            hintText: 'XX XXX XX XX',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                FontConst.kExtraSmallFont,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Checkbox(
                            checkColor: Colors.white,
                            value: context.watch<CheckBoxProvider>().isChecked,
                            onChanged: (v) {
                              context.read<CheckBoxProvider>().onChecked(v!);
                            },
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.75,
                            child: Text(
                              "I agree with the terms and conditions and also the protection of my personal data on this application",
                              style: MyTextStyleComp.loremIpsum,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(330, 20),
                      primary: ColorConst.startPageColor2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          FontConst.kExtraSmallFont,
                        ),
                      ),
                    ),
                    child: const Text("Sign Up"),
                    onPressed: () {
                      context.read<SigninProvider>().signUp(context);
                    },
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
