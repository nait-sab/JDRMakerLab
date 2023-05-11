import 'package:flutter/material.dart';

/// Classe : Personnage
///
/// Type : Model
///
/// Modèle des personnages
class PersonnageModel extends ChangeNotifier {
  static String nomCollection = "Personnages";

  String id;
  String idCreateur;
  String idProjet;
  String dateModification;
  String nom;
  String age;
  String poids;
  String description;
  String histoire;

  /// Métier ou rôle du personnage
  String occupation;

  /// Sexe du personnage (true: Masculin)
  bool sexe;

  /// URL de l'icône utilisé en jeu
  String urlIcone;

  /// URL de l'image d'illustration du personnage
  String urlImage;

  PersonnageModel({
    required this.id,
    required this.idCreateur,
    required this.idProjet,
    required this.dateModification,
    required this.nom,
    required this.age,
    required this.poids,
    required this.description,
    required this.histoire,
    required this.occupation,
    required this.sexe,
    required this.urlIcone,
    required this.urlImage,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "idProjet": idProjet,
      "idCreateur": idCreateur,
      "dateModification": dateModification,
      "nom": nom,
      "age": age,
      "poids": poids,
      "description": description,
      "histoire": histoire,
      "occupation": occupation,
      "sexe": sexe,
      "urlIcone": urlIcone,
      "urlImage": urlImage,
    };
  }

  static PersonnageModel fromMap(data) {
    return PersonnageModel(
      id: data["id"],
      idProjet: data["idProjet"],
      idCreateur: data["idCreateur"],
      dateModification: data["dateModification"],
      nom: data["nom"],
      age: data["age"],
      poids: data["poids"],
      description: data["description"],
      histoire: data["histoire"],
      occupation: data["occupation"],
      sexe: data["sexe"],
      urlIcone: data["urlIcone"],
      urlImage: data["urlImage"],
    );
  }
}
