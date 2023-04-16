import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseAndroidFirestore {
  static FirebaseFirestore _instance() {
    return FirebaseFirestore.instance;
  }

  /// Récupérer la collection ayant ce [nom]
  static Future getCollection(String nom) async {
    return await _instance().collection(nom).get();
  }

  /// Récupérer la collection ayant ce [nom] converti par l'[action]
  static Future getListe(String nom, Function action) async {
    var collection = await getCollection(nom);
    var liste = collection.docs.map((document) => document.data()).toList();
    for (var data in liste) {
      action(data);
    }
  }

  /// Récupérer le document de cette [collection] avec ce [id]
  static Future getDocumentID(String collection, String id) async {
    return await _instance().collection(collection).doc(id).get();
  }

  /// Ajouter un document par un [id] à la [collection] avec les données [json]
  static Future ajouterDocumentID(
    String collection,
    String id,
    Map<String, dynamic> json,
  ) async {
    return await _instance().doc(id).set(json);
  }

  /// Modifier un document par un [id] à la [collection] avec les données [json]
  static Future modifierDocument(
    String collection,
    String id,
    Map<String, dynamic> json,
  ) async {
    return await _instance().collection(collection).doc(id).update(json);
  }

  /// Supprimer un document par un [id] à la [collection]
  static Future supprimerDocument(String collection, String id) async {
    return await _instance().collection(collection).doc(id).delete();
  }
}
