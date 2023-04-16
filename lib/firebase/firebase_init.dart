import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firedart/firedart.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class FirebaseInit {
  static Future initialiserFirebase() async {
    if (Platform.isAndroid) {
      await Firebase.initializeApp();
    } else {
      Firestore.initialize(dotenv.get("FIREBASE_PROJECT_ID"));
      FirebaseAuth.initialize(dotenv.get("FIREBASE_API_KEY"), VolatileStore());
    }
  }
}
