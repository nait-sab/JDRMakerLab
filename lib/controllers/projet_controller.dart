import 'package:flutter/material.dart';
import 'package:jdr_maker/models/projet_model.dart';
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

  /// Récupérer la liste des projets
  static List<ProjetModel> getProjets(BuildContext context) {
    return Provider.of<ProjetController>(context, listen: false).projets;
  }

  /// Récupérer le projet actuel
  static ProjetModel? getProjet(BuildContext context) {
    return Provider.of<ProjetController>(context, listen: false).projet;
  }
}
