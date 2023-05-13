import 'package:jdr_maker/models/membre_model.dart';
import 'package:jdr_maker/models/projet_model.dart';
import 'package:jdr_maker/models/utilisateur_model.dart';

/// Classe : Securité
///
/// Type : tool
///
/// Vérifier les autorisation de la personne actuelle
class SecuriteTool {
  static bool creerEvenement(ProjetModel projet, UtilisateurModel utilisateur, List<MembreModel> membres) {
    if (projet.idCreateur == utilisateur.id) {
      return true;
    }

    for (MembreModel membre in membres) {
      if (membre.idMembre == utilisateur.id) {
        return membre.evenementCreation;
      }
    }

    return false;
  }

  static bool modifierEvenement(ProjetModel projet, UtilisateurModel utilisateur, List<MembreModel> membres) {
    if (projet.idCreateur == utilisateur.id) {
      return true;
    }

    for (MembreModel membre in membres) {
      if (membre.idMembre == utilisateur.id) {
        return membre.evenementEdition;
      }
    }

    return false;
  }

  static bool supprimerEvenement(ProjetModel projet, UtilisateurModel utilisateur, List<MembreModel> membres) {
    if (projet.idCreateur == utilisateur.id) {
      return true;
    }

    for (MembreModel membre in membres) {
      if (membre.idMembre == utilisateur.id) {
        return membre.evenementSupprimer;
      }
    }

    return false;
  }

  static bool isCreateur(ProjetModel projet, UtilisateurModel utilisateur) {
    return projet.idCreateur == utilisateur.id;
  }
}
