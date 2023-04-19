import 'package:flutter/material.dart';
import 'package:jdr_maker/models/utilisateur_model.dart';
import 'package:provider/provider.dart';

/// Classe : Utilisateur
///
/// Type : Controller
///
/// Contient la route actuelle dans l'application
class UtilisateurController extends ChangeNotifier {
  /// Projet sélectionné
  UtilisateurModel? _utilisateur;

  static bool themeSombre = true;

  void actualiser(UtilisateurModel utilisateur) {
    _utilisateur = utilisateur;
    notifyListeners();
  }

  static void changerUtilisateur(BuildContext context, UtilisateurModel utilisateur) {
    Provider.of<UtilisateurController>(context, listen: false).actualiser(utilisateur);
    UtilisateurController.themeSombre = utilisateur.themeSombre;
  }

  static void retirerUtilisateur(BuildContext context) {
    Provider.of<UtilisateurController>(context, listen: false)._utilisateur = null;
  }

  static UtilisateurModel? getUtilisateur(BuildContext context) {
    return Provider.of<UtilisateurController>(context, listen: false)._utilisateur;
  }
}
