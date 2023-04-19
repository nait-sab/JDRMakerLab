import 'package:flutter/material.dart';
import 'package:jdr_maker/controllers/utilisateur_controller.dart';

/// Couleurs de l'application
class Couleurs {
  Color fondPrincipale() {
    return UtilisateurController.themeSombre ? Color(0xff38383D) : Color(0xffD2D3DB);
  }

  Color fondSecondaire() {
    return UtilisateurController.themeSombre ? Color(0xff2B2A33) : Color(0xffE4E5F1);
  }

  Color important() {
    return UtilisateurController.themeSombre ? Colors.white : Color(0xff484B6A);
  }

  Color texte() {
    return UtilisateurController.themeSombre ? Color(0xffADA9C0) : Color(0xff484B6A);
  }

  Color violet() {
    return UtilisateurController.themeSombre ? Color(0xff9646EF) : Color(0xff6200EE);
  }

  Color vert() {
    return UtilisateurController.themeSombre ? Color(0xff43D1A7) : Color(0xff1B5E20);
  }

  Color rouge() {
    return UtilisateurController.themeSombre ? Color(0xffCF6679) : Color(0xffB71C1C);
  }

  Color orange() {
    return UtilisateurController.themeSombre ? Color(0xffFF862E) : Color(0xffE65100);
  }

  Color jaune() {
    return UtilisateurController.themeSombre ? Color(0xffC7AC60) : Color(0xffCA9A12);
  }

  Color bleu() {
    return UtilisateurController.themeSombre ? Color(0xff6569C3) : Color(0xff1E24BE);
  }
}
