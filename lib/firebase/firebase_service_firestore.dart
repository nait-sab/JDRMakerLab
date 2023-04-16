import 'dart:io';

import 'package:jdr_maker/firebase/android/firebase_android_firestore.dart';
import 'package:jdr_maker/firebase/desktop/firebase_desktop_firestore.dart';

class FirebaseServiceFirestore {
  /// Récupérer la collection ayant ce [nom]
  static Future getCollection(String nom) async {
    return Platform.isAndroid
        ? await FirebaseAndroidFirestore.getCollection(nom)
        : await FirebaseDesktopFirestore.getCollection(nom);
  }

  /// Récupérer la collection ayant ce [nom] converti par l'[action]
  static Future getListe(String nom, Function action) async {
    return Platform.isAndroid
        ? await FirebaseAndroidFirestore.getListe(nom, action)
        : await FirebaseDesktopFirestore.getListe(nom, action);
  }

  /// Récupérer le document de cette [collection] avec ce [id]
  static Future getDocumentID(String collection, String id) async {
    return Platform.isAndroid
        ? await FirebaseAndroidFirestore.getDocumentID(collection, id)
        : await FirebaseDesktopFirestore.getDocumentID(collection, id);
  }

  /// Ajouter un document par un [id] à la [collection] avec les données [json]
  static Future ajouterDocumentID(
    String collection,
    String id,
    Map<String, dynamic> json,
  ) async {
    return Platform.isAndroid
        ? await FirebaseAndroidFirestore.ajouterDocumentID(collection, id, json)
        : await FirebaseDesktopFirestore.ajouterDocumentID(collection, id, json);
  }

  /// Modifier un document par un [id] à la [collection] avec les données [json]
  static Future modifierDocument(
    String collection,
    String id,
    Map<String, dynamic> json,
  ) async {
    return Platform.isAndroid
        ? await FirebaseAndroidFirestore.modifierDocument(collection, id, json)
        : await FirebaseDesktopFirestore.modifierDocumentID(collection, id, json);
  }

  /// Supprimer un document par un [id] à la [collection]
  static Future supprimerDocument(String collection, String id) async {
    return Platform.isAndroid
        ? await FirebaseAndroidFirestore.supprimerDocument(collection, id)
        : await FirebaseDesktopFirestore.supprimerDocument(collection, id);
  }
}
