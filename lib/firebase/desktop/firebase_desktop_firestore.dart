import 'package:firedart/firedart.dart';

class FirebaseDesktopFirestore {
  static Firestore _instance() {
    return Firestore.instance;
  }

  /// Récupérer la collection ayant ce [nom]
  static Future<Page<Document>> getCollection(String nom) async {
    return await _instance().collection(nom).get();
  }

  /// Récupérer la collection ayant ce [nom] converti par l'[action]
  static Future getListe(String nom, Function action) async {
    var collection = await getCollection(nom);
    for (var document in collection) {
      action(document.map);
    }
  }

  /// Récupérer le document de cette [collection] avec ce [id]
  static Future getDocumentID(String collection, String id) async {
    return await _instance().collection(collection).document(id).get();
  }

  /// Ajouter un document par un [id] à la [collection] avec les données [json]
  static Future ajouterDocumentID(
    String collection,
    String id,
    Map<String, dynamic> json,
  ) async {
    return await _instance().collection(collection).document(id).set(json);
  }

  /// Modifier un document par un [id] à la [collection] avec les données [json]
  static Future modifierDocumentID(
    String collection,
    String id,
    Map<String, dynamic> json,
  ) async {
    return await _instance().document(id).update(json);
  }

  /// Supprimer un document par un [id] à la [collection]
  static Future supprimerDocument(String collection, String id) async {
    return await _instance().collection(collection).document(id).delete();
  }
}
