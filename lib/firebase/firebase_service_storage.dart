import 'dart:io';

import 'package:jdr_maker/firebase/android/firebase_android_storage.dart';
import 'package:jdr_maker/firebase/desktop/firebase_desktop_storage.dart';

class FirebaseServiceStorage {
  /// Importer une [image]
  static Future importer(File image) async {
    return Platform.isAndroid ? await FirebaseAndroidStorage.importer() : await FirebaseDesktopStorage.importer(image);
  }
}
