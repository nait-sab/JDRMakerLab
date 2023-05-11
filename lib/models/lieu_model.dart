/// Classe : Lieu
///
/// Type : Model
///
/// Modèle des lieux
class LieuModel {
  static String nomCollection = "Lieux";

  String id;
  String idCreateur;
  String idProjet;
  String dateModification;
  String nom;
  String description;
  String urlImage;

  LieuModel({
    required this.id,
    required this.idCreateur,
    required this.idProjet,
    required this.dateModification,
    required this.nom,
    required this.description,
    required this.urlImage,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "idCreateur": idCreateur,
      "idProjet": idProjet,
      "dateModification": dateModification,
      "nom": nom,
      "description": description,
      "urlImage": urlImage,
    };
  }

  static LieuModel fromMap(data) {
    return LieuModel(
      id: data["id"],
      idCreateur: data["idCreateur"],
      idProjet: data["idProjet"],
      dateModification: data["dateModification"],
      nom: data["nom"],
      description: data["description"],
      urlImage: data["urlImage"],
    );
  }
}
