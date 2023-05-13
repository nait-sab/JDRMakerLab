/// Classe : Membre
///
/// Type : Model
///
/// Membre d'un projet
class MembreModel {
  static String nomCollection = "Membres";

  String id;
  String idProjet;
  String idMembre;

  // =====================
  // Droits membre
  // =====================

  // App - Evenement
  bool evenementCreation;
  bool evenementEdition;
  bool evenementSupprimer;

  MembreModel({
    required this.id,
    required this.idProjet,
    required this.idMembre,
    required this.evenementCreation,
    required this.evenementEdition,
    required this.evenementSupprimer,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "idProjet": idProjet,
      "idMembre": idMembre,
      "evenementCreation": evenementCreation,
      "evenementEdition": evenementEdition,
      "evenementSupprimer": evenementSupprimer,
    };
  }

  static MembreModel fromMap(data) {
    return MembreModel(
      id: data["id"],
      idProjet: data["idProjet"],
      idMembre: data["idMembre"],
      evenementCreation: data["evenementCreation"],
      evenementEdition: data["evenementEdition"],
      evenementSupprimer: data["evenementSupprimer"],
    );
  }
}
