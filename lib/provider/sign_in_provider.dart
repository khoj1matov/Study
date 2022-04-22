import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:study/core/constants/color_const.dart';
import 'package:study/screens/pages/sign_in_page.dart';
import 'package:study/service/firebase_servoce.dart';

class SigninProvider extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  GlobalKey<FormState> fromKey = GlobalKey<FormState>();

  Future signUp(BuildContext context) async {
    try {
      UserCredential user =
          await FireService.auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      await FireService.store.collection('study').doc().set(
        {
          "name": nameController.text,
          "email": emailController.text,
          "phone": phoneController.text,
          "create_at": FieldValue.serverTimestamp(),
        },
      );

      showMySnackbar(
          "Success:" + user.user!.email.toString(), Colors.green, context);
      await FireService.auth.currentUser!.sendEmailVerification();

      Navigator.pushNamed(
        context,
        '/continue',
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        showMySnackbar("The password provided is too weak.",
            ColorConst.kPrimaryRed, context);
      } else if (e.code == "email-already-in-use") {
        showMySnackbar("The account already exists for that email.",
            ColorConst.kPrimaryRed, context);
      }
    } catch (e) {
      showMySnackbar(
          "There is such kind of error.", ColorConst.kPrimaryRed, context);
    }
  }

  Future signIn(BuildContext context) async {
    try {
      UserCredential user = await FireService.auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      Navigator.pushNamed(
        context,
        '/continue',
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        showMySnackbar(
            "No user found for that email.", ColorConst.kPrimaryRed, context);
      } else if (e.code == "wrong-password") {
        showMySnackbar("Wrong password provided for that user.",
            ColorConst.kPrimaryRed, context);
      }
    }
  }

  Future forgotPassword(BuildContext context) async {
    await FireService.auth.sendPasswordResetEmail(email: emailController.text);
    showMySnackbar(
        "Passwword reset link is send to email !", Colors.orange, context);
  }

  Future signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      Navigator.pushNamedAndRemoveUntil(
        context,
        '/continue',
        (route) => false,
      );
    } catch (e) {
      showMySnackbar("Error Google Sign In", ColorConst.kPrimaryRed, context);
    }
  }

  Future signOut(BuildContext context) async {
    await FireService.auth.signOut();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const SignInPage()),
        (route) => false);
  }

  Future deleteAccount(context) async {
    try {
      await FirebaseAuth.instance.currentUser!.delete();
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const SignInPage()),
          (route) => false);
    } on FirebaseAuthException catch (e) {
      if (e.code == "requires-recent-login") {
        showMySnackbar("Delete your account", ColorConst.kPrimaryRed, context);
      }
    }
  }

  showMySnackbar(String content, Color color, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(content),
        backgroundColor: color,
      ),
    );
  }
}
