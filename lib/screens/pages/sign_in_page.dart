import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study/core/constants/color_const.dart';
import 'package:study/core/constants/font_const.dart';
import 'package:study/core/widgets/appbar_wirget.dart';
import 'package:study/provider/sign_in_provider.dart';
import 'package:study/service/firebase_servoce.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
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
        title: 'Cat Coffee Login',
        context: context,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(FontConst.kExtraLargFont),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
            ),
            Form(
              key: context.watch<SigninProvider>().fromKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: context.watch<SigninProvider>().emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(FontConst.kMediumFont),
                      ),
                      labelText: 'Email',
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller:
                        context.watch<SigninProvider>().passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(FontConst.kMediumFont),
                      ),
                      labelText: 'Password',
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(170, 50),
                primary: ColorConst.scaffoldBackground,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(FontConst.kLargeFont),
                ),
              ),
              child: const Text("Log in"),
              onPressed: () {
                context.read<SigninProvider>().signIn(context);
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                      primary: ColorConst.scaffoldBackground),
                  onPressed: () {
                    context.read<SigninProvider>().forgotPassword(context);
                  },
                  child: Text(
                    "Forgot password?",
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                      primary: ColorConst.scaffoldBackground),
                  onPressed: () {
                    Navigator.pushNamed(context, '/create');
                  },
                  child: Text(
                    "Create account?",
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(150, 30),
                        primary: ColorConst.scaffoldBackground,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(FontConst.kLargeFont),
                        ),
                      ),
                      child: const Text("Google"),
                      onPressed: () {
                        context.read<SigninProvider>().signInWithGoogle(context);
                      },
                    ),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(150, 30),
                    primary: ColorConst.scaffoldBackground,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(FontConst.kLargeFont),
                    ),
                  ),
                  child: const Text("Facebook"),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
