import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'dart:io';
import 'package:study/service/firebase_servoce.dart';

class UploadProvider extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  TextEditingController dateOfBrithController = TextEditingController();

  TextEditingController phoneController = TextEditingController();
  TextEditingController studentIdController = TextEditingController();

  Future uploadToDB() async {
    await FireService.store.collection('study').doc().set(
      {
        "name": nameController,
        "email": emailController,
        "date_of_brith": dateOfBrithController,
        "phone": phoneController,
        "student_id": studentIdController,
        "create_at": FieldValue.serverTimestamp(),
      },
    );
  }

  Future uploadImageToStorage(file, name) async {
    var image = FireService.storage
        .ref()
        .child("coffee")
        .child("images")
        .child(name)
        .putFile(File(file.path));

    String downloadURL = await image.storage.ref().getDownloadURL();
    await FireService.store.collection("coffee").doc(name).set(
      {"img_url": downloadURL},
      SetOptions(
        merge: true,
      ),
    );
  }
}
