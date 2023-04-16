import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gcloud/storage.dart';
import 'package:googleapis_auth/auth_io.dart';

class FirebaseDesktopStorage {
  /// Importer une [image]
  static Future<String> importer(File image) async {
    late Bucket bucket;

    await rootBundle.loadString("assets/gcloud.json").then((json) async {
      bucket = Storage(
        await clientViaServiceAccount(
          ServiceAccountCredentials.fromJson(json),
          Storage.SCOPES,
        ),
        dotenv.get("GCLOUD_PROJECT_ID"),
      ).bucket(dotenv.get("FIREBASE_STORAGE_BUCKET"));
    });

    ObjectInfo importInfo = await bucket.writeBytes(
      image.path.split("\\").last.split(".").first,
      image.readAsBytesSync(),
      contentType: "image/png",
    );

    return importInfo.downloadLink.toString();
  }
}
