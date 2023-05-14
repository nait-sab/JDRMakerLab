import 'package:flutter/material.dart';

/// Classe : Utilisateur
///
/// Type : Model
///
/// Modèle des utilisateurs
class UtilisateurModel extends ChangeNotifier {
  static String nomCollection = "Utilisateurs";

  String id;
  String mail;
  String pseudo;
  String imageUrl;
  bool themeSombre;

  UtilisateurModel({
    required this.id,
    required this.mail,
    required this.pseudo,
    required this.imageUrl,
    required this.themeSombre,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "mail": mail,
      "username": pseudo,
      "imageUrl": imageUrl,
      "themeSombre": themeSombre,
    };
  }

  static UtilisateurModel fromMap(data) {
    return UtilisateurModel(
      id: data["id"],
      mail: data["mail"],
      pseudo: data["username"],
      imageUrl: data["imageUrl"],
      themeSombre: data["themeSombre"],
    );
  }
}
