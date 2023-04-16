import 'package:flutter/material.dart';
import 'package:jdr_maker/controllers/navigation_controller.dart';
import 'package:jdr_maker/views/explorer/explorer_view.dart';
import 'package:jdr_maker/views/login/connexion_view.dart';
import 'package:jdr_maker/views/login/inscription_view.dart';
import 'package:provider/provider.dart';

/// Classe : Routes
///
/// Type : Config
///
/// Contient les routes de l'application
///
/// Connecté au controlleur Navigation
class Routes {
  static List<Page> applicationRoutes(context) {
    NavigationController navigation = Provider.of<NavigationController>(context);
    List<Page> liste = [];

    // Route par défaut
    liste.add(MaterialPage(child: ConnexionView()));

    // =======================================================
    // Liste des routes
    // =======================================================
    switch (navigation.route) {
      // =======================================================
      // Login
      // =======================================================
      case "/connexion":
        liste.add(MaterialPage(child: ConnexionView()));
        break;
      case "/inscription":
        liste.add(MaterialPage(child: InscriptionView()));
        break;

      // =======================================================
      // Routes de l'accueil
      // =======================================================
      case "/explorer":
        liste.add(MaterialPage(child: ExplorerView()));
        break;
    }

    return liste;
  }
}
