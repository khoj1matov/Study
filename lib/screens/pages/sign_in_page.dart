import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study/core/components/my_text_style_comp.dart';
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
        title: 'Sign In',
        context: context,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.6,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 7),
                      child: Text("Email",
                          style: MyTextStyleComp.emailAndPassword),
                    ),
                    TextFormField(
                      controller:
                          context.watch<SigninProvider>().emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(FontConst.kExtraSmallFont),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 7),
                      child: Text("Password",
                          style: MyTextStyleComp.emailAndPassword),
                    ),
                    TextFormField(
                      controller:
                          context.watch<SigninProvider>().passwordController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(FontConst.kExtraSmallFont),
                        ),
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    context.read<SigninProvider>().forgotPassword(context);
                  },
                  child: Text("Forgot password?",
                      style: MyTextStyleComp.forgetPassword),
                ),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(330, 60),
                      primary: ColorConst.startPageColor2,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(FontConst.kExtraSmallFont)),
                    ),
                    child: const Text("Log in"),
                    onPressed: () {
                      context.read<SigninProvider>().signIn(context);
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don’t have an account?"),
                    TextButton(
                      style: TextButton.styleFrom(
                          primary: ColorConst.startPageColor2),
                      onPressed: () {
                        Navigator.pushNamed(context, '/signUp');
                      },
                      child: const Text("Sign Up"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
