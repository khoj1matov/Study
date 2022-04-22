import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study/core/widgets/appbar_wirget.dart';
import 'package:study/provider/sign_in_provider.dart';
import 'package:study/provider/upload_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar.myappbar(context),
      // body: Center(
      //   child: ElevatedButton(
      //     child: const Text("Upload"),
      //     onPressed: () {
      //       context.read<UploadProvider>().uploadToDB(
      //             context.watch<SigninProvider>().nameController.text,
      //             context.watch<SigninProvider>().emailController.text,
      //             context.watch<SigninProvider>().phoneController.text,
      //             context,
      //           );
      //     },
      //   ),
      // ),
    );
  }
}
