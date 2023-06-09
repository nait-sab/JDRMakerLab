import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/controllers/navigation_controller.dart';
import 'package:jdr_maker/controllers/projet_controller.dart';
import 'package:jdr_maker/firebase/firebase_service_auth.dart';
import 'package:jdr_maker/interface/menu/menu_bouton.dart';
import 'package:jdr_maker/interface/menu/menu_titre.dart';

class MenuInterface extends StatefulWidget {
  @override
  State<MenuInterface> createState() => _MenuInterfaceState();
}

class _MenuInterfaceState extends State<MenuInterface> {
  @override
  Widget build(BuildContext context) {
    return renduDesktop(context);
  }

  Widget renduDesktop(BuildContext context) {
    return Container(
      width: 250,
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(width: 3, color: App.couleurs().fondSecondaire()),
        ),
      ),
      child: Column(
        children: _getContenu(context),
      ),
    );
  }

  List<Widget> _getContenu(BuildContext context) {
    List<Widget> liste = [];

    liste.add(MenuTitre(texte: "Projet"));
    liste.add(MenuBouton(
      texte: "Explorer",
      icone: Icons.explore_rounded,
      routes: ["/explorer"],
      action: () => _changerRoute("/explorer"),
    ));

    if (ProjetController.getProjet(context) != null) {
      liste.add(MenuBouton(
        texte: "Éditeur",
        icone: Icons.home_rounded,
        routes: [
          "/editeur",
          "/editeur/systeme/liste",
          "/editeur/systeme/ajouter",
          "/editeur/systeme/vue",
          "/editeur/systeme/modifier",
          "/editeur/evenement/liste",
          "/editeur/evenement/ajouter",
          "/editeur/evenement/vue",
          "/editeur/evenement/modifier",
          "/editeur/personnage/liste",
          "/editeur/personnage/ajouter",
          "/editeur/personnage/vue",
          "/editeur/personnage/modifier",
          "/editeur/lieu/liste",
          "/editeur/lieu/ajouter",
          "/editeur/lieu/vue",
          "/editeur/lieu/modifier",
          "/editeur/objet/liste",
          "/editeur/objet/ajouter",
          "/editeur/objet/vue",
          "/editeur/objet/modifier",
        ],
        action: () => _changerRoute("/editeur"),
      ));
    }

    liste.add(MenuTitre(texte: "Social"));
    liste.add(MenuBouton(
      texte: "Amis",
      icone: Icons.group_rounded,
      routes: [],
      action: () => _changerRoute("/amis"),
    ));
    liste.add(MenuBouton(
      texte: "Jouer",
      icone: Icons.play_arrow_rounded,
      routes: ["/jouer"],
      action: () => _changerRoute("/jouer"),
    ));

    liste.add(MenuTitre(texte: "Général"));
    liste.add(MenuBouton(
      texte: "Paramètres",
      icone: Icons.settings_rounded,
      routes: [],
      action: () => _changerRoute("/profil/parametres"),
    ));
    liste.add(MenuBouton(
      texte: "Déconnexion",
      icone: Icons.logout_rounded,
      routes: [],
      action: _deconnexion,
    ));

    return liste;
  }

  /// Déconnecter l'utilisateur
  Future _deconnexion() async {
    await FirebaseServiceAuth.deconnexion(context);
    await decharger();
    _changerRoute("/connexion");
  }

  Future decharger() async => await ProjetController.dechargerProjets(context);
  void _changerRoute(String route) => NavigationController.changerView(context, route);
}
