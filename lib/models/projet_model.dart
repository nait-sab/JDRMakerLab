/// Classe : Projet
///
/// Type : Model
///
/// Modèle des projets
class ProjetModel {
  static String nomCollection = "Projets";

  /// ID du projet
  String id;

  /// ID du créateur
  String idCreateur;

  /// Nom du projet
  String nom;

  /// Projet public ou non
  bool isPublic;

  /// Code d'ajout de membre
  String codeMembre;

  /// Code utilisable ou non
  bool codeUtilisable;

  String derniereModification;

  String dateCreation;

  ProjetModel({
    required this.id,
    required this.idCreateur,
    required this.nom,
    required this.isPublic,
    required this.codeMembre,
    required this.codeUtilisable,
    required this.derniereModification,
    required this.dateCreation,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "idCreateur": idCreateur,
      "nom": nom,
      "isPublic": isPublic,
      "codeMembre": codeMembre,
      "codeUtilisable": codeUtilisable,
      "derniereModification": derniereModification,
      "dateCreation": dateCreation
    };
  }

  static ProjetModel fromMap(data) {
    return ProjetModel(
      id: data["id"],
      idCreateur: data["idCreateur"],
      nom: data["nom"],
      isPublic: data["isPublic"],
      codeMembre: data["codeMembre"],
      codeUtilisable: data["codeUtilisable"],
      derniereModification: data["derniereModification"],
      dateCreation: data["dateCreation"],
    );
  }
}
