import 'package:flutter/material.dart';
import 'package:jdr_maker/controllers/membre_controller.dart';
import 'package:jdr_maker/controllers/personnage_controller.dart';
import 'package:jdr_maker/controllers/utilisateur_controller.dart';
import 'package:jdr_maker/firebase/firebase_service_firestore.dart';
import 'package:jdr_maker/models/membre_model.dart';
import 'package:jdr_maker/models/personnage_model.dart';
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
  List<PersonnageModel> personnages = [];

  // Membres
  List<MembreModel> membresModeles = [];
  List<UtilisateurModel> membres = [];

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

  /// Récupérer les personnages du projet actuel
  static List<PersonnageModel> getPersonnages(BuildContext context) {
    return Provider.of<ProjetController>(context, listen: false).personnages;
  }

  /// Récupérer les modèles des membres du projet actuel
  static List<MembreModel> getMembreModeles(BuildContext context) {
    return Provider.of<ProjetController>(context, listen: false).membresModeles;
  }

  /// Récupérer les membres du projet actuel
  static List<UtilisateurModel> getMembres(BuildContext context) {
    return Provider.of<ProjetController>(context, listen: false).membres;
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

    personnages = await PersonnageController.chargerPersonnages(projet!);
    membresModeles = await MembreController.chargerMembresModeles(projet!);
    membres = await UtilisateurController.chargerMembres(membresModeles);

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
    personnages = await PersonnageController.chargerPersonnages(projet);
    membresModeles = await MembreController.chargerMembresModeles(projet);
    membres = await UtilisateurController.chargerMembres(membresModeles);

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

    projet = null;
    projets = [];
    personnages = [];
    membresModeles = [];
    membres = [];

    // Récupérer les id des projets partagés
    List<String> projetsPartagerID = [];
    await FirebaseServiceFirestore.getListe(MembreModel.nomCollection, (data) {
      MembreModel membre = MembreModel.fromMap(data);
      if (membre.idMembre == utilisateur.id) {
        projetsPartagerID.add(membre.idProjet);
      }
    });

    // Récupérer les projets Firebase si créateur ou membre
    await FirebaseServiceFirestore.getListe(ProjetModel.nomCollection, (data) {
      ProjetModel projetModel = ProjetModel.fromMap(data);
      if (projetModel.idCreateur == utilisateur.id || projetsPartagerID.contains(projetModel.id)) {
        projets.add(projetModel);
      }
    });

    projets.sort((a, b) => b.derniereModification.compareTo(a.derniereModification));
    notifyListeners();
  }

  /// Charger un projet
  static Future chargerProjets(BuildContext context, UtilisateurModel utilisateur) async {
    await Provider.of<ProjetController>(context, listen: false)._chargerProjets(utilisateur);
  }

  // =========================================================
  // Décharger le projet
  // =========================================================

  Future _dechargerProjet() async {
    print("Décharger projet call");
    projet = null;
    notifyListeners();
  }

  /// Charger un projet
  static Future dechargerProjets(BuildContext context) async {
    await Provider.of<ProjetController>(context, listen: false)._dechargerProjet();
  }

  // =========================================================
  // Supprimer le projet
  // =========================================================

  Future _supprimer() async {
    print("supprimer projet call");

    if (projet == null) {
      return;
    }

    for (PersonnageModel personnage in personnages) {
      await FirebaseServiceFirestore.supprimerDocument(PersonnageModel.nomCollection, personnage.id);
    }

    for (MembreModel membre in membresModeles) {
      await FirebaseServiceFirestore.supprimerDocument(MembreModel.nomCollection, membre.id);
    }

    await FirebaseServiceFirestore.supprimerDocument(ProjetModel.nomCollection, projet!.id);
    projet = null;
    notifyListeners();
  }

  /// Charger un projet
  static Future supprimerProjet(BuildContext context) async {
    UtilisateurModel utilisateur = UtilisateurController.getUtilisateur(context)!;
    ProjetController projetController = Provider.of<ProjetController>(context, listen: false);
    await projetController._actualiser();
    await projetController._supprimer();
    await projetController._chargerProjets(utilisateur);
  }
}
