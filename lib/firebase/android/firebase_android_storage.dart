import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FirebaseAndroidStorage {
  static Future<String> importer(File image) async {
    String nom = image.path.split("\\").last.split(".").first;
    var importation = await FirebaseStorage.instance.ref().child(nom).putFile(image);
    return await importation.ref.getDownloadURL();
  }
}
