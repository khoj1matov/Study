import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'dart:io';

import 'package:study/service/firebase_servoce.dart';

class UploadProvider extends ChangeNotifier {
  Future uploadToDB(name, email, phone, context) async {
    await FireService.store.collection('study').doc().set(
      {
        "name": name,
        "email": email,
        "phone": phone,
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
