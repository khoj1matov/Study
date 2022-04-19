import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study/core/constants/color_const.dart';
import 'package:study/core/constants/font_const.dart';
import 'package:study/core/widgets/appbar_wirget.dart';
import 'package:study/provider/sign_in_provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _CreatePageState();
}

class _CreatePageState extends State<SignUpPage> {
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    auth.authStateChanges().listen(
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
        title: 'Cat Coffee Create Account',
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
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(FontConst.kMediumFont),
                ),
                labelText: 'Email',
              ),
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(FontConst.kMediumFont),
                ),
                labelText: 'Password',
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
              child: const Text("Create"),
              onPressed: () {
                context.read<SigninProvider>().signUp(context);
              },
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
                        context
                            .read<SigninProvider>()
                            .signInWithGoogle(context);
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
