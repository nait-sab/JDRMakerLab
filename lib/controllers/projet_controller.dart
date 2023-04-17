import 'package:flutter/material.dart';
import 'package:jdr_maker/firebase/firebase_service_firestore.dart';
import 'package:jdr_maker/models/projet_model.dart';
import 'package:jdr_maker/models/utilisateur_model.dart';
import 'package:provider/provider.dart';

/// Classe : Projet
///
/// Type : Controller
///
/// Contient le projet actuel dans l'application
class ProjetController extends ChangeNotifier {
  /// Liste des projets
  List<ProjetModel> projets = [];

  /// Données du projet actuel
  ProjetModel? projet;

  // =========================================================
  // Getters
  // =========================================================

  /// Récupérer la liste des projets
  static List<ProjetModel> getProjets(BuildContext context) {
    return Provider.of<ProjetController>(context, listen: false).projets;
  }

  /// Récupérer le projet actuel
  static ProjetModel? getProjet(BuildContext context) {
    return Provider.of<ProjetController>(context, listen: false).projet;
  }

  // =========================================================
  // Actualiser le projet
  // =========================================================

  Future _actualiser() async {
    print("Actualisation call");

    // Stop si aucun projet
    if (projet == null) {
      return;
    }

    notifyListeners();
  }

  /// Actualiser le projet actuel
  static Future actualiser(BuildContext context) async {
    await Provider.of<ProjetController>(context, listen: false)._actualiser();
  }

  // =========================================================
  // Charger un projet
  // =========================================================

  Future _chargerProjet(ProjetModel projet) async {
    print("Charger projet call");
    this.projet = projet;
    notifyListeners();
  }

  /// Charger un projet
  static Future charger(BuildContext context, ProjetModel projet) async {
    await Provider.of<ProjetController>(context, listen: false)._chargerProjet(projet);
  }

  // =========================================================
  // Charger les projets
  // =========================================================

  Future _chargerProjets(UtilisateurModel utilisateur) async {
    print("Charger projets call");
    projets.clear();
    projet = null;

    await FirebaseServiceFirestore.getListe(ProjetModel.nomCollection, (data) {
      ProjetModel projetModel = ProjetModel.fromMap(data);
      if (projetModel.idCreateur == utilisateur.id) {
        projets.add(projetModel);
      }
    });

    notifyListeners();
  }

  /// Charger un projet
  static Future chargerProjets(BuildContext context, UtilisateurModel utilisateur) async {
    await Provider.of<ProjetController>(context, listen: false)._chargerProjets(utilisateur);
  }
}
