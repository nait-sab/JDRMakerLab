import 'package:flutter/material.dart';
import 'package:jdr_maker/controllers/navigation_controller.dart';
import 'package:jdr_maker/views/amis/amis_view.dart';
import 'package:jdr_maker/views/editeur/apps/personnage/personnage_liste_view.dart';
import 'package:jdr_maker/views/editeur/editeur_view.dart';
import 'package:jdr_maker/views/explorer/explorer_view.dart';
import 'package:jdr_maker/views/jouer/jouer_view.dart';
import 'package:jdr_maker/views/login/connexion_view.dart';
import 'package:jdr_maker/views/login/inscription_view.dart';
import 'package:jdr_maker/views/profil/profil_view.dart';
import 'package:jdr_maker/views/projet/projet_create_view.dart';
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

      case "/editeur":
        liste.add(MaterialPage(child: EditeurView()));
        break;

      case "/amis":
        liste.add(MaterialPage(child: AmisView()));
        break;

      case "/jouer":
        liste.add(MaterialPage(child: JouerView()));
        break;

      case "/profil/compte":
        liste.add(MaterialPage(child: ProfilView(onglet: "compte")));
        break;

      case "/profil/feuilles":
        liste.add(MaterialPage(child: ProfilView(onglet: "feuilles")));
        break;

      case "/profil/parametres":
        liste.add(MaterialPage(child: ProfilView(onglet: "parametres")));
        break;

      case "/nouveau_projet":
        liste.add(MaterialPage(child: ProjetCreateView()));
        break;

      // =======================================================
      // Application - Personnage
      // =======================================================
      case "/editeur/personnage/liste":
        liste.add(MaterialPage(child: PersonnageListeView()));
        break;

      case "/editeur/personnage/vue":
        liste.add(MaterialPage(child: JouerView()));
        break;

      case "/editeur/personnage/ajouter":
        liste.add(MaterialPage(child: JouerView()));
        break;

      case "/editeur/personnage/modifier":
        liste.add(MaterialPage(child: JouerView()));
        break;
    }

    return liste;
  }
}
