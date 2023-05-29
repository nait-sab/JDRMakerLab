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
  String taille;
  String poids;
  String description;
  String histoire;

  /// Métier ou rôle du personnage
  String occupation;

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
    required this.taille,
    required this.poids,
    required this.description,
    required this.histoire,
    required this.occupation,
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
      "taille": taille,
      "poids": poids,
      "description": description,
      "histoire": histoire,
      "occupation": occupation,
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
      taille: data["taille"],
      poids: data["poids"],
      description: data["description"],
      histoire: data["histoire"],
      occupation: data["occupation"],
      urlIcone: data["urlIcone"],
      urlImage: data["urlImage"],
    );
  }
}
