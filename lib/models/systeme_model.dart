import 'package:flutter/material.dart';

/// Classe : Système
///
/// Type : Model
///
/// Modèle des systèmes
class SystemeModel extends ChangeNotifier {
  static String nomCollection = "Systemes";

  String id;
  String idCreateur;
  String idProjet;
  String dateModification;
  String nom;
  String contenu;

  SystemeModel({
    required this.id,
    required this.idCreateur,
    required this.idProjet,
    required this.dateModification,
    required this.nom,
    required this.contenu,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "idCreateur": idCreateur,
      "idProjet": idProjet,
      "dateModification": dateModification,
      "nom": nom,
      "contenu": contenu,
    };
  }

  static SystemeModel fromMap(data) {
    return SystemeModel(
      id: data["id"],
      idCreateur: data["idCreateur"],
      idProjet: data["idProjet"],
      dateModification: data["dateModification"],
      nom: data["nom"],
      contenu: data["contenu"],
    );
  }
}
