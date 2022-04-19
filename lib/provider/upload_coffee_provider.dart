import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'dart:io';

import 'package:study/service/firebase_servoce.dart';

class UploadCoffeeProvider extends ChangeNotifier {
  Future uploadToDB(name, price, context) async {
    await FireService.store.collection('coffee').doc(name).set(
      {
        "name": name,
        "price": price,
        "img_url": "",
        "create_at": FieldValue.serverTimestamp(),
      },
    );
    Navigator.pop(context);
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
